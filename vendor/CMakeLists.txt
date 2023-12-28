if(${APP} STREQUAL "BLE_Serial")
    set(app_dir USART/${APP})
elseif(${APP} STREQUAL "Wifi_ESP8266")
    set(app_dir USART/${APP})
else()
    set(app_dir ${APP})
endif()
list(APPEND ADD_INCLUDE 
"${CMAKE_CURRENT_SOURCE_DIR}/Core"
"${CMAKE_CURRENT_SOURCE_DIR}/Debug"
"${CMAKE_CURRENT_SOURCE_DIR}/Peripheral/inc"
"${CMAKE_SOURCE_DIR}/firmware/${app_dir}/User"
)
file(GLOB_RECURSE sources 
"${CMAKE_CURRENT_SOURCE_DIR}/Core/core_riscv.c"
"${CMAKE_CURRENT_SOURCE_DIR}/Debug/debug.c"
"${CMAKE_CURRENT_SOURCE_DIR}/Peripheral/src/*.c"
"${CMAKE_CURRENT_SOURCE_DIR}/Startup/startup_ch32v30x.S"
)
list(APPEND ADD_SRCS  ${sources})
list(APPEND ADD_DEFINITIONS -DARCH_RISCV)
generate_library()