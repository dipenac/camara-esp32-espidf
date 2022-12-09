# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# compile C with /home/daniel/.espressif/tools/xtensa-esp32-elf/esp-2022r1-11.2.0/xtensa-esp32-elf/bin/xtensa-esp32-elf-gcc
C_FLAGS = -mlongcalls -Wno-frame-address    -ffunction-sections -fdata-sections -Wall -Werror=all -Wno-error=unused-function -Wno-error=unused-variable -Wno-error=unused-but-set-variable -Wno-error=deprecated-declarations -Wextra -Wno-unused-parameter -Wno-sign-compare -Wno-enum-conversion -gdwarf-4 -ggdb -mfix-esp32-psram-cache-issue -mfix-esp32-psram-cache-strategy=memw -Og -fmacro-prefix-map=/home/daniel/Documents/GitHub/camara-esp32-espidf/src/process=. -fmacro-prefix-map=/home/daniel/esp-idf=/IDF -fstrict-volatile-bitfields -fno-jump-tables -fno-tree-switch-conversion -DconfigENABLE_FREERTOS_DEBUG_OCDAWARE=1 -std=gnu17 -Wno-old-style-declaration

C_DEFINES = -DESP_PLATFORM -DIDF_VER=\"v5.1-dev-2186-g454aeb3a48\" -DMBEDTLS_CONFIG_FILE=\"mbedtls/esp_config.h\" -D_GNU_SOURCE -D_POSIX_READER_WRITER_LOCKS

C_INCLUDES = -I/home/daniel/Documents/GitHub/camara-esp32-espidf/src/process/build/config -I/home/daniel/esp-idf/components/esp_common/include -I/home/daniel/esp-idf/components/newlib/platform_include -I/home/daniel/esp-idf/components/freertos/FreeRTOS-Kernel/include -I/home/daniel/esp-idf/components/freertos/FreeRTOS-Kernel/portable/xtensa/include -I/home/daniel/esp-idf/components/freertos/esp_additions/include/freertos -I/home/daniel/esp-idf/components/freertos/esp_additions/include -I/home/daniel/esp-idf/components/esp_hw_support/include -I/home/daniel/esp-idf/components/esp_hw_support/include/soc -I/home/daniel/esp-idf/components/esp_hw_support/include/soc/esp32 -I/home/daniel/esp-idf/components/esp_hw_support/port/esp32/. -I/home/daniel/esp-idf/components/esp_hw_support/port/esp32/private_include -I/home/daniel/esp-idf/components/heap/include -I/home/daniel/esp-idf/components/log/include -I/home/daniel/esp-idf/components/soc/include -I/home/daniel/esp-idf/components/soc/esp32/. -I/home/daniel/esp-idf/components/soc/esp32/include -I/home/daniel/esp-idf/components/hal/esp32/include -I/home/daniel/esp-idf/components/hal/include -I/home/daniel/esp-idf/components/hal/platform_port/include -I/home/daniel/esp-idf/components/esp_rom/include -I/home/daniel/esp-idf/components/esp_rom/include/esp32 -I/home/daniel/esp-idf/components/esp_rom/esp32 -I/home/daniel/esp-idf/components/esp_system/include -I/home/daniel/esp-idf/components/esp_system/port/soc -I/home/daniel/esp-idf/components/esp_system/port/include/private -I/home/daniel/esp-idf/components/xtensa/include -I/home/daniel/esp-idf/components/xtensa/esp32/include -I/home/daniel/esp-idf/components/lwip/include -I/home/daniel/esp-idf/components/lwip/include/apps -I/home/daniel/esp-idf/components/lwip/include/apps/sntp -I/home/daniel/esp-idf/components/lwip/lwip/src/include -I/home/daniel/esp-idf/components/lwip/port/esp32/include -I/home/daniel/esp-idf/components/lwip/port/esp32/include/arch -I/home/daniel/esp-idf/components/ulp/ulp_common/include -I/home/daniel/esp-idf/components/ulp/ulp_common/include/esp32 -I/home/daniel/esp-idf/components/driver/include -I/home/daniel/esp-idf/components/driver/deprecated -I/home/daniel/esp-idf/components/driver/esp32/include -I/home/daniel/esp-idf/components/esp_pm/include -I/home/daniel/esp-idf/components/esp_ringbuf/include -I/home/daniel/esp-idf/components/esp_adc/include -I/home/daniel/esp-idf/components/esp_adc/interface -I/home/daniel/esp-idf/components/esp_adc/esp32/include -I/home/daniel/esp-idf/components/esp_adc/deprecated/include -I/home/daniel/esp-idf/components/efuse/include -I/home/daniel/esp-idf/components/efuse/esp32/include -I/home/daniel/esp-idf/components/esp_http_client/include -I/home/daniel/esp-idf/components/esp_http_server/include -I/home/daniel/esp-idf/components/http_parser -I/home/daniel/esp-idf/components/bootloader_support/include -I/home/daniel/esp-idf/components/bootloader_support/bootloader_flash/include -I/home/daniel/esp-idf/components/nvs_flash/include -I/home/daniel/esp-idf/components/spi_flash/include -I/home/daniel/esp-idf/components/esp_partition/include -I/home/daniel/esp-idf/components/esp_wifi/include -I/home/daniel/esp-idf/components/esp_event/include -I/home/daniel/esp-idf/components/esp_phy/include -I/home/daniel/esp-idf/components/esp_phy/esp32/include -I/home/daniel/esp-idf/components/esp_netif/include -I/home/daniel/esp-idf/components/app_update/include -I/home/daniel/esp-idf/components/esp_app_format/include -I/home/daniel/esp-idf/components/wpa_supplicant/include -I/home/daniel/esp-idf/components/wpa_supplicant/port/include -I/home/daniel/esp-idf/components/wpa_supplicant/esp_supplicant/include -I/home/daniel/esp-idf/components/esp-tls -I/home/daniel/esp-idf/components/esp-tls/esp-tls-crypto -I/home/daniel/esp-idf/components/mbedtls/port/include -I/home/daniel/esp-idf/components/mbedtls/mbedtls/include -I/home/daniel/esp-idf/components/mbedtls/mbedtls/library -I/home/daniel/esp-idf/components/mbedtls/esp_crt_bundle/include -I/home/daniel/esp-idf/components/esp_https_ota/include 

