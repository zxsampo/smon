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
