/* smonfw/smonmain.c  --  smon main function and loop
 * Copyright (c) 2020 Sampo Kellomaki (sampo-smon20@zxid.org). All rights reserved.
 * NO WARRANTY. See file LICENSE for licensing terms.
 *
 * 20201111 created --Sampo
 *
 * This function is called by boot() (which was called from reset vector).
 * The first order of business is to set up hardware, see setup() in smonfw/setup.c,
 * and then enter main loop, reading inputs and sending outputs.
 *
 * See [UG] "CC253x/4x User's Guide (Rev. F)", swru191f.pdf, Texas Instruments, 2014.
 */

#include "smon.h"

void delay_ms2(u16 delay)
{
  u16 i;
  for (;delay; --delay) {
    for (i=MILLISEC_ITERS; i; --i) ;
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

void main()
{
  setup();
  while (1) {
    blink_G(2,500);
  }
#if 0
  /* Turn on red led, off green led */
  
  P1SEL = 0x00;  /* This is reset value, but in case of softreset... select GPIO (not peripheral) */
  P1DIR = 0x03;  /* Make P1_0 (LED_R) and P1_1 (LED_G) outputs */
  LED_R = 0;     /* Drive cathode of the led to 0v. The anode is at 3v3 so the led will light up. */
  LED_G = 1;     /* Drive cathode of the led to 3v3. The anode is at 3v3 so the led will be off. */
#endif
}

/* EOF - smonfw/smonmain.c */
