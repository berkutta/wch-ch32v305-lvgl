/********************************** (C) COPYRIGHT *******************************
* File Name          : lcd.c
* Author             : WCH
* Version            : V1.0.0
* Date               : 2021/06/06
* Description        : This file contains the headers of the TFTLCD.
*******************************************************************************/
#include "lcd.h"
#include "stdlib.h"
#include "stdarg.h"
//#include "font.h"

#define USE_HORIZONTAL 0

#define LCD_SCLK_Clr() GPIO_ResetBits(GPIOB,GPIO_Pin_13)//SCL=SCLK
#define LCD_SCLK_Set() GPIO_SetBits(GPIOB,GPIO_Pin_13)

#define LCD_MOSI_Clr() GPIO_ResetBits(GPIOB,GPIO_Pin_15)//SDA=MOSI
#define LCD_MOSI_Set() GPIO_SetBits(GPIOB,GPIO_Pin_15)

#define LCD_RES_Clr()  GPIO_ResetBits(GPIOB,GPIO_Pin_11)//RES
#define LCD_RES_Set()  GPIO_SetBits(GPIOB,GPIO_Pin_11)

#define LCD_DC_Clr()   GPIO_ResetBits(GPIOB,GPIO_Pin_10)//DC
#define LCD_DC_Set()   GPIO_SetBits(GPIOB,GPIO_Pin_10)

#define LCD_CS_Clr()   GPIO_ResetBits(GPIOB,GPIO_Pin_12)//CS
#define LCD_CS_Set()   GPIO_SetBits(GPIOB,GPIO_Pin_12)

#define LCD_BLK_Clr()  GPIO_ResetBits(GPIOB,GPIO_Pin_9)//BLK
#define LCD_BLK_Set()  GPIO_SetBits(GPIOB,GPIO_Pin_9)


#define LCD_CLEAR_SEND_NUMBER 5760

u16 BACK_COLOR = BLACK, FORE_COLOR = WHITE;

void LCD_Writ_Bus(u8 dat)
{
    LCD_CS_Clr();
    while(SPI_I2S_GetFlagStatus(SPI2, SPI_I2S_FLAG_TXE) == RESET);
    SPI_I2S_SendData(SPI2,dat);
    Delay_Us(1);
    LCD_CS_Set();
}


void LCD_WR_DATA8(u8 dat)
{
    LCD_Writ_Bus(dat);
}

void LCD_WR_DATA(u16 dat)
{
    LCD_Writ_Bus(dat>>8);
    LCD_Writ_Bus(dat);
}

void LCD_WR_REG(u8 dat)
{
    LCD_DC_Clr();
    LCD_Writ_Bus(dat);
    LCD_DC_Set();
}

/**
 * Set drawing area
 *
 * @param   x1      start of x position
 * @param   y1      start of y position
 * @param   x2      end of x position
 * @param   y2      end of y position
 *
 * @return  void
 */
void lcd_address_set(u16 x1, u16 y1, u16 x2, u16 y2)
{
    if(USE_HORIZONTAL==0)
    {
        LCD_WR_REG(0x2a);//ÁÐµØÖ·ÉèÖÃ
        LCD_WR_DATA(x1);
        LCD_WR_DATA(x2);
        LCD_WR_REG(0x2b);//ÐÐµØÖ·ÉèÖÃ
        LCD_WR_DATA(y1);
        LCD_WR_DATA(y2);
        LCD_WR_REG(0x2c);//´¢´æÆ÷Ð´
    }
    else if(USE_HORIZONTAL==1)
    {
        LCD_WR_REG(0x2a);//ÁÐµØÖ·ÉèÖÃ
        LCD_WR_DATA(x1);
        LCD_WR_DATA(x2);
        LCD_WR_REG(0x2b);//ÐÐµØÖ·ÉèÖÃ
        LCD_WR_DATA(y1+80);
        LCD_WR_DATA(y2+80);
        LCD_WR_REG(0x2c);//´¢´æÆ÷Ð´
    }
    else if(USE_HORIZONTAL==2)
    {
        LCD_WR_REG(0x2a);//ÁÐµØÖ·ÉèÖÃ
        LCD_WR_DATA(x1);
        LCD_WR_DATA(x2);
        LCD_WR_REG(0x2b);//ÐÐµØÖ·ÉèÖÃ
        LCD_WR_DATA(y1);
        LCD_WR_DATA(y2);
        LCD_WR_REG(0x2c);//´¢´æÆ÷Ð´
    }
    else
    {
        LCD_WR_REG(0x2a);//ÁÐµØÖ·ÉèÖÃ
        LCD_WR_DATA(x1+80);
        LCD_WR_DATA(x2+80);
        LCD_WR_REG(0x2b);//ÐÐµØÖ·ÉèÖÃ
        LCD_WR_DATA(y1);
        LCD_WR_DATA(y2);
        LCD_WR_REG(0x2c);//´¢´æÆ÷Ð´
    }

}

void lcd_gpio_init(void)
{
    GPIO_InitTypeDef GPIO_InitStructure = {0};
    SPI_InitTypeDef  SPI_InitStructure = {0};

    RCC_APB2PeriphClockCmd(RCC_APB2Periph_GPIOB, ENABLE);
    RCC_APB1PeriphClockCmd(RCC_APB1Periph_SPI2, ENABLE);

    /* DC (PB10) & RESET (PB11) & CS (PB12) */
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_10 | GPIO_Pin_11 | GPIO_Pin_12;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_Out_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure);
    //GPIO_SetBits(GPIOA, GPIO_Pin_2);

    /* SPI_CLK */
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_13;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure);

    /* SPI_MISO */
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_14;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_IN_FLOATING;
    GPIO_Init(GPIOB, &GPIO_InitStructure);

    /* SPI_MOSI */
    GPIO_InitStructure.GPIO_Pin = GPIO_Pin_15;
    GPIO_InitStructure.GPIO_Mode = GPIO_Mode_AF_PP;
    GPIO_InitStructure.GPIO_Speed = GPIO_Speed_50MHz;
    GPIO_Init(GPIOB, &GPIO_InitStructure);

    SPI_InitStructure.SPI_Direction = SPI_Direction_1Line_Tx;
    SPI_InitStructure.SPI_Mode = SPI_Mode_Master;
    SPI_InitStructure.SPI_DataSize = SPI_DataSize_8b;
    SPI_InitStructure.SPI_CPOL = SPI_CPOL_High;
    SPI_InitStructure.SPI_CPHA = SPI_CPHA_2Edge;
    SPI_InitStructure.SPI_NSS = SPI_NSS_Soft;
    SPI_InitStructure.SPI_BaudRatePrescaler = SPI_BaudRatePrescaler_2; /* APB1_CLK (72MHz) */
    SPI_InitStructure.SPI_FirstBit = SPI_FirstBit_MSB;
    SPI_InitStructure.SPI_CRCPolynomial = 7;
    SPI_Init(SPI2, &SPI_InitStructure);

    SPI_Cmd(SPI2, ENABLE);

}

void LCD_SetBrightness(u8 brightness)
{
#if 0
    if (brightness > 100) brightness = 100;
    TIM_SetCompare2( TIM1, brightness );
#endif
}

void LCD_Fill(u16 xsta,u16 ysta,u16 xend,u16 yend,u16 color)
{
    u16 i,j;
    lcd_address_set(xsta,ysta,xend-1,yend-1);//ÉèÖÃÏÔÊ¾·¶Î§

    LCD_CS_Clr();

    for(i=ysta;i<yend;i++)
    {
        for(j=xsta;j<xend;j++)
        {
            //LCD_WR_DATA(color);

            while(SPI_I2S_GetFlagStatus(SPI2, SPI_I2S_FLAG_TXE) == RESET);
            SPI_I2S_SendData(SPI2,color >> 8);
            //Delay_Us(1);
            while(SPI_I2S_GetFlagStatus(SPI2, SPI_I2S_FLAG_TXE) == RESET);
            SPI_I2S_SendData(SPI2,color);
        }
    }

    LCD_CS_Set();

}


void lcd_init(void)
{
    u16 id=0;
    lcd_gpio_init();

    //LCD_RES_Clr();//¸´Î»
    Delay_Ms(100);

    LCD_RES_Set();
    Delay_Ms(100);

    LCD_BLK_Set();//´ò¿ª±³¹â
    Delay_Ms(100);

    //************* Start Initial Sequence **********//
     LCD_WR_REG(0x11); //Sleep out
     Delay_Ms(120);              //Delay 120ms
     //************* Start Initial Sequence **********//
     LCD_WR_REG(0x36);
     if(USE_HORIZONTAL==0)LCD_WR_DATA8(0x00);
     else if(USE_HORIZONTAL==1)LCD_WR_DATA8(0xC0);
     else if(USE_HORIZONTAL==2)LCD_WR_DATA8(0x70);
     else LCD_WR_DATA8(0xA0);

     LCD_WR_REG(0x3A);
     LCD_WR_DATA8(0x05);

     LCD_WR_REG(0xB2);
     LCD_WR_DATA8(0x0C);
     LCD_WR_DATA8(0x0C);
     LCD_WR_DATA8(0x00);
     LCD_WR_DATA8(0x33);
     LCD_WR_DATA8(0x33);

     LCD_WR_REG(0xB7);
     LCD_WR_DATA8(0x35);

     LCD_WR_REG(0xBB);
     LCD_WR_DATA8(0x32); //Vcom=1.35V

     LCD_WR_REG(0xC2);
     LCD_WR_DATA8(0x01);

     LCD_WR_REG(0xC3);
     LCD_WR_DATA8(0x15); //GVDD=4.8V  ÑÕÉ«Éî¶È

     LCD_WR_REG(0xC4);
     LCD_WR_DATA8(0x20); //VDV, 0x20:0v

     LCD_WR_REG(0xC6);
     LCD_WR_DATA8(0x0F); //0x0F:60Hz

     LCD_WR_REG(0xD0);
     LCD_WR_DATA8(0xA4);
     LCD_WR_DATA8(0xA1);

     LCD_WR_REG(0xE0);
     LCD_WR_DATA8(0xD0);
     LCD_WR_DATA8(0x08);
     LCD_WR_DATA8(0x0E);
     LCD_WR_DATA8(0x09);
     LCD_WR_DATA8(0x09);
     LCD_WR_DATA8(0x05);
     LCD_WR_DATA8(0x31);
     LCD_WR_DATA8(0x33);
     LCD_WR_DATA8(0x48);
     LCD_WR_DATA8(0x17);
     LCD_WR_DATA8(0x14);
     LCD_WR_DATA8(0x15);
     LCD_WR_DATA8(0x31);
     LCD_WR_DATA8(0x34);

     LCD_WR_REG(0xE1);
     LCD_WR_DATA8(0xD0);
     LCD_WR_DATA8(0x08);
     LCD_WR_DATA8(0x0E);
     LCD_WR_DATA8(0x09);
     LCD_WR_DATA8(0x09);
     LCD_WR_DATA8(0x15);
     LCD_WR_DATA8(0x31);
     LCD_WR_DATA8(0x33);
     LCD_WR_DATA8(0x48);
     LCD_WR_DATA8(0x17);
     LCD_WR_DATA8(0x14);

     LCD_WR_DATA8(0x15);
     LCD_WR_DATA8(0x31);
     LCD_WR_DATA8(0x34);
     LCD_WR_REG(0x21);

     LCD_WR_REG(0x29);

     Delay_Ms(100);
     LCD_Fill(0,0,LCD_W,LCD_H,BLUE);
     Delay_Ms(100);
     LCD_Fill(0,0,LCD_W,LCD_H,RED);

     Delay_Ms(100);
     LCD_Fill(0,0,LCD_W,LCD_H,BLACK);

     Delay_Ms(100);
     LCD_Fill(0,0,LCD_W,LCD_H,WHITE);


     //LCD_ShowPicture_Slow(29,48,182,144,gImage_test);
     //LCD_ShowPicture_Fast(29,48,182,144,gImage_test);

}


/**
 * Set background color and foreground color
 *
 * @param   back    background color
 * @param   fore    fore color
 *
 * @return  void
 */
void lcd_set_color(u16 back, u16 fore)
{
    BACK_COLOR = back;
    FORE_COLOR = fore;
}

#if 0
void lcd_display_on(void)
{
    GPIO_SetBits(GPIOB,GPIO_Pin_14);
}

void lcd_display_off(void)
{
    GPIO_ResetBits(GPIOB,GPIO_Pin_14);
}

/* lcd enter the minimum power consumption mode and backlight off. */
void lcd_enter_sleep(void)
{
    GPIO_ResetBits(GPIOB,GPIO_Pin_14);
    delay_ms(5);
    lcd_write_cmd(0x10);
}
/* lcd turn off sleep mode and backlight on. */
void lcd_exit_sleep(void)
{
    GPIO_SetBits(GPIOB,GPIO_Pin_14);
    delay_ms(5);
    lcd_write_cmd(0x11);
    delay_ms(120);
}
#endif


/**
 * clear the lcd.
 *
 * @param   color       Fill color
 *
 * @return  void
 */
void lcd_clear(u16 color)
{
#if 0
    u16 i, j;
    u8 data[2] = {0};

    data[0] = color >> 8;
    data[1] = color;
    lcd_address_set(0, 0, LCD_W - 1, LCD_H - 1);

    /* 5760 = 240*240/20 */

        for (i = 0; i < LCD_W; i++)
        {
            for (j = 0; j < LCD_H; j++)
            {
                *(__IO u8*)LCD_DATA=data[0];
                *(__IO u8*)LCD_DATA=data[1];
            }
        }
#endif

}

/**
 * display a point on the lcd.
 *
 * @param   x   x position
 * @param   y   y position
 *
 * @return  void
 */
void lcd_draw_point(u16 x, u16 y)
{
    lcd_address_set(x, y, x, y);
    LCD_WR_DATA(FORE_COLOR);
}

/**
 * display a point on the lcd using the given colour.
 *
 * @param   x       x position
 * @param   y       y position
 * @param   color   color of point
 *
 * @return  void
 */
void lcd_draw_point_color(u16 x, u16 y, u16 color)
{
    lcd_address_set(x, y, x, y);
    LCD_WR_DATA(color);
}

// if use lvgl set 0
#if 0
/**
 * full color on the lcd.
 *
 * @param   x_start     start of x position
 * @param   y_start     start of y position
 * @param   x_end       end of x position
 * @param   y_end       end of y position
 * @param   color       Fill color
 *
 * @return  void
 */
void lcd_fill(u16 x_start, u16 y_start, u16 x_end, u16 y_end, u16 color)
{
    u16 i = 0, j = 0;
    u32 size = 0, size_remain = 0;

    size = (x_end - x_start) * (y_end - y_start) * 2;

    if (size > LCD_CLEAR_SEND_NUMBER)
    {
        /* the number of remaining to be filled */
        size_remain = size - LCD_CLEAR_SEND_NUMBER;
        size = LCD_CLEAR_SEND_NUMBER;
    }

    lcd_address_set(x_start, y_start, x_end, y_end);


        for (i = y_start; i <= y_end; i++)
        {
            for (j = x_start; j <= x_end; j++)lcd_write_half_word(color);
        }

}

/**
 * display a line on the lcd.
 *
 * @param   x1      x1 position
 * @param   y1      y1 position
 * @param   x2      x2 position
 * @param   y2      y2 position
 *
 * @return  void
 */
void lcd_draw_line(u16 x1, u16 y1, u16 x2, u16 y2)
{
    u16 t;
    u32 i = 0;
    int xerr = 0, yerr = 0, delta_x, delta_y, distance;
    int incx, incy, row, col;

    if (y1 == y2)
    {
        /* fast draw transverse line */
        lcd_address_set(x1, y1, x2, y2);

        u8 line_buf[480] = {0};

        for (i = 0; i < x2 - x1; i++)
        {
            line_buf[2 * i] = FORE_COLOR >> 8;
            line_buf[2 * i + 1] = FORE_COLOR;
        }

        for(i=0;i<(x2-x1)*2;i++)
        {
            *(__IO u8*)LCD_DATA=line_buf[i];
        }

        return ;
    }

    delta_x = x2 - x1;
    delta_y = y2 - y1;
    row = x1;
    col = y1;
    if (delta_x > 0)incx = 1;
    else if (delta_x == 0)incx = 0;
    else
    {
        incx = -1;
        delta_x = -delta_x;
    }
    if (delta_y > 0)incy = 1;
    else if (delta_y == 0)incy = 0;
    else
    {
        incy = -1;
        delta_y = -delta_y;
    }
    if (delta_x > delta_y)distance = delta_x;
    else distance = delta_y;
    for (t = 0; t <= distance + 1; t++)
    {
        lcd_draw_point(row, col);
        xerr += delta_x ;
        yerr += delta_y ;
        if (xerr > distance)
        {
            xerr -= distance;
            row += incx;
        }
        if (yerr > distance)
        {
            yerr -= distance;
            col += incy;
        }
    }
}

/**
 * display a rectangle on the lcd.
 *
 * @param   x1      x1 position
 * @param   y1      y1 position
 * @param   x2      x2 position
 * @param   y2      y2 position
 *
 * @return  void
 */
void lcd_draw_rectangle(u16 x1, u16 y1, u16 x2, u16 y2)
{
    lcd_draw_line(x1, y1, x2, y1);
    lcd_draw_line(x1, y1, x1, y2);
    lcd_draw_line(x1, y2, x2, y2);
    lcd_draw_line(x2, y1, x2, y2);
}

/**
 * display a circle on the lcd.
 *
 * @param   x       x position of Center
 * @param   y       y position of Center
 * @param   r       radius
 *
 * @return  void
 */
void lcd_draw_circle(u16 x0, u16 y0, u8 r)
{
    int a, b;
    int di;
    a = 0;
    b = r;
    di = 3 - (r << 1);
    while (a <= b)
    {
        lcd_draw_point(x0 - b, y0 - a);
        lcd_draw_point(x0 + b, y0 - a);
        lcd_draw_point(x0 - a, y0 + b);
        lcd_draw_point(x0 - b, y0 - a);
        lcd_draw_point(x0 - a, y0 - b);
        lcd_draw_point(x0 + b, y0 + a);
        lcd_draw_point(x0 + a, y0 - b);
        lcd_draw_point(x0 + a, y0 + b);
        lcd_draw_point(x0 - b, y0 + a);
        a++;
        //Bresenham
        if (di < 0)di += 4 * a + 6;
        else
        {
            di += 10 + 4 * (a - b);
            b--;
        }
        lcd_draw_point(x0 + a, y0 + b);
    }
}

void lcd_show_char(u16 x, u16 y, u8 data, u32 size)
{
    u8 temp;
    u8 num = 0;;
    u8 pos, t;
    u16 colortemp = FORE_COLOR;
    if (x > LCD_W - size / 2 || y > LCD_H - size)return;

    data = data - ' ';
#ifdef ASC2_1608
    if (size == 16)
    {
        lcd_address_set(x, y, x + size / 2 - 1, y + size - 1);//(x,y,x+8-1,y+16-1)
            /* fast show char */
            for (pos = 0; pos < size * (size / 2) / 8; pos++)
            {
                temp = asc2_1608[(u16)data * size * (size / 2) / 8 + pos];
                for (t = 0; t < 8; t++)
                {
                    if (temp & 0x80)colortemp = FORE_COLOR;
                    else colortemp = BACK_COLOR;
                    lcd_write_half_word(colortemp);
                    temp <<= 1;
                }
            }

    }
    else
#endif

#ifdef ASC2_2412
        if (size == 24)
        {
            lcd_address_set(x, y, x + size / 2 - 1, y + size - 1);

                /* fast show char */
                for (pos = 0; pos < (size * 16) / 8; pos++)
                {
                    temp = asc2_2412[(u16)data * (size * 16) / 8 + pos];
                    if (pos % 2 == 0)
                    {
                        num = 8;
                    }
                    else
                    {
                        num = 4;
                    }

                    for (t = 0; t < num; t++)
                    {
                        if (temp & 0x80)colortemp = FORE_COLOR;
                        else colortemp = BACK_COLOR;
                        lcd_write_half_word(colortemp);
                        temp <<= 1;
                    }
                }


        }
        else
#endif

#ifdef ASC2_3216
            if (size == 32)
            {
                lcd_address_set(x, y, x + size / 2 - 1, y + size - 1);

                    /* fast show char */
                    for (pos = 0; pos < size * (size / 2) / 8; pos++)
                    {
                        temp = asc2_3216[(u16)data * size * (size / 2) / 8 + pos];
                        for (t = 0; t < 8; t++)
                        {
                            if (temp & 0x80)colortemp = FORE_COLOR;
                            else colortemp = BACK_COLOR;
                            lcd_write_half_word(colortemp);
                            temp <<= 1;
                        }
                    }

            }
            else
#endif
            {
                printf("There is no any define ASC2_1208 && ASC2_2412 && ASC2_2416 && ASC2_3216 !");
            }
}

/**
 * display the number on the lcd.
 *
 * @param   x       x position
 * @param   y       y position
 * @param   num     number
 * @param   len     length of number
 * @param   size    size of font
 *
 * @return  void
 */
void lcd_show_num(u16 x, u16 y, u32 num, u8 len, u32 size)
{
    lcd_show_string(x, y, size, "%d", num);
}

/**
 * display the string on the lcd.
 *
 * @param   x       x position
 * @param   y       y position
 * @param   size    size of font
 * @param   p       the string to be display
 *
 * @return   0: display success
 *          -1: size of font is not support
 */
void lcd_show_string(u16 x, u16 y, u32 size, const char *fmt, ...)
{
#define LCD_STRING_BUF_LEN 128

    va_list args;
    u8 buf[LCD_STRING_BUF_LEN] = {0};
    u8 *p = NULL;

    if (size != 16 && size != 24 && size != 32)
    {
        printf("font size(%d) is not support!", size);
    }

    va_start(args, fmt);
    vsnprintf((char *)buf, 100, (const char *)fmt, args);
    va_end(args);

    p = buf;
    while (*p != '\0')
    {
        if (x > LCD_W - size / 2)
        {
            x = 0;
            y += size;
        }
        if (y > LCD_H - size)
        {
            y = x = 0;
            lcd_clear(RED);
        }
        lcd_show_char(x, y, *p, size);
        x += size / 2;
        p++;
    }

}

/**
 * display the image on the lcd.
 *
 * @param   x       x position
 * @param   y       y position
 * @param   length  length of image
 * @param   wide    wide of image
 * @param   p       image
 *
 * @return   0: display success
 *          -1: the image is too large
 */
void lcd_show_image(u16 x, u16 y, u16 length, u16 wide, const u8 *p)
{
    u16 i=0;
//    RT_ASSERT(p);

    if (x + length > LCD_W || y + wide > LCD_H)
    {
        printf("Error");
    }

    lcd_address_set(x, y, x + length - 1, y + wide - 1);

    for(i=0;i<length * wide * 2;i++)
    {
        *(__IO u8*)LCD_DATA=p[i];
    }

}

#endif
