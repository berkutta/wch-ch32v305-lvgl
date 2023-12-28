# Project Name
PROJECT = ch32v305-lvgl

# Path you your toolchain and openocd installation, leave empty if already in system PATH
TOOLCHAIN_ROOT = "/opt/wch/mounriver-studio-toolchain-riscv-gcc/bin/"
OPENOCD_ROOT   = "/opt/wch/mounriver-studio-toolchain-openocd/bin/"

# Path to the WCH vendor codebase, make sure to update the submodule to get the code
VENDOR_ROOT = ./vendor/

LVGL_ROOT = ./src/lib/lvgl/

###############################################################################

# Project specific
TARGET = $(PROJECT).elf
SRC_DIR = src/

CORE_DIR = $(VENDOR_ROOT)Core/
DEBUG_DIR = $(VENDOR_ROOT)Debug/
PERIPHERAL_DIR = $(VENDOR_ROOT)Peripheral/
STARTUP_DIR = $(VENDOR_ROOT)Startup/

# Toolchain
CC = $(TOOLCHAIN_ROOT)riscv-none-embed-gcc
DB = $(TOOLCHAIN_ROOT)riscv-none-embed-gdb
SIZE = $(TOOLCHAIN_ROOT)riscv-none-embed-size

# Project sources
SRC_FILES  = $(wildcard $(SRC_DIR)*.c) 

# LVGL
SRC_FILES += $(LVGL_ROOT)src/widgets/lv_arc.o
SRC_FILES += $(LVGL_ROOT)src/widgets/lv_bar.o
SRC_FILES += $(LVGL_ROOT)src/widgets/lv_btn.o
SRC_FILES += $(LVGL_ROOT)src/widgets/lv_btnmatrix.o
SRC_FILES += $(LVGL_ROOT)src/widgets/lv_canvas.o
SRC_FILES += $(LVGL_ROOT)src/widgets/lv_checkbox.o
SRC_FILES += $(LVGL_ROOT)src/widgets/lv_dropdown.o
SRC_FILES += $(LVGL_ROOT)src/widgets/lv_img.o
SRC_FILES += $(LVGL_ROOT)src/widgets/lv_label.o
SRC_FILES += $(LVGL_ROOT)src/widgets/lv_line.o
SRC_FILES += $(LVGL_ROOT)src/widgets/lv_objx_templ.o
SRC_FILES += $(LVGL_ROOT)src/widgets/lv_roller.o
SRC_FILES += $(LVGL_ROOT)src/widgets/lv_slider.o
SRC_FILES += $(LVGL_ROOT)src/widgets/lv_switch.o
SRC_FILES += $(LVGL_ROOT)src/widgets/lv_table.o
SRC_FILES += $(LVGL_ROOT)src/widgets/lv_textarea.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_anim.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_anim_timeline.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_area.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_async.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_bidi.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_color.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_fs.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_gc.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_ll.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_log.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_lru.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_math.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_mem.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_printf.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_style.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_style_gen.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_templ.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_timer.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_tlsf.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_txt.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_txt_ap.o
SRC_FILES += $(LVGL_ROOT)src/misc/lv_utils.o
SRC_FILES += $(LVGL_ROOT)src/hal/lv_hal_disp.o
SRC_FILES += $(LVGL_ROOT)src/hal/lv_hal_indev.o
SRC_FILES += $(LVGL_ROOT)src/hal/lv_hal_tick.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_dejavu_16_persian_hebrew.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_fmt_txt.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_loader.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_10.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_12.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_12_subpx.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_14.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_16.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_18.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_20.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_22.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_24.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_26.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_28.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_28_compressed.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_30.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_32.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_34.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_36.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_38.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_40.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_42.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_44.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_46.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_48.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_montserrat_8.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_simsun_16_cjk.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_unscii_16.o
SRC_FILES += $(LVGL_ROOT)src/font/lv_font_unscii_8.o
SRC_FILES += $(LVGL_ROOT)src/extra/widgets/win/lv_win.o
SRC_FILES += $(LVGL_ROOT)src/extra/widgets/tileview/lv_tileview.o
SRC_FILES += $(LVGL_ROOT)src/extra/widgets/tabview/lv_tabview.o
SRC_FILES += $(LVGL_ROOT)src/extra/widgets/spinner/lv_spinner.o
SRC_FILES += $(LVGL_ROOT)src/extra/widgets/spinbox/lv_spinbox.o
SRC_FILES += $(LVGL_ROOT)src/extra/widgets/span/lv_span.o
SRC_FILES += $(LVGL_ROOT)src/extra/widgets/msgbox/lv_msgbox.o
SRC_FILES += $(LVGL_ROOT)src/extra/widgets/meter/lv_meter.o
SRC_FILES += $(LVGL_ROOT)src/extra/widgets/menu/lv_menu.o
SRC_FILES += $(LVGL_ROOT)src/extra/widgets/list/lv_list.o
SRC_FILES += $(LVGL_ROOT)src/extra/widgets/led/lv_led.o
SRC_FILES += $(LVGL_ROOT)src/extra/widgets/keyboard/lv_keyboard.o
SRC_FILES += $(LVGL_ROOT)src/extra/widgets/imgbtn/lv_imgbtn.o
SRC_FILES += $(LVGL_ROOT)src/extra/widgets/colorwheel/lv_colorwheel.o
SRC_FILES += $(LVGL_ROOT)src/extra/widgets/chart/lv_chart.o
SRC_FILES += $(LVGL_ROOT)src/extra/widgets/calendar/lv_calendar.o
SRC_FILES += $(LVGL_ROOT)src/extra/widgets/calendar/lv_calendar_header_arrow.o
SRC_FILES += $(LVGL_ROOT)src/extra/widgets/calendar/lv_calendar_header_dropdown.o
SRC_FILES += $(LVGL_ROOT)src/extra/widgets/animimg/lv_animimg.o
SRC_FILES += $(LVGL_ROOT)src/extra/themes/mono/lv_theme_mono.o
SRC_FILES += $(LVGL_ROOT)src/extra/themes/default/lv_theme_default.o
SRC_FILES += $(LVGL_ROOT)src/extra/themes/basic/lv_theme_basic.o
SRC_FILES += $(LVGL_ROOT)src/extra/others/snapshot/lv_snapshot.o
SRC_FILES += $(LVGL_ROOT)src/extra/others/msg/lv_msg.o
SRC_FILES += $(LVGL_ROOT)src/extra/others/monkey/lv_monkey.o
SRC_FILES += $(LVGL_ROOT)src/extra/others/imgfont/lv_imgfont.o
SRC_FILES += $(LVGL_ROOT)src/extra/others/gridnav/lv_gridnav.o
SRC_FILES += $(LVGL_ROOT)src/extra/others/fragment/lv_fragment.o
SRC_FILES += $(LVGL_ROOT)src/extra/others/fragment/lv_fragment_manager.o
SRC_FILES += $(LVGL_ROOT)src/extra/libs/sjpg/lv_sjpg.o
SRC_FILES += $(LVGL_ROOT)src/extra/libs/sjpg/tjpgd.o
SRC_FILES += $(LVGL_ROOT)src/extra/libs/rlottie/lv_rlottie.o
SRC_FILES += $(LVGL_ROOT)src/extra/libs/qrcode/lv_qrcode.o
SRC_FILES += $(LVGL_ROOT)src/extra/libs/qrcode/qrcodegen.o
SRC_FILES += $(LVGL_ROOT)src/extra/libs/png/lodepng.o
SRC_FILES += $(LVGL_ROOT)src/extra/libs/png/lv_png.o
SRC_FILES += $(LVGL_ROOT)src/extra/libs/gif/gifdec.o
SRC_FILES += $(LVGL_ROOT)src/extra/libs/gif/lv_gif.o
SRC_FILES += $(LVGL_ROOT)src/extra/libs/fsdrv/lv_fs_fatfs.o
SRC_FILES += $(LVGL_ROOT)src/extra/libs/fsdrv/lv_fs_posix.o
SRC_FILES += $(LVGL_ROOT)src/extra/libs/fsdrv/lv_fs_stdio.o
SRC_FILES += $(LVGL_ROOT)src/extra/libs/fsdrv/lv_fs_win32.o
SRC_FILES += $(LVGL_ROOT)src/extra/libs/freetype/lv_freetype.o
SRC_FILES += $(LVGL_ROOT)src/extra/libs/ffmpeg/lv_ffmpeg.o
SRC_FILES += $(LVGL_ROOT)src/extra/libs/bmp/lv_bmp.o
SRC_FILES += $(LVGL_ROOT)src/extra/layouts/grid/lv_grid.o
SRC_FILES += $(LVGL_ROOT)src/extra/layouts/flex/lv_flex.o
SRC_FILES += $(LVGL_ROOT)src/extra/lv_extra.o
SRC_FILES += $(LVGL_ROOT)src/draw/sw/lv_draw_sw.o
SRC_FILES += $(LVGL_ROOT)src/draw/sw/lv_draw_sw_arc.o
SRC_FILES += $(LVGL_ROOT)src/draw/sw/lv_draw_sw_blend.o
SRC_FILES += $(LVGL_ROOT)src/draw/sw/lv_draw_sw_dither.o
SRC_FILES += $(LVGL_ROOT)src/draw/sw/lv_draw_sw_gradient.o
SRC_FILES += $(LVGL_ROOT)src/draw/sw/lv_draw_sw_img.o
SRC_FILES += $(LVGL_ROOT)src/draw/sw/lv_draw_sw_letter.o
SRC_FILES += $(LVGL_ROOT)src/draw/sw/lv_draw_sw_line.o
SRC_FILES += $(LVGL_ROOT)src/draw/sw/lv_draw_sw_polygon.o
SRC_FILES += $(LVGL_ROOT)src/draw/sw/lv_draw_sw_rect.o
SRC_FILES += $(LVGL_ROOT)src/draw/stm32_dma2d/lv_gpu_stm32_dma2d.o
SRC_FILES += $(LVGL_ROOT)src/draw/sdl/lv_draw_sdl.o
SRC_FILES += $(LVGL_ROOT)src/draw/sdl/lv_draw_sdl_arc.o
SRC_FILES += $(LVGL_ROOT)src/draw/sdl/lv_draw_sdl_bg.o
SRC_FILES += $(LVGL_ROOT)src/draw/sdl/lv_draw_sdl_composite.o
SRC_FILES += $(LVGL_ROOT)src/draw/sdl/lv_draw_sdl_img.o
SRC_FILES += $(LVGL_ROOT)src/draw/sdl/lv_draw_sdl_label.o
SRC_FILES += $(LVGL_ROOT)src/draw/sdl/lv_draw_sdl_line.o
SRC_FILES += $(LVGL_ROOT)src/draw/sdl/lv_draw_sdl_mask.o
SRC_FILES += $(LVGL_ROOT)src/draw/sdl/lv_draw_sdl_polygon.o
SRC_FILES += $(LVGL_ROOT)src/draw/sdl/lv_draw_sdl_rect.o
SRC_FILES += $(LVGL_ROOT)src/draw/sdl/lv_draw_sdl_stack_blur.o
SRC_FILES += $(LVGL_ROOT)src/draw/sdl/lv_draw_sdl_texture_cache.o
SRC_FILES += $(LVGL_ROOT)src/draw/sdl/lv_draw_sdl_utils.o
SRC_FILES += $(LVGL_ROOT)src/draw/nxp_vglite/lv_gpu_nxp_vglite.o
SRC_FILES += $(LVGL_ROOT)src/draw/nxp_pxp/lv_gpu_nxp_pxp.o
SRC_FILES += $(LVGL_ROOT)src/draw/nxp_pxp/lv_gpu_nxp_pxp_osa.o
SRC_FILES += $(LVGL_ROOT)src/draw/arm2d/lv_gpu_arm2d.o
SRC_FILES += $(LVGL_ROOT)src/draw/lv_draw.o
SRC_FILES += $(LVGL_ROOT)src/draw/lv_draw_arc.o
SRC_FILES += $(LVGL_ROOT)src/draw/lv_draw_img.o
SRC_FILES += $(LVGL_ROOT)src/draw/lv_draw_label.o
SRC_FILES += $(LVGL_ROOT)src/draw/lv_draw_line.o
SRC_FILES += $(LVGL_ROOT)src/draw/lv_draw_mask.o
SRC_FILES += $(LVGL_ROOT)src/draw/lv_draw_rect.o
SRC_FILES += $(LVGL_ROOT)src/draw/lv_draw_triangle.o
SRC_FILES += $(LVGL_ROOT)src/draw/lv_img_buf.o
SRC_FILES += $(LVGL_ROOT)src/draw/lv_img_cache.o
SRC_FILES += $(LVGL_ROOT)src/draw/lv_img_decoder.o
SRC_FILES += $(LVGL_ROOT)src/core/lv_disp.o
SRC_FILES += $(LVGL_ROOT)src/core/lv_event.o
SRC_FILES += $(LVGL_ROOT)src/core/lv_group.o
SRC_FILES += $(LVGL_ROOT)src/core/lv_indev.o
SRC_FILES += $(LVGL_ROOT)src/core/lv_indev_scroll.o
SRC_FILES += $(LVGL_ROOT)src/core/lv_obj.o
SRC_FILES += $(LVGL_ROOT)src/core/lv_obj_class.o
SRC_FILES += $(LVGL_ROOT)src/core/lv_obj_draw.o
SRC_FILES += $(LVGL_ROOT)src/core/lv_obj_pos.o
SRC_FILES += $(LVGL_ROOT)src/core/lv_obj_scroll.o
SRC_FILES += $(LVGL_ROOT)src/core/lv_obj_style.o
SRC_FILES += $(LVGL_ROOT)src/core/lv_obj_style_gen.o
SRC_FILES += $(LVGL_ROOT)src/core/lv_obj_tree.o
SRC_FILES += $(LVGL_ROOT)src/core/lv_refr.o
SRC_FILES += $(LVGL_ROOT)src/core/lv_theme.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/win/lv_example_win_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/tileview/lv_example_tileview_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/textarea/lv_example_textarea_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/textarea/lv_example_textarea_2.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/textarea/lv_example_textarea_3.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/tabview/lv_example_tabview_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/tabview/lv_example_tabview_2.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/table/lv_example_table_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/table/lv_example_table_2.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/switch/lv_example_switch_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/spinner/lv_example_spinner_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/spinbox/lv_example_spinbox_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/span/lv_example_span_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/slider/lv_example_slider_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/slider/lv_example_slider_2.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/slider/lv_example_slider_3.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/roller/lv_example_roller_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/roller/lv_example_roller_2.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/roller/lv_example_roller_3.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/msgbox/lv_example_msgbox_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/meter/lv_example_meter_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/meter/lv_example_meter_2.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/meter/lv_example_meter_3.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/meter/lv_example_meter_4.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/menu/lv_example_menu_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/menu/lv_example_menu_2.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/menu/lv_example_menu_3.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/menu/lv_example_menu_4.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/menu/lv_example_menu_5.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/list/lv_example_list_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/list/lv_example_list_2.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/line/lv_example_line_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/led/lv_example_led_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/label/lv_example_label_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/label/lv_example_label_2.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/label/lv_example_label_3.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/label/lv_example_label_4.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/label/lv_example_label_5.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/keyboard/lv_example_keyboard_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/imgbtn/lv_example_imgbtn_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/img/lv_example_img_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/img/lv_example_img_2.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/img/lv_example_img_3.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/img/lv_example_img_4.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/dropdown/lv_example_dropdown_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/dropdown/lv_example_dropdown_2.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/dropdown/lv_example_dropdown_3.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/colorwheel/lv_example_colorwheel_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/checkbox/lv_example_checkbox_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/checkbox/lv_example_checkbox_2.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/chart/lv_example_chart_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/chart/lv_example_chart_2.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/chart/lv_example_chart_3.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/chart/lv_example_chart_4.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/chart/lv_example_chart_5.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/chart/lv_example_chart_6.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/chart/lv_example_chart_7.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/chart/lv_example_chart_8.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/chart/lv_example_chart_9.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/canvas/lv_example_canvas_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/canvas/lv_example_canvas_2.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/calendar/lv_example_calendar_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/btnmatrix/lv_example_btnmatrix_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/btnmatrix/lv_example_btnmatrix_2.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/btnmatrix/lv_example_btnmatrix_3.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/btn/lv_example_btn_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/btn/lv_example_btn_2.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/btn/lv_example_btn_3.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/bar/lv_example_bar_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/bar/lv_example_bar_2.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/bar/lv_example_bar_3.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/bar/lv_example_bar_4.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/bar/lv_example_bar_5.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/bar/lv_example_bar_6.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/arc/lv_example_arc_1.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/arc/lv_example_arc_2.o
SRC_FILES += $(LVGL_ROOT)examples/widgets/animimg/lv_example_animimg_1.o
SRC_FILES += $(LVGL_ROOT)examples/styles/lv_example_style_1.o
SRC_FILES += $(LVGL_ROOT)examples/styles/lv_example_style_10.o
SRC_FILES += $(LVGL_ROOT)examples/styles/lv_example_style_11.o
SRC_FILES += $(LVGL_ROOT)examples/styles/lv_example_style_12.o
SRC_FILES += $(LVGL_ROOT)examples/styles/lv_example_style_13.o
SRC_FILES += $(LVGL_ROOT)examples/styles/lv_example_style_14.o
SRC_FILES += $(LVGL_ROOT)examples/styles/lv_example_style_2.o
SRC_FILES += $(LVGL_ROOT)examples/styles/lv_example_style_3.o
SRC_FILES += $(LVGL_ROOT)examples/styles/lv_example_style_4.o
SRC_FILES += $(LVGL_ROOT)examples/styles/lv_example_style_5.o
SRC_FILES += $(LVGL_ROOT)examples/styles/lv_example_style_6.o
SRC_FILES += $(LVGL_ROOT)examples/styles/lv_example_style_7.o
SRC_FILES += $(LVGL_ROOT)examples/styles/lv_example_style_8.o
SRC_FILES += $(LVGL_ROOT)examples/styles/lv_example_style_9.o
SRC_FILES += $(LVGL_ROOT)examples/scroll/lv_example_scroll_1.o
SRC_FILES += $(LVGL_ROOT)examples/scroll/lv_example_scroll_2.o
SRC_FILES += $(LVGL_ROOT)examples/scroll/lv_example_scroll_3.o
SRC_FILES += $(LVGL_ROOT)examples/scroll/lv_example_scroll_4.o
SRC_FILES += $(LVGL_ROOT)examples/scroll/lv_example_scroll_5.o
SRC_FILES += $(LVGL_ROOT)examples/scroll/lv_example_scroll_6.o
SRC_FILES += $(LVGL_ROOT)examples/porting/lv_port_disp.o
SRC_FILES += $(LVGL_ROOT)examples/porting/lv_port_fs_template.o
SRC_FILES += $(LVGL_ROOT)examples/porting/lv_port_indev_template.o
SRC_FILES += $(LVGL_ROOT)examples/others/snapshot/lv_example_snapshot_1.o
SRC_FILES += $(LVGL_ROOT)examples/others/msg/lv_example_msg_1.o
SRC_FILES += $(LVGL_ROOT)examples/others/msg/lv_example_msg_2.o
SRC_FILES += $(LVGL_ROOT)examples/others/msg/lv_example_msg_3.o
SRC_FILES += $(LVGL_ROOT)examples/others/monkey/lv_example_monkey_1.o
SRC_FILES += $(LVGL_ROOT)examples/others/monkey/lv_example_monkey_2.o
SRC_FILES += $(LVGL_ROOT)examples/others/monkey/lv_example_monkey_3.o
SRC_FILES += $(LVGL_ROOT)examples/others/imgfont/lv_example_imgfont_1.o
SRC_FILES += $(LVGL_ROOT)examples/others/gridnav/lv_example_gridnav_1.o
SRC_FILES += $(LVGL_ROOT)examples/others/gridnav/lv_example_gridnav_2.o
SRC_FILES += $(LVGL_ROOT)examples/others/gridnav/lv_example_gridnav_3.o
SRC_FILES += $(LVGL_ROOT)examples/others/gridnav/lv_example_gridnav_4.o
SRC_FILES += $(LVGL_ROOT)examples/others/fragment/lv_example_fragment_1.o
SRC_FILES += $(LVGL_ROOT)examples/others/fragment/lv_example_fragment_2.o
SRC_FILES += $(LVGL_ROOT)examples/libs/sjpg/lv_example_sjpg_1.o
SRC_FILES += $(LVGL_ROOT)examples/libs/rlottie/lv_example_rlottie_1.o
SRC_FILES += $(LVGL_ROOT)examples/libs/rlottie/lv_example_rlottie_2.o
SRC_FILES += $(LVGL_ROOT)examples/libs/rlottie/lv_example_rlottie_approve.o
SRC_FILES += $(LVGL_ROOT)examples/libs/qrcode/lv_example_qrcode_1.o
SRC_FILES += $(LVGL_ROOT)examples/libs/png/img_wink_png.o
SRC_FILES += $(LVGL_ROOT)examples/libs/png/lv_example_png_1.o
SRC_FILES += $(LVGL_ROOT)examples/libs/gif/img_bulb_gif.o
SRC_FILES += $(LVGL_ROOT)examples/libs/gif/lv_example_gif_1.o
SRC_FILES += $(LVGL_ROOT)examples/libs/freetype/lv_example_freetype_1.o
SRC_FILES += $(LVGL_ROOT)examples/libs/ffmpeg/lv_example_ffmpeg_1.o
SRC_FILES += $(LVGL_ROOT)examples/libs/ffmpeg/lv_example_ffmpeg_2.o
SRC_FILES += $(LVGL_ROOT)examples/libs/bmp/lv_example_bmp_1.o
SRC_FILES += $(LVGL_ROOT)examples/layouts/grid/lv_example_grid_1.o
SRC_FILES += $(LVGL_ROOT)examples/layouts/grid/lv_example_grid_2.o
SRC_FILES += $(LVGL_ROOT)examples/layouts/grid/lv_example_grid_3.o
SRC_FILES += $(LVGL_ROOT)examples/layouts/grid/lv_example_grid_4.o
SRC_FILES += $(LVGL_ROOT)examples/layouts/grid/lv_example_grid_5.o
SRC_FILES += $(LVGL_ROOT)examples/layouts/grid/lv_example_grid_6.o
SRC_FILES += $(LVGL_ROOT)examples/layouts/flex/lv_example_flex_1.o
SRC_FILES += $(LVGL_ROOT)examples/layouts/flex/lv_example_flex_2.o
SRC_FILES += $(LVGL_ROOT)examples/layouts/flex/lv_example_flex_3.o
SRC_FILES += $(LVGL_ROOT)examples/layouts/flex/lv_example_flex_4.o
SRC_FILES += $(LVGL_ROOT)examples/layouts/flex/lv_example_flex_5.o
SRC_FILES += $(LVGL_ROOT)examples/layouts/flex/lv_example_flex_6.o
SRC_FILES += $(LVGL_ROOT)examples/get_started/lv_example_get_started_1.o
SRC_FILES += $(LVGL_ROOT)examples/get_started/lv_example_get_started_2.o
SRC_FILES += $(LVGL_ROOT)examples/get_started/lv_example_get_started_3.o
SRC_FILES += $(LVGL_ROOT)examples/event/lv_example_event_1.o
SRC_FILES += $(LVGL_ROOT)examples/event/lv_example_event_2.o
SRC_FILES += $(LVGL_ROOT)examples/event/lv_example_event_3.o
SRC_FILES += $(LVGL_ROOT)examples/event/lv_example_event_4.o
SRC_FILES += $(LVGL_ROOT)examples/assets/emoji/img_emoji_F617.o
SRC_FILES += $(LVGL_ROOT)examples/assets/animimg001.o
SRC_FILES += $(LVGL_ROOT)examples/assets/animimg002.o
SRC_FILES += $(LVGL_ROOT)examples/assets/animimg003.o
SRC_FILES += $(LVGL_ROOT)examples/assets/img_caret_down.o
SRC_FILES += $(LVGL_ROOT)examples/assets/img_cogwheel_alpha16.o
SRC_FILES += $(LVGL_ROOT)examples/assets/img_cogwheel_argb.o
SRC_FILES += $(LVGL_ROOT)examples/assets/img_cogwheel_chroma_keyed.o
SRC_FILES += $(LVGL_ROOT)examples/assets/img_cogwheel_indexed16.o
SRC_FILES += $(LVGL_ROOT)examples/assets/img_cogwheel_rgb.o
SRC_FILES += $(LVGL_ROOT)examples/assets/img_hand.o
SRC_FILES += $(LVGL_ROOT)examples/assets/img_skew_strip.o
SRC_FILES += $(LVGL_ROOT)examples/assets/img_star.o
SRC_FILES += $(LVGL_ROOT)examples/assets/imgbtn_left.o
SRC_FILES += $(LVGL_ROOT)examples/assets/imgbtn_mid.o
SRC_FILES += $(LVGL_ROOT)examples/assets/imgbtn_right.o
SRC_FILES += $(LVGL_ROOT)examples/anim/lv_example_anim_1.o
SRC_FILES += $(LVGL_ROOT)examples/anim/lv_example_anim_2.o
SRC_FILES += $(LVGL_ROOT)examples/anim/lv_example_anim_3.o
SRC_FILES += $(LVGL_ROOT)examples/anim/lv_example_anim_timeline_1.o
SRC_FILES += $(LVGL_ROOT)demos/widgets/assets/img_clothes.o
SRC_FILES += $(LVGL_ROOT)demos/widgets/assets/img_demo_widgets_avatar.o
SRC_FILES += $(LVGL_ROOT)demos/widgets/assets/img_lvgl_logo.o
SRC_FILES += $(LVGL_ROOT)demos/widgets/lv_demo_widgets.o
SRC_FILES += $(LVGL_ROOT)demos/stress/lv_demo_stress.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_btn_corner_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_btn_list_pause.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_btn_list_pause_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_btn_list_play.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_btn_list_play_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_btn_loop.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_btn_loop_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_btn_next.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_btn_next_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_btn_pause.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_btn_pause_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_btn_play.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_btn_play_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_btn_prev.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_btn_prev_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_btn_rnd.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_btn_rnd_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_corner_left.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_corner_left_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_corner_right.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_corner_right_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_cover_1.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_cover_1_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_cover_2.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_cover_2_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_cover_3.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_cover_3_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_icon_1.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_icon_1_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_icon_2.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_icon_2_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_icon_3.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_icon_3_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_icon_4.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_icon_4_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_list_border.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_list_border_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_logo.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_slider_knob.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_slider_knob_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_wave_bottom.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_wave_bottom_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_wave_top.o
SRC_FILES += $(LVGL_ROOT)demos/music/assets/img_lv_demo_music_wave_top_large.o
SRC_FILES += $(LVGL_ROOT)demos/music/lv_demo_music.o
SRC_FILES += $(LVGL_ROOT)demos/music/lv_demo_music_list.o
SRC_FILES += $(LVGL_ROOT)demos/music/lv_demo_music_main.o
SRC_FILES += $(LVGL_ROOT)demos/keypad_encoder/lv_demo_keypad_encoder.o
SRC_FILES += $(LVGL_ROOT)demos/benchmark/assets/img_benchmark_cogwheel_alpha16.o
SRC_FILES += $(LVGL_ROOT)demos/benchmark/assets/img_benchmark_cogwheel_argb.o
SRC_FILES += $(LVGL_ROOT)demos/benchmark/assets/img_benchmark_cogwheel_chroma_keyed.o
SRC_FILES += $(LVGL_ROOT)demos/benchmark/assets/img_benchmark_cogwheel_indexed16.o
SRC_FILES += $(LVGL_ROOT)demos/benchmark/assets/img_benchmark_cogwheel_rgb.o
SRC_FILES += $(LVGL_ROOT)demos/benchmark/assets/lv_font_bechmark_montserrat_12_compr_az.c.o
SRC_FILES += $(LVGL_ROOT)demos/benchmark/assets/lv_font_bechmark_montserrat_16_compr_az.c.o
SRC_FILES += $(LVGL_ROOT)demos/benchmark/assets/lv_font_bechmark_montserrat_28_compr_az.c.o
SRC_FILES += $(LVGL_ROOT)demos/benchmark/lv_demo_benchmark.o

# Project includes
INCLUDES  = -I$(SRC_DIR)

INCLUDES += -I$(LVGL_ROOT)
INCLUDES += -I$(LVGL_ROOT)/examples
INCLUDES += -I$(LVGL_ROOT)/examples/porting
INCLUDES += -I$(LVGL_ROOT)/src
INCLUDES += -I$(LVGL_ROOT)/src/core
INCLUDES += -I$(LVGL_ROOT)/src/draw
INCLUDES += -I$(LVGL_ROOT)/src/extra
INCLUDES += -I$(LVGL_ROOT)/src/font
INCLUDES += -I$(LVGL_ROOT)/src/hal
INCLUDES += -I$(LVGL_ROOT)/src/misc
INCLUDES += -I$(LVGL_ROOT)/src/widgets

# Vendor sources:
ASM_FILES += $(STARTUP_DIR)startup_ch32v30x.S
SRC_FILES += $(CORE_DIR)core_riscv.c
SRC_FILES += $(DEBUG_DIR)debug.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_adc.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_bkp.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_can.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_crc.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_dac.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_dbgmcu.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_dma.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_dvp.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_eth.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_exti.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_flash.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_fsmc.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_gpio.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_i2c.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_iwdg.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_misc.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_opa.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_pwr.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_rcc.c 
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_rng.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_rtc.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_sdio.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_spi.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_tim.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_usart.c
SRC_FILES += $(PERIPHERAL_DIR)src/ch32v30x_wwdg.c

# Vendor includes
INCLUDES  += -I$(CORE_DIR)
INCLUDES  += -I$(DEBUG_DIR)
INCLUDES  += -I$(PERIPHERAL_DIR)inc/

# Vendor Link Script
LD_SCRIPT = $(VENDOR_ROOT)Ld/Link.ld

# Compiler Flags
CFLAGS  = -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-save-restore -Os
CFLAGS += -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -Wunused -Wuninitialized -g
CFLAGS += -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)"

CFLAGS += $(INCLUDES)

CFLAGS += -DLV_LVGL_H_INCLUDE_SIMPLE

# Assembler Flags
#ASMFLAGS = -x assembler-with-cpp

# Linker Flags
LFLAGS = -T $(LD_SCRIPT) -nostartfiles -Xlinker --gc-sections -Wl,-Map,$(PROJECT).map --specs=nano.specs --specs=nosys.specs -static

###############################################################################

# This does an in-source build. An out-of-source build that places all object
# files into a build directory would be a better solution, but the goal was to
# keep this file very simple.

CXX_OBJS = $(SRC_FILES:.c=.o)
ASM_OBJS = $(ASM_FILES:.S=.o)
ALL_OBJS = $(ASM_OBJS) $(CXX_OBJS)

.PHONY: clean flash

all: $(TARGET) $(PROJECT).hex

# Compile
$(ASM_OBJS): %.o: %.S
	@echo "[ASM CC] $@"
	@$(CC) $(CFLAGS) $(ASMFLAGS) -c $< -o $@

$(CXX_OBJS): %.o: %.c
	@echo "[CC] $@"
	@$(CC) $(CFLAGS) -c $< -o $@

# Link
%.elf: $(ALL_OBJS)
	@echo "[LD] $@"
	@$(CC) $(CFLAGS) $(LFLAGS) $(ALL_OBJS) -o $@
	@$(SIZE) $@
	@@

%.hex: %.elf
	@echo "[OBJCOPY] $@"
	@$(TOOLCHAIN_ROOT)riscv-none-embed-objcopy -O ihex "$(PROJECT).elf" "$(PROJECT).hex"

# Clean
clean:
	@rm -f $(ALL_OBJS) $(ALL_OBJS:o=d) $(TARGET) $(PROJECT).hex $(PROJECT).map

# Program
flash: $(TARGET)
	sudo $(OPENOCD_ROOT)openocd -f $(OPENOCD_ROOT)wch-riscv.cfg -c init -c halt -c "program $(PROJECT).hex" -c "resume 0" -c exit

gdb:
	sudo $(OPENOCD_ROOT)openocd -f $(OPENOCD_ROOT)wch-riscv.cfg