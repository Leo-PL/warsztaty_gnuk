#!/bin/bash
set -euxo pipefail
openocd \
	-f interface/stlink.cfg \
	-c "transport select hla_swd" \
	-c "set CPUTAPID 0x2ba01477" \
	-c "set FLASH_SIZE 0x20000" \
	-f target/stm32f1x.cfg \
	-c "init" \
	-c "reset halt" \
       	-c "stm32f1x unlock 0" \
	-c "reset halt" \
	-c "program gnuk/src/build/gnuk.elf verify" \
       	-c "reset halt" \
	-c "stm32f1x lock 0" \
	-c "reset" \
	-c "shutdown"
