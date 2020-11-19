/* smonfw/setup.c  --  smon hardware setup
 * Copyright (c) 2020 Sampo Kellomaki (sampo-smon20@zxid.org). All rights reserved.
 * NO WARRANTY. See file LICENSE for licensing terms.
 *
 * 20201111 created --Sampo
 *
 * This function is called by main in smonmain.c (which was called by
 * boot() from reset vector).  Nitty gritty hardware seup is performed
 * here. Please note that boot() only did the bare minimum it needed
 * to be able to run.
 *
 * See [UG] "CC253x/4x User's Guide (Rev. F)", swru191f.pdf, Texas Instruments, 2014.
 */

#include "smon.h"

void delay_ms2(u16 delay)
{
  u16 i;
  for (;delay; --delay) {
    for (i=MILLISEC_ITERS; i, --i) ;
  }
}

void blink_G(u8 iter, u16 delay)
{
  for (; iter; --iter) {
    LED_G = 0;
    delay_ms2(delay);
    LED_G = 1;
    delay_ms2(delay);
  }
  delay_ms2(delay+delay);  /* Final off stage shall last longer, so it is possible to count. */
}

void setup()
{
  P1SEL = 0x00;
  P1DIR = 0x03;  /* Make P1_0 (LED_R) and P1_1 (LED_G) outputs */
  LED_R = 1;
  LED_G = 0;
  
  /* DMA */
  
  /* UART */

  /* RADIO */
}

/* EOF - smonfw/setup.c */
