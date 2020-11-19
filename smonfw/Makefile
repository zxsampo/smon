# smonfw/Makefile
# Copyright (c) 2020 Sampo Kellomaki (sampo-smon20@zxid.org). All Rights Reserved.
# NO WARRANTY. See file LICENSE for licensing terms.
#
# This Makefile is prepared for building several target binaries for
# several target architectures with cross compilers. There is no
# configure script. All options are set by selection of ARCH variable
# and overriding make variables from command line. If you plan to
# override, you should study this Makefile to see if the variable
# in question uses ?= and += constructs. Most of them do. You should
# also study the cross compilation setup for your target architecture
# 'in, e.g. ifeq ($(ARCH),i686)...endif block.'
# 
# Examples:
#
# make smon.hex ARCH=mcs51-cc2530
# - Builds the smon firmware for Texas Instruments / Chipcon CC2530 MCU 
# 
# make scp_dut ARCH=mcs51-cc2530
# - Builds the firmware and copies it to device under test
#
# 20201118 created mcs-cc2530 architecture and smon.hex target --Sampo

PROJ_NAME=smon
# edit this to change version number in C code
SMON_VERSION='"0.1"'

SMON_OBJS= boot.o smonmain.o setup.o

ARC?=ar -crs
ARX?=ar -x
STRIP?=strip
GCOV?=gcov
LCOV?=lcov
GPERF?=gperf
SWIG?=swig
GENHTML?=genhtml
ECHO?=echo
CP?=cp
PERL:=perl
SHELL:=bash
LD=$(CC)
STRIP?=strip
ARCH_PREFIX=
SCP=scp
LDSCRIPT_INC=.

# NEW: put dut in /etc/hosts
#DUT_IPADDR=212.16.105.13

#SHARED_FLAGS=-shared --export-all-symbols -Wl,--whole-archive -Wl,--allow-multiple-definition
# --export-all-symbols does not seem to work on gcc-4.6.1... try -Wl,--export-dynamic instead
SHARED_FLAGS?=-shared -Wl,--export-dynamic -Wl,--whole-archive -Wl,--allow-multiple-definition
SHARED_CLOSE?=-Wl,--no-whole-archive

# Default architecture
ARCH?=mcs51-cc2530

ifeq ($(ARCH),)
# Architecture guesser (only works for native builds and only of output of uname is the target name)
ARCH=$(shell uname)
$(warning Guessed ARCH=$(ARCH))
endif

ifeq ($(ARCH),Linux)
### Flags for Linux 2.6 native compile (gcc + gnu binutils), using dynamic linking
### Native compile may work for many architectures, but is generally used for x86_64
CFLAGS ?= -Os -g -fPIC
#CFLAGS ?= -g -Wno-main -I.
#CFLAGS ?= -O0 -g -fPIC -Werror
CFLAGS += -DSMON_VERSION=$(SMON_VERSION) -std=c99 -Wall -Wextra -Wno-unused-parameter
CDEF+=-DLINUX
# Using PTHREAD helps to avoid problems in multithreaded programs, such as Java servlets
CDEF+= -DUSE_PTHREAD -pthread
LIBS+=-pthread
SO_LIBS+=$(LIBS)
CFLAGS += $(CDEF)
ARCH_FOUND=1     # Marks that target has been detected
endif

ifeq ($(ARCH),i686)
### Flags for statically linked Linux on 32bit i686 (Edison) target
### Host gcc + gnu binutils, compiled on x86_64 host
# make i686/smartsod ARCH=i686
ARCH_PREFIX=i686/
PSROOT?=../i686/i686root
CFLAGS ?= -Os -g
#CFLAGS ?= -g -Wno-main -I.
#CFLAGS ?= -O0 -g -Werror
CFLAGS += -DSMON_VERSION=$(SMON_VERSION) -std=c99 -Wall -Wextra -Wno-unused-parameter
CFLAGS += -m32 -march=pentiumpro -DSIMUPTY
CFLAGS += -I$(PSROOT)/include
LDFLAGS+= -Wl,--gc-sections -static -m32 -L$(PSROOT)/lib
SHARED_FLAGS += -Wl,--gc-sections -m32 -L$(PSROOT)/lib
SMON_OBJS= smon.o debug.o setup.o clk_setup.o uart.o minprintf.o mintime.o
LINKERFILE=i686.ld
ARCH_FOUND=1     # Marks that target has been detected
endif

ifeq ($(ARCH),arm-stm32f0)
### arm-stm32f0 arch is for building the firmware for STM32F070x6 microcontroller
### on EVSE MCU board (there is no operating system). This is the smaller flash model.
### This is a cross compilation arch requiring ARM tool chain, e.g.
#     apt-get install binutils-arm-none-eabi libnewlib-arm-none-eabi gcc-arm-none-eabi
#     apt-get install gdb-arm-none-eabi  # no longer available, use gdb-multiarch instead
### and some files from SDK that can be downloaded from software section of stm32f030
### web page on st.com. For example the "cube" development kit en.stm32cubef0.zip
### from which following files were extracted (they are checked in git for convenience):
#     STM32Cube_FW_F0_V1.9.0/Drivers/CMSIS/Device/ST/STM32F0xx/Include/
#       stm32f0xx.h     - Generic include for STM32F0 series. This includes
#       stm32f070x6.h   - based on -DSTM32F070x6 macro definition
#       - Contains definitions of nearly all I/O registers and bits
#       system_stm32f0xx.h
#     STM32Cube_FW_F0_V1.9.0/Drivers/CMSIS/Device/ST/STM32F0xx/Source/
#       Templates/gcc/startup_stm32f030x6.s
#       - Despite name works for STM32F030F4 as well, according to comment in the file
#       - First initializations, e.g. clocks; calls SystemInit() in system_stm32f0xx.c
#       - calls main() of C
#       Templates/system_stm32f0xx.c
#     STM32Cube_FW_F0_V1.9.0/Drivers/CMSIS/Include/core_cm0.h  - ARMv6-M Cortex-M0 defines
#
# arm-none-eabi-gcc --print-multi-lib
# GCC_EXEC_PREFIX=/usr/lib/arm-none-eabi/lib/armv6-m/
#
# make smcu-firmware.hex ARCH=arm-stm32f
#PLATFORM=stm32f0
PLATFORM=
ARMBIN=/usr/local/arm-bin/
PATH:=$(PATH):$(ARMBIN)
VPATH = .
ARC=arm-none-eabi-ar -crs
CC=arm-none-eabi-gcc
LD=arm-none-eabi-gcc
#LD=GCC_EXEC_PREFIX=/usr/lib/arm-none-eabi/lib/armv6-m/ arm-none-eabi-gcc
#LD=arm-none-eabi-ld
AS=arm-none-eabi-as
#LDSCRIPT_INC=ldscripts
#LINKERFILE=stm32l1xx.ld
#LINKERFILE=stm32f030x4.ld
LINKERFILE=stm32f070x6.ld
#CRT0=startup_$(PLATFORM)xx.o
#STARTUP=startup_stm32f030x6.o
STARTUP=startup_stm32f070x6.o
#SYSTEM_INIT=system_stm32f0xx.o
SYSTEM_INIT=
#CRT0=/usr/lib/arm-none-eabi/lib/armv6-m/crt0.o
CFLAGS ?= -Os -g
#CFLAGS ?= -g -Wno-main -I.
#CFLAGS ?= -O0 -g -Werror
CFLAGS += -DSMON_VERSION=$(SMON_VERSION) -std=c99 -Wall -Wextra -Wno-unused-parameter
CFLAGS += -Wno-main
# If you get linking error
#   /usr/lib/gcc/arm-none-eabi/6.3.1/../../../arm-none-eabi/bin/ld: error: /usr/lib/gcc/arm-none-eabi/6.3.1/../../../arm-none-eabi/lib/crt0.o: Conflicting CPU architectures 12/1
# you can try to enable following specs file to support cortex-m0 thumb
#CFLAGS += -specs=v6-m-gcc-specs
#CFLAGS +=  -Istm32l1
#CFLAGS += -DSTM32L1XX_MD
#CFLAGS += -DSTM32F030x6
CFLAGS += -DSTM32F070x6
CFLAGS += -mlittle-endian -mcpu=cortex-m0  -march=armv6-m -mthumb
CFLAGS += -ffunction-sections -fdata-sections
CFLAGS += -Wl,--gc-sections -Wl,-Map=$(PROJ_NAME).map
CFLAGS += -nostdlib
#CFLAGS += -nostartfiles -nodefaultlibs
#CFLAGS += -I$(PLATFORM)
#CFLAGS += -Wno-implicit-function-declaration
CFLAGS += -DUSE_CONS_UART1
#CFLAGS += -DSTATIC=extern
ARCH_FOUND=1
endif

ifeq ($(ARCH),arm-stm32f1)
### arm-stm32f1 arch is for building the firmware for STM32F103 MCU as seen in Blue Pill boards
### which have STM32F103C8 MCU. Unfortunately this macro definition does not exist in STM32Cube.
### There is some evidence that STM32F103xB is similar to STM32F103x8. Thus we uses xB variants.
### See: http://wiki.stm32duino.com/index.php?title=Blue_Pill
### See: https://www.st.com/en/microcontrollers/stm32f103c8.html
### https://satoshinm.github.io/blog/171212_stm32_blue_pill_arm_development_board_first_look_bare_metal_programming.html#stm32cube
### http://www.st.com/content/st_com/en/products/embedded-software/mcus-embedded-software/stm32-embedded-software/stm32cube-mcu-packages/stm32cubef1.html
### unzip -l /t/en.stm32cubef1.zip
### This is a cross compilation arch requiring ARM tool chain, e.g.
#     apt-get install binutils-arm-none-eabi libnewlib-arm-none-eabi gcc-arm-none-eabi
#     apt-get install gdb-arm-none-eabi  # no longer available, use gdb-multiarch instead
### and some files from SDK that can be downloaded from software section of stm32f103
### web page on st.com. For example the "cube" development kit en.stm32cubef1.zip
### from which following files were extracted (they are checked in git for convenience):
#     STM32Cube_FW_F1_V1.7.0/Drivers/CMSIS/Device/ST/STM32F1xx/Include/
#       stm32f1xx.h     - Generic include for STM32F0 series. This includes
#       stm32f103xb.h   - based on -DSTM32F103x6 macro definition
#       - Contains definitions of nearly all I/O registers and bits
#       system_stm32f0xx.h
#     STM32Cube_FW_F1_V1.7.0/Drivers/CMSIS/Device/ST/STM32F1xx/Source/
#       Templates/gcc/startup_stm32f103xb.s
#       - First initializations, e.g. clocks; calls SystemInit() in system_stm32f1xx.c
#       - calls main() of C
#       Templates/system_stm32f1xx.c
#     STM32Cube_FW_F1_V1.7.0/Drivers/CMSIS/Include/core_cm0.h  - ARMv6-M Cortex-M0 defines
#
# arm-none-eabi-gcc --print-multi-lib
# GCC_EXEC_PREFIX=/usr/lib/arm-none-eabi/lib/armv6-m/
#
# make smcu-firmware.hex ARCH=arm-stm32f
#PLATFORM=stm32f1
PLATFORM=
ARMBIN=/usr/local/arm-bin/
PATH:=$(PATH):$(ARMBIN)
VPATH = .
ARC=arm-none-eabi-ar -crs
CC=arm-none-eabi-gcc
LD=arm-none-eabi-ld
#LD=GCC_EXEC_PREFIX=/usr/lib/arm-none-eabi/lib/armv6-m/ arm-none-eabi-gcc
#LD=arm-none-eabi-ld
AS=arm-none-eabi-as
#LDSCRIPT_INC=ldscripts
LINKERFILE=stm32f103xb.ld
#CRT0=startup_$(PLATFORM)xx.o
STARTUP=startup_stm32f103xb.o
#SYSTEM_INIT=system_stm32f1xx.o
SYSTEM_INIT=
#CRT0=/usr/lib/arm-none-eabi/lib/armv6-m/crt0.o
CFLAGS ?= -Os -g
#CFLAGS ?= -g -Wno-main -I.
#CFLAGS ?= -O0 -g -Werror
CFLAGS += -DSMON_VERSION=$(SMON_VERSION) -std=c99 -Wall -Wextra -Wno-unused-parameter
CFLAGS += -Wno-main
# If you get linking error
#   /usr/lib/gcc/arm-none-eabi/6.3.1/../../../arm-none-eabi/bin/ld: error: /usr/lib/gcc/arm-none-eabi/6.3.1/../../../arm-none-eabi/lib/crt0.o: Conflicting CPU architectures 12/1
# you can try to enable following specs file to support cortex-m0 thumb
#CFLAGS += -specs=v6-m-gcc-specs
#CFLAGS +=  -Istm32l1
CFLAGS += -DSTM32F103xB
CFLAGS += -mlittle-endian -mcpu=cortex-m3  -march=armv7-m -mthumb
CFLAGS += -ffunction-sections -fdata-sections
CFLAGS += -Wl,--gc-sections -Wl,-Map=$(PROJ_NAME).map
CFLAGS += -nostdlib
#CFLAGS += -nostartfiles -nodefaultlibs
#CFLAGS += -I$(PLATFORM)
#CFLAGS += -Wno-implicit-function-declaration
#CFLAGS += -DSTATIC=extern
#LDFLAGS += -ffunction-sections -fdata-sections
#LDFLAGS += --gc-sections -Map=$(PROJ_NAME).map
#LDFLAGS += -nostdlib
#LDFLAGS += -nostartfiles -nodefaultlibs
ARCH_FOUND=1
endif

ifeq ($(ARCH),arm-stm32l1)
### arm-stm32l1 target is for building the firmware for microcontroller
### on smart MCU board (there is no operating system)
### This is a cross compilation target requiring ARM tool chain, e.g.
# apt-get install binutils-arm-none-eabi libnewlib-arm-none-eabi gcc-arm-none-eabi
# make smcu-firmware.hex ARCH=arm-stm32l1
BUILD_EXAMPLE=make smcu-firmware.hex ARCH=arm-stm32l1
PLATFORM=stm32l1
ARMBIN=/usr/local/arm-bin/
PATH:=$(PATH):$(ARMBIN)
VPATH = .
ARC=arm-none-eabi-ar -crs
CC=arm-none-eabi-gcc
LD=arm-none-eabi-ld
AS=arm-none-eabi-as
LDSCRIPT_INC=ldscripts
LINKERFILE=stm32l1xx.ld
#CRT0=startup_$(PLATFORM)xx.o
STARTUP=startup_stm32l1xx_md.o
SYSTEM_INIT=
CFLAGS ?= -Os -g
#CFLAGS ?= -g -Wno-main -I.
#CFLAGS ?= -O0 -g -Werror
CFLAGS += -DSMON_VERSION=$(SMON_VERSION) -std=c99 -Wall -Wextra -Wno-unused-parameter
CFLAGS += -mlittle-endian -mcpu=cortex-m3  -march=armv7-m -mthumb
CFLAGS += -ffunction-sections -fdata-sections
CFLAGS += -Wl,--gc-sections -Wl,-Map=$(PROJ_NAME).map
CFLAGS += -nodefaultlibs
#CFLAGS += -Istm32l1 -I$(PLATFORM)
CFLAGS += -DSTM32L1XX_MD
#CFLAGS += -DSTATIC= -Wno-implicit-function-declaration
#CFLAGS += -DSTATIC=extern
ARCH_FOUND=1
endif

ifeq ($(ARCH),mcs51-cc2530)
### mcs51-cc2530 target is for building the firmware for microcontroller
### on cc2530 based MCU board (there is no operating system)
### This is a cross compilation target requiring SDCC tool chain (tested with sdcc-4.0.0
### http://sdcc.sourceforge.net/
# make smon.hex ARCH=mcs51-cc2530
BUILD_EXAMPLE=make smon.hex ARCH=mcs51-cc2530
PLATFORM=mcs51-cc2530
ARMBIN=/usr/local/arm-bin/
PATH:=$(PATH):$(ARMBIN)
VPATH = .
ARC=sdar -crs
CC=sdcc
LD=sdcc
AS=sdas8051
LDSCRIPT_INC=ldscripts
LINKERFILE=cc2530.ld

#CRT0=startup_$(PLATFORM)xx.o
STARTUP=startup_cc2530.o
SYSTEM_INIT=

CFLAGS ?= --opt-code-size --debug --std-sdcc99 -Wall -Wextra -Wno-unused-parameter
#CFLAGS ?= --debug --std-sdcc99 -Wall -Wextra -Wno-main -Wno-unused-parameter -I.
CFLAGS += -DSMON_VERSION=$(SMON_VERSION)
CFLAGS += -mmcs51 -DCC2530
#CFLAGS += -Icc2530 -I$(PLATFORM)
#CFLAGS += -DSTATIC= -Wno-implicit-function-declaration
#CFLAGS += -DSTATIC=extern
#all:	smon.hex smon.bin
ARCH_FOUND=1
endif

ifeq ($(ARCH_FOUND),)
$(error ARCH $(ARCH) not found. Run make help)
endif

ifeq ($(DISTRO),fedora)
CDEF+=-DFEDORA
endif

ifeq ($(ENA_PG),1)
### To compile for profiling your should run make ENA_PG=1
### See also: make gcov, make lcov (and lcovhtml directory), man gcov, man gprof
### N.B. ccache seems to be incompatible with profiling.
$(info Profiling build)
CFLAGS+= -pg -ftest-coverage -fprofile-arcs
LDFLAGS+= -pg -ftest-coverage -fprofile-arcs
else
# -ffunction-sections is incompatible with profiling
CFLAGS+= -ffunction-sections -fdata-sections
# Following ld flags as well as C flag -ffunction-sections are a quest to
# eliminate unused functions from final link.
#LDFLAGS= -Wl,-O -Wl,2 --gc-sections
endif

all:	smon.hex

OBJS= $(SMON_OBJS) $(STARTUP) $(SYSTEM_INIT)
#OBJS+=	stm32l1xx_i2c.o
#OBJS+=	stm32l1xx_rcc.o
#OBJS+=	system_stm32l1xx.o
#OBJS+=  openssl-1.0.2k/crypto/rsa/rsa_sign.o openssl-1.0.2k/crypto/rsa/rsa_oaep.o openssl-1.0.2k/crypto/rsa/rsa_crpt.o openssl-1.0.2k/crypto/mem.o openssl-1.0.2k/crypto/mem_clr.o openssl-1.0.2k/crypto/mem_dbg.o openssl-1.0.2k/crypto/cryptlib.o openssl-1.0.2k/crypto/err/err.o openssl-1.0.2k/crypto/objects/obj_dat.o openssl-1.0.2k/crypto/bn/bn_lib.o openssl-1.0.2k/crypto/stack/stack.o openssl-1.0.2k/crypto/lhash/lhash.o

COVIMP_OBJS= covimp.o

system_stm32l1xx.o:	system_stm32l1xx.c

smon.elf:	$(CRT0) $(OBJS)
	$(CC) $(CFLAGS) -L $(LDSCRIPT_INC) -T $(LINKERFILE) -o $@ $^

%.o: %.s
	$(CC) $(CFLAGS) -o $@ -c $^

#send-ledbits-2.o: send-ledbits-2.s
#	$(CC) $(CFLAGS) -o $@ -c $^

#$(CRT0): stm32l1/startup_$(PLATFORM)xx_md.s
#	$(CC) $(CFLAGS) -o $(CRT0) -c stm32l1/startup_$(PLATFORM)xx_md.s

%.hex:	%.elf
	size $<
	arm-none-eabi-objcopy -O ihex $< $@
	$(CP) $< ../i686/*root/bin/
	$(CP) $< ../mipsel/*root/bin/
	$(CP) $@ ../i686/*root/bin/
	$(CP) $@ ../mipsel/*root/bin/

%.bin:	%.elf
	arm-none-eabi-objcopy -O binary $< $@

#.S.o:
#	$(CC) $(ASFLAGS) -c $?
#
#.s.o:
#	$(CC) $(ASFLAGS) -c $?
#
#.c.o:
#	$(CC) $(CFLAGS) -c $?
#
#.c.s:
#	$(CC) $(CFLAGS) -S $?

dep: deps

deps: $(SMCU_OBJS:.o=.c) smcu.h uart.h
	$(CC) $(CFLAGS) -DSTM32L1XX_MD -MM $^ >deps.dep

# N.B. If deps target and the actual deps.dep file have same name,
# the deps target will be made every time deps is missing - even
# when attempting to run `make clean'

-include deps.dep

### Testing

test:
	./smon-test -a -a -dx

### valgrind analysis

vgtest:
	./smon-test -a -a -vg -dx
	grep -e -- tmp/*.err

### Coverage analysis
### See also: make gcov, make lcov (and lcovhtml directory), man gcov, man gprof
###   profiling:/home/sampo/zxid/zxidconf.gcda:Version mismatch - expected 304* got 403*
###
### N.B. Apparently gcov is very picky between compiler versions (and libgcov version).
### Be sure to use you only use matching pair. gcov is also fidgety about processing
### source code subdirectories (presumably because it was compiled from top level
### directory). Apparently all subdirectory .gcov files land on top level.
###
### .gcno graph files are created at compile time. Recompile (with  -ftest-coverage) to recreate.
### .gcda arc files are updated at runtime (if compiled with -fprofile-arcs)
### gmon.out is created at runtime if compiled with -pg
#
#ls *.c c/*.c Net/*.c php/*.c zxidjava/*.c precheck/*.c | xargs $(GCOV)
# 	$(GCOV) *.c c/*.c Net/*.c php/*.c zxidjava/*.c precheck/*.c
#	$(GCOV) -o Net Net/*.c
#	$(GCOV) -o php php/*.c

gcov:
	@$(ECHO) "Remember to compile for profiling: make all ENA_PG=1 && make gcov"
	echo GCOV=$(GCOV)
	which gcov
	$(GCOV) -v
	$(GCOV) *.c

# gcov /a/d/sampo/zxid/zxidconf.gcda -o /home/sampo/zxid -b -c -a -p

covrep:
	sh ./covrep.sh

### lcov is alternative to gcov target (it runs gcov internally, as specified by --gcov-tool)
### We have tested with versions 1.8 and 1.9, see http://ltp.sourceforge.net/coverage/lcov.php

lcov:
	rm -rf lcovhtml; mkdir lcovhtml
	$(LCOV) --gcov-tool $(GCOV) --ignore-errors graph -b . -d . -c -no-checksum -o lcovhtml/smon.info
	$(GENHTML) -t 'SMON Code Coverage' -o lcovhtml lcovhtml/smcu.info

copylcov:
	ssh $(WEBROOTHOST) mkdir $(WEBROOTDIR)/lcovhtml-$(SMON_VERSION) || true
	rsync -a lcovhtml/* $(WEBROOT)/lcovhtml-$(SMON_VERSION)

gprof:
	gprof zxencdectest

cleangcov:
	rm -f *.gcno *.gcda *.c.gcov *.y.gcov *.c-ann gmon.out
	rm -f */*.gcno */*.gcda */*.c.gcov */*.y.gcov */*.c-ann */gmon.out
	rm -f lcovhtml/*.info lcovhtml/*/*.html
	rm -f gmon.out

.PHONY: cleangcov gprof copylcov lcov gcov covrep

### Call graphs and reference documentation

CALL_ANAL=$(PERL) ./call-anal.pl

function.list: 
	$(CALL_ANAL) -n *.c >junk

callgraph_annotate: 
	$(CALL_ANAL) *.c >callgraph.dot

callgraph: 
	$(CALL_ANAL) -n *.c >callgraph.dot
	dot -Tps main-call.dot -o main-call.ps
	dot -Tps callgraph.dot -o callgraph.ps  # slow

tags:
	etags *.[hc]

clean:
	rm -f *.o *.elf *.bin *.hex *.map *.h.gch covimp

cleaner: clean
	rm -f $(ARCH_PREFIX)covimp $(ARCH_PREFIX)libfoo.so.0.0

crc: crc.o
	gcc -g -DCRC_TEST $< -o $@

scp_dut: smon.hex
	scp $^ root@dut:/s/smon/

install: $(ARCH_PREFIX)smon
	$(CP) $(ARCH_PREFIX)smon* ../$(ARCH_PREFIX)/*root/bin/

installcp: $(ARCH_PREFIX)smon
	$(CP) $(ARCH_PREFIX)smon* ../$(ARCH_PREFIX)/*root/bin/
	$(SCP) $(ARCH_PREFIX)smon root@dut:/s/smon/

help:
	@$(ECHO) This Makefile is prepared for building several target binaries for
	@$(ECHO) several target architectures with cross compilers. There is no
	@$(ECHO) configure script. All options are set by selection of ARCH variable
	@$(ECHO) and overriding make variables from command line. If you plan to
	@$(ECHO) override, you should study this Makefile to see if the variable
	@$(ECHO) in question uses ?= and += constructs. Most of them do. You should
	@$(ECHO) also study the cross compilation setup for your target architecture
	@$(ECHO) 'in, e.g. ifeq ($(ARCH),i686)...endif block.'
	@$(ECHO) 
	@$(ECHO) Examples:
	@$(ECHO)
	@$(ECHO) make smon.hex ARCH=mcs51-cc2530
	@$(ECHO) - Builds the smon firmware for Texas Instruments / Chipcon CC2530 MCU 
	@$(ECHO) 
	@$(ECHO) make scp_dut ARCH=mcs51-cc2530
	@$(ECHO) - Builds the firmware and copies it to device under test
	@$(ECHO) 

#EOF smonfw/Makefile
