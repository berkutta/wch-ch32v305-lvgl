/********************************** (C) COPYRIGHT *******************************
* File Name          : main.c
* Author             : WCH
* Version            : V1.0.0
* Date               : 2021/06/06
* Description        : Main program body.
* Copyright (c) 2021 Nanjing Qinheng Microelectronics Co., Ltd.
* SPDX-License-Identifier: Apache-2.0
*******************************************************************************/

/*
 *@Note
 串口打印调试例程：
 USART1_Tx(PA9)。
 本例程演示使用 USART1(PA9) 作打印调试口输出。

*/

#include "debug.h"
#include "lvgl.h"
#include "lcd.h"
#include "lv_port_disp.h"
#include "lv_examples.h"


/* Global typedef */

/* Global define */

/* Global Variable */


/*********************************************************************
 * @fn      main
 *
 * @brief   Main program.
 *
 * @return  none
 */
int main(void)
{
	NVIC_PriorityGroupConfig(NVIC_PriorityGroup_2);
	Delay_Init();
	USART_Printf_Init(115200);
	printf("SystemClk:%d\r\n",SystemCoreClock);

	lcd_init();
	printf("%s-%d\r\n", __func__, __LINE__);
	//LCD_SetBrightness(40);
    printf("%s-%d\r\n", __func__, __LINE__);

    //lcd_init();
    //while(1);

	lv_init();
	lv_port_disp_init();

	//lv_example_meter_2();

	//lv_example_get_started_1();
	//lv_example_get_started_2();
	//lv_example_get_started_3();
	//lv_example_menu_1();
	//lv_example_led_1();
	//lv_demo_widgets();

	//lv_example_animimg_1();
	//lv_example_colorwheel_1();
	lv_example_calendar_1();

	while(1)
    {
	    lv_tick_inc(1);
	    lv_task_handler();
	    Delay_Ms(1);
	}
}

