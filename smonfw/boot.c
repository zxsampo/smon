/* smonfw/boot.c  --  smon boot: locate highest bootno image and jump there
 * Copyright (c) 2020 Sampo Kellomaki (sampo-smon20@zxid.org). All rights reserved.
 * NO WARRANTY. See file LICENSE for licensing terms.
 *
 * 20201109 created --Sampo
 *
 * This function is called from reset vector as the very first thing. Rather than
 * start all manner of initializations, our first order of business is to simply
 * find an image to run. We look in the flash memory on every 32 KB page boundary
 * and look for an image. If image seems viable, we check whether its bootno
 * is bigger than anything thus far seen, and if so, verify the crc16. If crc16
 * fails we move on to next slot. If crc16 is good, we remember the image as
 * best candidate so far. Once all slots have been checked, we 
 * map the best candidate to address 0x8000 and jump to that address.
 *
 * See [UG] "CC253x/4x User's Guide (Rev. F)", swru191f.pdf, Texas Instruments, 2014.
 */

#include "smon.h"

void delay_ms(u16 delay)
{
  u16 i;
  for (;delay; --delay) {
    for (i=MILLISEC_ITERS; i; --i) ;  // *** danger of being optimized away
  }
}

void blink_R(u8 iter, u16 delay)
{
  for (; iter; --iter) {
    LED_R = 0;
    delay_ms(delay);
    LED_R = 1;
    delay_ms(delay);
  }
  delay_ms(delay+delay);  /* Final off stage shall last longer, so it is possible to count. */
}

__xdata struct dma_conf dma[5];  /* DMA configurations: 5*8=40 bytes */

u16 crc16(u16 len, __xdata u8* data)
{
  // see [UG] sec. 14 "Random-Number Generator" and sec. 14.2.3 "CRC16", p.144
  /* CRC-16-IBM aka CRC-16 and CRC-16-ANSI
   * Bisync, Modbus, USB, ANSI X3.28, SIA DC-07, ARC, many others
   * 0x8005 	0xA001 	0x4003 	0xC002 	even
   * x16 + x15 + x2 + 1
   * Init: 0000 (ARC)
   * https://web.archive.org/web/20190527220400/http://www.ross.net/crc/download/crc_v3.txt
   */
  RNDL = 0;  /* Initial value 0x0000 */
  RNDL = 0;
#if 1
  /* Use RND hardware without DMA */
  for (; len; --len, ++data) {
    RNDH = *data;
  }
#else
  /* Use RND hardware with DMA. There is no specific trigger, but CRC
   * register can process new input on every clock cycle, so we just
   * need to keep the DMA rolling. Other complication is that maximum
   * transfer count is 8192 (max value 8191 is checked after transfer)
   * bytes, thus we can not CRC entire 32 KB block in one go. This
   * complication plus the immediate need for result, puts the whole
   * DMA scheme in doubt. */
  
  dma[4].srcaddrH = data >> 8;
  dma[4].srcaddrL = data & 0xff;
  dma[4].destaddrH = 0x70BD >> 8;   /* Position of RNDH register in XDATA memory */
  dma[4].destaddrL = 0x70BD & 0xff;
  dma[4].mode_trig = 0x20;  /* byte single block mode, no trig */
  dma[4].flags = 0x42;      /* source increment, destination fixed, no irq, hiprio */
  DMA0CFGL = &dma[0] & 0xff;
  DMA0CFGH = &dma[0] >> 8;
  DMA1CFGL = &dma[1] & 0xff;
  DMA1CFGH = &dma[1] >> 8;
  
  while (len) {
    if (len > 8192) {
      dma[4].vlen_lenH = (8191 >> 8) & 0x1f;
      dma[4].vlen_lenL = 8191 & 0x00ff;
      len -= 8192;
    } else {
      --len;
      dma[4].vlen_lenH = (len >> 8) & 0x1f;
      dma[4].vlen_lenL = len & 0xff;
      len = 0;
    }
    DMAARM = 0x10;
    DMAREQ = 0x10;              /* Trigger DMA */
    while (!(DMAIRQ & 0x10)) ;  /* Busy wait for DMA to complete */
  }
#endif
  return RNDH << 8 | RNDL;
}

void boot()
{
  __xdata struct smon_image* img = (__xdata struct smon_image*)0x8000;
  u8 cand;
  u8 bootno;
  
  /* Turn on red led, off green led */
  
  P1SEL = 0x00;  /* This is reset value, but in case of softreset... select GPIO (not peripheral) */
  P1DIR = 0x03;  /* Make P1_0 (LED_R) and P1_1 (LED_G) outputs */
  LED_R = 0;     /* Drive cathode of the led to 0v. The anode is at 3v3 so the led will light up. */
  LED_G = 1;     /* Drive cathode of the led to 3v3. The anode is at 3v3 so the led will be off. */
  
  /* Iterate over all banks to find highest priority boot image.
   * FMAP controls mapping of flash banks to code space in 0x8000..0xffff
   * MEMCTR.XBANK controls mapping flash banks to XDATA space 0x8000..0xffff */

  for (bootno = cand = 0, MEMCTR = 1; MEMCTR < 8; MEMCTR++) {
    if (img->jmp != 0x02)       /* must be a long jump instruction; acts also as "signature" */
      continue;
    if (img->where_H < 0x80)    /* jump must be to 0x8000..0xffff address block */
      continue;
    if (img->bootno <= bootno)  /* there is already a more eligible image */
      continue;
    if (img->len < 16)          /* too short */
      continue;
    if (img->crc16 == 0x0a0d)   /* CRC check omitted due to CRLF */
      goto update_candidate;
    if (img->crc16 != crc16(img->len, img->image))
      continue;
  update_candidate:
    bootno = img->bootno;       /* Highest boot number so far becomes the candidate. */
    cand = MEMCTR;
  }
  
  LED_R = 1;
  if (bootno) {
    FMAP = cand;
    __asm__ ( "ljmp 0x8000" );  /* Start executing the image, never come back */
  }
  /* Nothing found, busy loop forever */
  while (1)
    blink_R(2,500);
}

/* EOF - smonfw/boot.c */
