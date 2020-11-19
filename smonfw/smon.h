/* smonfw/smon.h  --  smon data structures
 * Copyright (c) 2020 Sampo Kellomaki (sampo-smon20@zxid.org). All rights reserved.
 * NO WARRANTY. See file LICENSE for licensing terms.
 *
 * 20201109 created --Sampo
 *
 * See [UG] "CC253x/4x User's Guide (Rev. F)", swru191f.pdf, Texas Instruments, 2014.
 * See /apps/share/sdcc/include/mcs51/cc2530.h
 */

#ifndef _smon_h
#define _smon_h

#include <cc2530.h>
#include <stdint.h>

typedef uint8_t  u8;
typedef int8_t   s8;
typedef uint16_t u16;
typedef int16_t  s16;
typedef uint32_t u32;
typedef int32_t  s32;
#ifdef __SDCC_LONGLONG
typedef uint64_t u64;
typedef int64_t  s64;
#endif

/* See [UG] Table 8-2 "DMA Configuration-Data Structure", p.99 */
struct dma_conf {
  u8  srcaddrH;   /* Seems these are in bigendian order */
  u8  srcaddrL;
  u8  destaddrH;
  u8  destaddrL;
  u8  vlen_lenH;  /* combined VLEN mode, typically 0, and 5 highest bits of transfer count */
  u8  lenL;       /* transfer count, lowest bits. Max count is 8191. */
  u8  mode_trig;  /* Mode and trigger */
  u8  flags;      /* Increments, etc. */
};

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
  u8  jmp;      /* 0x8000 op code for jump, must be LJMP, i.e. 0x02 */
  u8  where_L;  /* 0x8001 address of jump L */
  u8  where_H;  /* 0x8002 address of jump H, must be >= 0x80 */
  u8  bootno;   /* 0x8003 image boot priority number. Must be at least 1. */
  u16 len;      /* 0x8004 length of the image (and header including crc16). Must be at least 16. */
  u16 crc16;    /* 0x8006 checksum for validating the image, excluding earlier header fields */
  u8  image[0]; /* 0x8008 The image data. */
}; /* 8 bytes */

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
  u8   ieee_addr[8];  /* Unique 64 bit IEEE address from the MCU addr 0x780c, see [UG] p.28 */
};  /* 26 bytes */

#define MILLISEC_ITERS 4000 /* Number of iterations of an empty loop (assume 8 clocks per iteration) to make 1 millisecond at 32 MHz clock */

/* Mapping of I/O port pins to bits: Symbolic to physical.
 * The P1_0 and such are defined in cc2530.h as SBIT(P1_0, 0x90, 0),
 * which uses the SBIT definition in compiler.h  */

#define RX0      P0_2   /* UART0 RX input */
#define TX0      P0_3   /* UART0 TX output */
#define SWRD     P0_6   /* A6 analog input for reading switches */
#define LID      P0_7   /* A7 analog input for reading light intensity detector */
#define LED_R    P1_0   /* output to drive anode of LED_R to gnd (confusingly named LED_R_A) */
#define LED_G    P1_1   /* output to drive anode of LED_G to gnd (confusingly named LED_G_A) */
#define I2C_SCL  P1_2   /* bit banging I2C clock output */
#define W1_DATA  P1_6   /* bit banging 1-wire data input / output */
#define I2C_SDA1 P2_0   /* bit banging I2C data i/o for TH1 */
#define DBG_DAT  P2_1   /* hardware debugger data i/o */
#define DBG_CLK  P2_2   /* hardware debugger clock */
#define I2C_SDA2 P2_3   /* bit banging I2C data i/o for TH2 */
#define I2C_SDA3 P2_4   /* bit banging I2C data i/o for TH3 */

void setup();

#endif /* _smon_h */
