/* smonfw/boot.c  --  smon boot: locate highest bootno image and jump there
 * Copyright (c) 2020 Sampo Kellomaki (sampo-smon20@zxid.org) All rights reserved.
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
 * See users guide "CC253x/4x User's Guide (Rev. F)", swru191f.pdf, Texas Instruments, 2014.
 */

#include "smon.h"

void boot()
{
  __xdata struct smon_image* img = (__xdata struct smon_image*)0x8000;

  // FMAP controls mapping of flash banks to code space in 0x8000..0xffff
}

/* EOF - smonfw/boot.c */
