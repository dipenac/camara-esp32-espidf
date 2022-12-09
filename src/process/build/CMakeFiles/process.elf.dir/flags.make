# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# compile C with /home/daniel/.espressif/tools/xtensa-esp32-elf/esp-2022r1-11.2.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc
C_FLAGS = -mlongcalls -Wno-frame-address    -mfix-esp32-psram-cache-issue -mfix-esp32-psram-cache-strategy=memw

C_DEFINES = -DMBEDTLS_CONFIG_FILE=\"mbedtls/esp_config.h\" -DUNITY_INCLUDE_CONFIG_H

C_INCLUDES = -I/home/daniel/esp-idf/components/xtensa/include -I/home/daniel/esp-idf/components/xtensa/esp32/include -I/home/daniel/Documents/GitHub/camara-esp32-espidf/src/process/build/config -I/home/daniel/esp-idf/components/newlib/platform_include -I/home/daniel/esp-idf/components/freertos/FreeRTOS-Kernel/include -I/home/daniel/esp-idf/components/freertos/FreeRTOS-Kernel/portable/xtensa/include -I/home/daniel/esp-idf/components/freertos/esp_additions/include/freertos -I/home/daniel/esp-idf/components/freertos/esp_additions/include -I/home/daniel/esp-idf/components/esp_hw_support/include -I/home/daniel/esp-idf/components/esp_hw_support/include/soc -I/home/daniel/esp-idf/components/esp_hw_support/include/soc/esp32 -I/home/daniel/esp-idf/components/esp_hw_support/port/esp32/. -I/home/daniel/esp-idf/components/esp_hw_support/port/esp32/private_include -I/home/daniel/esp-idf/components/heap/include -I/home/daniel/esp-idf/components/log/include -I/home/daniel/esp-idf/components/soc/include -I/home/daniel/esp-idf/components/soc/esp32/. -I/home/daniel/esp-idf/components/soc/esp32/include -I/home/daniel/esp-idf/components/hal/esp32/include -I/home/daniel/esp-idf/components/hal/include -I/home/daniel/esp-idf/components/hal/platform_port/include -I/home/daniel/esp-idf/components/esp_rom/include -I/home/daniel/esp-idf/components/esp_rom/include/esp32 -I/home/daniel/esp-idf/components/esp_rom/esp32 -I/home/daniel/esp-idf/components/esp_common/include -I/home/daniel/esp-idf/components/esp_system/include -I/home/daniel/esp-idf/components/esp_system/port/soc -I/home/daniel/esp-idf/components/esp_system/port/include/private -I/home/daniel/esp-idf/components/lwip/include -I/home/daniel/esp-idf/components/lwip/include/apps -I/home/daniel/esp-idf/components/lwip/include/apps/sntp -I/home/daniel/esp-idf/components/lwip/lwip/src/include -I/home/daniel/esp-idf/components/lwip/port/esp32/include -I/home/daniel/esp-idf/components/lwip/port/esp32/include/arch -I/home/daniel/esp-idf/components/esp_ringbuf/include -I/home/daniel/esp-idf/components/efuse/include -I/home/daniel/esp-idf/components/efuse/esp32/include -I/home/daniel/esp-idf/components/driver/include -I/home/daniel/esp-idf/components/driver/deprecated -I/home/daniel/esp-idf/components/driver/esp32/include -I/home/daniel/esp-idf/components/esp_pm/include -I/home/daniel/esp-idf/components/mbedtls/port/include -I/home/daniel/esp-idf/components/mbedtls/mbedtls/include -I/home/daniel/esp-idf/components/mbedtls/mbedtls/library -I/home/daniel/esp-idf/components/mbedtls/esp_crt_bundle/include -I/home/daniel/esp-idf/components/esp_app_format/include -I/home/daniel/esp-idf/components/bootloader_support/include -I/home/daniel/esp-idf/components/bootloader_support/bootloader_flash/include -I/home/daniel/esp-idf/components/esp_partition/include -I/home/daniel/esp-idf/components/app_update/include -I/home/daniel/esp-idf/components/spi_flash/include -I/home/daniel/esp-idf/components/pthread/include -I/home/daniel/esp-idf/components/esp_timer/include -I/home/daniel/esp-idf/components/app_trace/include -I/home/daniel/esp-idf/components/esp_event/include -I/home/daniel/esp-idf/components/nvs_flash/include -I/home/daniel/esp-idf/components/esp_phy/include -I/home/daniel/esp-idf/components/esp_phy/esp32/include -I/home/daniel/esp-idf/components/vfs/include -I/home/daniel/esp-idf/components/esp_netif/include -I/home/daniel/esp-idf/components/wpa_supplicant/include -I/home/daniel/esp-idf/components/wpa_supplicant/port/include -I/home/daniel/esp-idf/components/wpa_supplicant/esp_supplicant/include -I/home/daniel/esp-idf/components/esp_wifi/include -I/home/daniel/esp-idf/components/unity/include -I/home/daniel/esp-idf/components/unity/unity/src -I/home/daniel/esp-idf/components/cmock/CMock/src -I/home/daniel/esp-idf/components/console -I/home/daniel/esp-idf/components/http_parser -I/home/daniel/esp-idf/components/esp-tls -I/home/daniel/esp-idf/components/esp-tls/esp-tls-crypto -I/home/daniel/esp-idf/components/esp32-camera/driver/include -I/home/daniel/esp-idf/components/esp32-camera/conversions/include -I/home/daniel/esp-idf/components/esp_adc/include -I/home/daniel/esp-idf/components/esp_adc/interface -I/home/daniel/esp-idf/components/esp_adc/esp32/include -I/home/daniel/esp-idf/components/esp_adc/deprecated/include -I/home/daniel/esp-idf/components/esp_eth/include -I/home/daniel/esp-idf/components/esp_gdbstub/include -I/home/daniel/esp-idf/components/esp_gdbstub/xtensa -I/home/daniel/esp-idf/components/esp_gdbstub/esp32 -I/home/daniel/esp-idf/components/esp_hid/include -I/home/daniel/esp-idf/components/tcp_transport/include -I/home/daniel/esp-idf/components/esp_http_client/include -I/home/daniel/esp-idf/components/esp_http_server/include -I/home/daniel/esp-idf/components/esp_https_ota/include -I/home/daniel/esp-idf/components/esp_lcd/include -I/home/daniel/esp-idf/components/esp_lcd/interface -I/home/daniel/esp-idf/components/protobuf-c/protobuf-c -I/home/daniel/esp-idf/components/protocomm/include/common -I/home/daniel/esp-idf/components/protocomm/include/security -I/home/daniel/esp-idf/components/protocomm/include/transports -I/home/daniel/esp-idf/components/esp_local_ctrl/include -I/home/daniel/esp-idf/components/esp_psram/include -I/home/daniel/esp-idf/components/espcoredump/include -I/home/daniel/esp-idf/components/espcoredump/include/port/xtensa -I/home/daniel/esp-idf/components/wear_levelling/include -I/home/daniel/esp-idf/components/sdmmc/include -I/home/daniel/esp-idf/components/fatfs/diskio -I/home/daniel/esp-idf/components/fatfs/vfs -I/home/daniel/esp-idf/components/fatfs/src -I/home/daniel/esp-idf/components/idf_test/include -I/home/daniel/esp-idf/components/idf_test/include/esp32 -I/home/daniel/esp-idf/components/ieee802154/include -I/home/daniel/esp-idf/components/json/cJSON -I/home/daniel/esp-idf/components/mqtt/esp-mqtt/include -I/home/daniel/esp-idf/components/perfmon/include -I/home/daniel/esp-idf/components/spiffs/include -I/home/daniel/esp-idf/components/ulp/ulp_common/include -I/home/daniel/esp-idf/components/ulp/ulp_common/include/esp32 -I/home/daniel/esp-idf/components/wifi_provisioning/include -I/home/daniel/Documents/GitHub/camara-esp32-espidf/src/process/main 

