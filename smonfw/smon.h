/* smonfw/smon.h  --  smon data structures
 * Copyright (c) 2020 Sampo Kellomaki (sampo-smon20@zxid.org) All rights reserved.
 * NO WARRANTY. See file LICENSE for licensing terms.
 *
 * 20201109 created --Sampo
 *
 * See users guide "CC253x/4x User's Guide (Rev. F)", swru191f.pdf, Texas Instruments, 2014.
 */

#ifndef _smon_h
#define _smon_h

/* Flash image header. The boot loader uses these images to locate
 * code to execute. Although image may be at many locations, they
 * are generally aligned at 2 KB flash pages and due to limits
 * of banked code memory, can not easily be over 32 KB. Most common
 * arrangement is for image to start at 32 KB bondary and contain
 * code that assumes to be loaded to address 0x8000.
 *
 * The bootno field (release number) is used to set the boot priority of an image.
 */

struct smon_image {
  u8  jmp;      /* 0x8000 op code for jump */
  u8  where_L;  /* 0x8001 address of jump L */
  u8  where_H;  /* 0x8002 address of jump H */
  u8  bootno;   /* 0x8003 image boot priority number */
  u16 len;      /* 0x8004 length of the image (and header including crc16) */
  u16 crc16;    /* 0x8006 checksum for validating the image */
  u8  image[0]; /* 0x8008 The image data. */
};

/* Packet (message) format follows the IEEE-802.15.4 message.
 * In particular, there is a length field and fcf fields.
 * The Destination and Source address formats are fixed to 16 bit
 * and the PAN_ID compression is used, leading to the address
 * structure below.
 * This expresses the standard headers. The operation specific headers appear
 * in their own structs.
 */

struct smon_packet {
  u8  len;
  u8  fcf1;
  u8  fcf2;
  u8  seqno;
  u16 pan_id;    /* network ID */
  u16 destaddr;  /* address of sender */
  u16 srcaddr;   /* address of target, can be broadcast address 0xffff */
  u8  req_id;    /* From request, typically '1' or '0' for spontaneous message */
  u8  op;
  u8  payload[0];
}; /* 12 bytes for std headers */

/* Stat response packet, excluding std headers */

struct smon_stat_rp {
    u8   whyboot;   /* Reason for most recent boot: P=Power-on, R=Reset line, W=Watchdog, S=sw */
    i8   T_core;    /* CPU core temperature -128..127 degrees Celcius */
    u32  us;        /* microseconds since boot */
    i32  ux_ts;     /* Wall Clock Time in seconds since Unix epoch */
    u8   cur_flash; /* Flash page number of the currently running image */
    u8   cur_rel;   /* Release number of the currently running image */
    u16  cur_crc16; /* CRC16 of the currently running image */
    u8   nxt_flash; /* Flash page number of the image that would be selected in boot */
    u8   nxt_rel;   /* Release number of the image that would be selected in boot */
    u16  nxt_crc16; /* CRC16 of the image that would be selected in boot */
};  /* 18 bytes */

#endif /* _smon_h */
