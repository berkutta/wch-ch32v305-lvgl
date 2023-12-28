# WCH CH32V305 LVGL

## Overview

This repository contains a LVGL implementation for the WCH CH32V305 MCU.

The LVGL and LCD Implementation is based on the Example code for the nanoCH32V305 Board: https://github.com/wuxx/nanoCH32V305/blob/master/doc/LCD_LVGL.zip

This project doesn't use the Mounriver IDE. It uses the Mounriver Toolchain within a Makefile environment.
   
### Build and Flash
* Build with `make`
* Flash with `make flash`

### Debugging
* Run openocd with `make gdb`
