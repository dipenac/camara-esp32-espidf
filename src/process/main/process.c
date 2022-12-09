#include <esp_log.h>
#include <esp_system.h>
#include <nvs_flash.h>
#include <sys/param.h>
#include <string.h>
#include <stdio.h>
#include <inttypes.h>

#include "freertos/FreeRTOS.h"
#include "freertos/task.h"

#include "driver/sdmmc_host.h"
#include "driver/sdmmc_defs.h"
#include "sdmmc_cmd.h"
#include "esp_vfs_fat.h"
#include "esp_timer.h"
#include "esp_event.h"


// support IDF 5.x
#ifndef portTICK_RATE_MS
#define portTICK_RATE_MS portTICK_PERIOD_MS
#endif

#include "esp_camera.h"

#define BOARD_ESP32CAM_AITHINKER 1

// WROVER-KIT PIN Map
#ifdef BOARD_WROVER_KIT

#define CAM_PIN_PWDN -1  //power down is not used
#define CAM_PIN_RESET -1 //software reset will be performed
#define CAM_PIN_XCLK 21
#define CAM_PIN_SIOD 26
#define CAM_PIN_SIOC 27

#define CAM_PIN_D7 35
#define CAM_PIN_D6 34
#define CAM_PIN_D5 39
#define CAM_PIN_D4 36
#define CAM_PIN_D3 19
#define CAM_PIN_D2 18
#define CAM_PIN_D1 5
#define CAM_PIN_D0 4
#define CAM_PIN_VSYNC 25
#define CAM_PIN_HREF 23
#define CAM_PIN_PCLK 22

#endif

// ESP32Cam (AiThinker) PIN Map
#ifdef BOARD_ESP32CAM_AITHINKER

#define CAM_PIN_PWDN 32
#define CAM_PIN_RESET -1 //software reset will be performed
#define CAM_PIN_XCLK 0
#define CAM_PIN_SIOD 26
#define CAM_PIN_SIOC 27

#define CAM_PIN_D7 35
#define CAM_PIN_D6 34
#define CAM_PIN_D5 39
#define CAM_PIN_D4 36
#define CAM_PIN_D3 21
#define CAM_PIN_D2 19
#define CAM_PIN_D1 18
#define CAM_PIN_D0 5
#define CAM_PIN_VSYNC 25
#define CAM_PIN_HREF 23
#define CAM_PIN_PCLK 22

#endif

static const char *TAG = "example:take_picture";

static camera_config_t camera_config = {
    .pin_pwdn = CAM_PIN_PWDN,
    .pin_reset = CAM_PIN_RESET,
    .pin_xclk = CAM_PIN_XCLK,
    .pin_sccb_sda = CAM_PIN_SIOD,
    .pin_sccb_scl = CAM_PIN_SIOC,

    .pin_d7 = CAM_PIN_D7,
    .pin_d6 = CAM_PIN_D6,
    .pin_d5 = CAM_PIN_D5,
    .pin_d4 = CAM_PIN_D4,
    .pin_d3 = CAM_PIN_D3,
    .pin_d2 = CAM_PIN_D2,
    .pin_d1 = CAM_PIN_D1,
    .pin_d0 = CAM_PIN_D0,
    .pin_vsync = CAM_PIN_VSYNC,
    .pin_href = CAM_PIN_HREF,
    .pin_pclk = CAM_PIN_PCLK,

    //XCLK 20MHz or 10MHz for OV2640 double FPS (Experimental)
    .xclk_freq_hz = 20000000,
    .ledc_timer = LEDC_TIMER_0,
    .ledc_channel = LEDC_CHANNEL_0,

    .pixel_format = PIXFORMAT_JPEG, //YUV422,GRAYSCALE,RGB565,JPEG
    .frame_size = FRAMESIZE_QVGA,    //QQVGA-UXGA, For ESP32, do not use sizes above QVGA when not JPEG. The performance of the ESP32-S series has improved a lot, but JPEG mode always gives better frame rates.

    .jpeg_quality = 12, //0-63, for OV series camera sensors, lower number means higher quality
    .fb_count = 1,       //When jpeg mode is used, if fb_count more than one, the driver will work in continuous mode.
    .grab_mode = CAMERA_GRAB_WHEN_EMPTY,
};



static esp_err_t init_camera()
{
    //initialize the camera
    esp_err_t err = esp_camera_init(&camera_config);
    if (err != ESP_OK)
    {
        ESP_LOGE(TAG, "Camera Init Failed");
        return err;
    }

    sensor_t *s = esp_camera_sensor_get();
    s->set_brightness(s, 2);     // -2 to 2
    s->set_contrast(s, 1);       // -2 to 2
    s->set_saturation(s, 1);     // -2 to 2
    s->set_special_effect(s, 0); // 0 to 6 (0 - No Effect, 1 - Negative, 2 - Grayscale, 3 - Red Tint, 4 - Green Tint, 5 - Blue Tint, 6 - Sepia)
    s->set_whitebal(s, 1);       // 0 = disable , 1 = enable
    s->set_awb_gain(s, 1);       // 0 = disable , 1 = enable
    s->set_wb_mode(s, 0);        // 0 to 4 - if awb_gain enabled (0 - Auto, 1 - Sunny, 2 - Cloudy, 3 - Office, 4 - Home)
    s->set_exposure_ctrl(s, 1);  // 0 = disable , 1 = enable
    s->set_aec2(s, 1);           // 0 = disable , 1 = enable
    s->set_ae_level(s, 1);       // -2 to 2
    s->set_aec_value(s, 1000);    // 0 to 1200
    s->set_gain_ctrl(s, 1);      // 0 = disable , 1 = enable
    s->set_agc_gain(s, 10);       // 0 to 30
    s->set_gainceiling(s, (gainceiling_t)6);  // 0 to 6
    s->set_bpc(s, 1);            // 0 = disable , 1 = enable
    s->set_wpc(s, 1);            // 0 = disable , 1 = enable
    s->set_raw_gma(s, 0);        // 0 = disable , 1 = enable
    s->set_lenc(s, 1);           // 0 = disable , 1 = enable
    s->set_hmirror(s, 1);        // 0 = disable , 1 = enable
    s->set_vflip(s, 1);          // 0 = disable , 1 = enable
    s->set_dcw(s, 1);            // 0 = disable , 1 = enable
    s->set_colorbar(s, 0);       // 0 = disable , 1 = enable

    return ESP_OK;
}

static void init_sdcard()
{
  esp_err_t ret = ESP_FAIL;
  sdmmc_host_t host = SDMMC_HOST_DEFAULT();
  sdmmc_slot_config_t slot_config = SDMMC_SLOT_CONFIG_DEFAULT();
  esp_vfs_fat_sdmmc_mount_config_t mount_config = {
      .format_if_mount_failed = false,
      .max_files = 3,
  };
  sdmmc_card_t *card;

  ESP_LOGI(TAG, "Mounting SD card...");
  ret = esp_vfs_fat_sdmmc_mount("/sdcard", &host, &slot_config, &mount_config, &card);

  if (ret == ESP_OK)
  {
    ESP_LOGI(TAG, "SD card mount successfully!");
  }
  else
  {
    ESP_LOGE(TAG, "Failed to mount SD card VFAT filesystem. Error: %s", esp_err_to_name(ret));
  }
}


void task1(void *param)
{
    init_sdcard();
    if(ESP_OK != init_camera()) {
        return;
    }

    uint32_t resultsToShow = 0xa;     // how much data to display
    // char tReply[];

    uint8_t cmin[3] = {0x32,0x32,0x5}; // Valores minimos de cafe en hexadecimal en orden RGB
    uint8_t cmax[3] = {0xa0,0x8c,0x32}; // Valores maximos de cafe en hexadecimal en orden RGB

    uint8_t vcmin[3] = {0x28,0xa0,0x0}; // Valores minimos de verde claro en hexadecimal en orden RGB
    uint8_t vcmax[3] = {0x50,0xff,0x32}; // Valores maximos de verde claro en hexadecimal en orden RGB
    
    uint8_t vomin[3] = {0xa,0x1e,0x5}; // Valores minimos de verde oscuro en hexadecimal en orden RGB
    uint8_t vomax[3] = {0x28,0x8c,0xf}; // Valores maximos de verde oscuro en hexadecimal en orden RGB

    uint8_t amin[3] = {0xb4,0xdc,0x0}; // Valores minimos de cafe en hexadecimal en orden RGB
    uint8_t amax[3] = {0xeb,0xff,0x28}; // Valores maximos de cafe en hexadecimal en orden RGB
    
    while (1)
    {
        ESP_LOGI(TAG, "Taking picture...");
        camera_fb_t *pic = esp_camera_fb_get();

        // use pic->buf to access the image
        
        ESP_LOGI(TAG, "Picture taken! Its size was: %zu bytes", pic->len);
        uint8_t *buffer = pic->buf;
        ESP_LOGI(TAG, "Data: %x", buffer[500]);
        FILE *file = fopen("/sdcard/pic_1.jpg", "w");
        if (file != NULL)
        {
        fwrite(pic->buf, 1, pic->len, file);
        ESP_LOGI(TAG, "File saved");
        }
        else
        {
        ESP_LOGE(TAG, "Could not open file =(");
        }


        // allocate memory to store rgb data in psram
        uint32_t *ptrVal = NULL;
        uint32_t ARRAY_LENGTH = pic->width * pic->height * 3;               // number of pixels in the jpg image x 3
        //if (heap_caps_get_free_size( MALLOC_CAP_SPIRAM) <  ARRAY_LENGTH) tReply+=" -Error not enough free psram to store rgb data- ";      // check free memory in psram
        ptrVal = heap_caps_malloc(ARRAY_LENGTH, MALLOC_CAP_SPIRAM);  
        uint8_t *rgb = (uint8_t *)ptrVal;

        //uint32_t arrsize = *ptrVal;

        // convert jpg to rgb (store in an array 'rgb')
        bool jpeg_converted = fmt2rgb888(pic->buf, pic->len, PIXFORMAT_JPEG, rgb);    
        if (!jpeg_converted)
        {
            ESP_LOGE(TAG, "-Error converting image to RGB-");
        }
        
        // Filter the desire pixels
        for (uint32_t i = 0; i < ARRAY_LENGTH/10; i++) {
            if (i%3 == 2) // Red Pixels
            {
                if (((rgb[i]<cmin[0])||(rgb[i]>cmax[0]))||((rgb[i]<vomin[0])||(rgb[i]>vcmax[0]))||((rgb[i]<amin[0])||(rgb[i]>amax[0]))) 
                {
                rgb[i] = 0x0;
                rgb[i+1] = 0x0;
                rgb[i+2] = 0x0;
                }
            }
            else if (i%3 == 1) // Green Pixels
            {
                if (((rgb[i]<cmin[1])||(rgb[i]>cmax[1]))||((rgb[i]<vomin[1])||(rgb[i]>vcmax[1]))||((rgb[i]<amin[1])||(rgb[i]>amax[1])))
                {
                rgb[i] = 0x0;
                rgb[i-1] = 0x0;
                rgb[i+1] = 0x0;
                }
            }
            else if (i%3 == 0) // Blue Pixels
            {
                if (((rgb[i]<cmin[2])||(rgb[i]>cmax[2]))||((rgb[i]<vcmin[2])||(rgb[i]>vcmax[2]))||((rgb[i]<amin[2])||(rgb[i]>amax[2])))
                {
                rgb[i] = 0x0;
                rgb[i-1] = 0x0;
                rgb[i-2] = 0x0;
                }
            }
             ESP_LOGI(TAG, "Data: %x", rgb[i]);
        }

        ESP_LOGI(TAG, "MITAAAAAAD");
        vTaskDelay(1000 / portTICK_RATE_MS);

        for (uint32_t i = ARRAY_LENGTH/10; i < 2*ARRAY_LENGTH/10; i++) {
            if (i%3 == 2) // Red Pixels
            {
                if (((rgb[i]<cmin[1])||(rgb[i]>cmax[1]))||((rgb[i]<vomin[1])||(rgb[i]>vcmax[1]))||((rgb[i]<amin[1])||(rgb[i]>amax[1]))) 
                {
                rgb[i] = 0x0;
                rgb[i+1] = 0x0;
                rgb[i+2] = 0x0;
                }
            }
            else if (i%3 == 1) // Green Pixels
            {
                if (((rgb[i]<cmin[2])||(rgb[i]>cmax[2]))||((rgb[i]<vomin[2])||(rgb[i]>vcmax[2]))||((rgb[i]<amin[2])||(rgb[i]>amax[2])))
                {
                rgb[i] = 0x0;
                rgb[i-1] = 0x0;
                rgb[i+1] = 0x0;
                }
            }
            else if (i%3 == 0) // Blue Pixels
            {
                if (((rgb[i]<cmin[3])||(rgb[i]>cmax[3]))||((rgb[i]<vcmin[3])||(rgb[i]>vcmax[3]))||((rgb[i]<amin[3])||(rgb[i]>amax[3])))
                {
                rgb[i] = 0x0;
                rgb[i-1] = 0x0;
                rgb[i-2] = 0x0;
                }
            }
             ESP_LOGI(TAG, "Data: %x", rgb[i]);
        }

    

        ESP_LOGI(TAG, "Finish");
       
        // Print Values
        // for (uint32_t i = 0x0; i < resultsToShow; i++) {
        //     // // x and y coordinate of the pixel
        //     //   uint16_t x = i % fb->width;
        //     //   uint16_t y = floor(i / fb->width);
        //     // if (i%3 == 0) tReply+="B";
        //     // else if (i%3 == 1) tReply+="G";
        //     // else if (i%3 == 2) tReply+="R";
        //     // tReply+= String(rgb[i]) + ",";
        //      ESP_LOGI(TAG, "Data: %x", rgb[i]);
        // }
        // ESP_LOGI(TAG, "Data: %x", rgb[10000000]);
        // ESP_LOGI(TAG, "Data: %x", rgb[100000000]);
        // ESP_LOGI(TAG, "Data: %x", rgb[1000000000]);
        // ESP_LOGI(TAG, "Longitud: %p", ptrVal);
        // ESP_LOGI(TAG, "%" PRIu32 "\n", *ptrVal);
        // ESP_LOGI(TAG, "%" PRIu32 "\n", arrsize);
        // ESP_LOGI(TAG, "%" PRIu32 "\n", ARRAY_LENGTH);
        //uint8_t arr [ptrVal] = *rgb;
    

        fclose(file);
        esp_camera_fb_return(pic);

        vTaskDelay(10000 / portTICK_RATE_MS);
    }
}


void app_main(void){
    xTaskCreate(task1,"task1",1024*16,NULL,5,NULL);
}