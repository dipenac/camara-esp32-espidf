# Captura de imagen

La captura de imagen se realizara con las funciones prestadas por el driver de la camara implementado en el proyecto.  

```c
#include <esp_camera.h>
```

Teniendo en cuenta que se realizaron las configuraciones pertinentes para el funcionamiento de la camara con el esp32. De igual forma se almacenan los datos tomados de la captura de imagen en formato JPEG en una memoria micro SD para realizar la visualizacion de la imagen tomada.

```c
#include "driver/sdmmc_host.h"
#include "driver/sdmmc_defs.h"
#include "sdmmc_cmd.h"
#include "esp_vfs_fat.h"
```

Por lo que es necesario incluir las librerias para el manejo de una micro SD.

## Configuracion de la camara

El archivo de configuracion de el esp32 debe ser cambiado para permitir el funcionamiento normal con la camara OV2640. Por lo que es necesario realizar los siguientes pasos.

* **Cambiar frecuencia memoria FLASH**
       ![menu1](/docs/img/menu1.png)
       ![menu2](/docs/img/menu2.png)
       ![menu3](/docs/img/menu3.png)
       
* **Habilitar la PSRAM externa y cambiar frecuencia SPRAM**.
       ![menu4](/docs/img/menu4.png)
       ![menu5](/docs/img/menu5.png)
       ![menu6](/docs/img/menu6.png)
       ![menu7](/docs/img/menu7.png) 
       ![menu8](/docs/img/menu8.png)
       ![menu9](/docs/img/menu9.png)

Y en adicion a esto, dependiendo de los pines utilizados de la esp32 para el control y recepcion de los datos de la camara, se deben ajustar estos parametros.

```c
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
```

Valores que deben ser cambiados dependiendo del microcontrolador que se utilice. 

## Captura de datos

Una vez esten realizadas todos los ajustes de funcionalidad de la camara, la captura de datos se realiza por medio de la siguiente funcion.

```c
camera_fb_t *pic = esp_camera_fb_get();
```
La cual asigna a la variable ***pic*** diferentes atributos como los son el buffer de los datos, la longitud de los datos, etc.

```c
typedef struct {
    uint8_t * buf;              /*!< Pointer to the pixel data */
    size_t len;                 /*!< Length of the buffer in bytes */
    size_t width;               /*!< Width of the buffer in pixels */
    size_t height;              /*!< Height of the buffer in pixels */
    pixformat_t format;         /*!< Format of the pixel data */
    struct timeval timestamp;   /*!< Timestamp since boot of the first DMA buffer of the frame */
} camera_fb_t;
```

Y a partir de esta estructura se extrae la informacion necesaria para guardar la imagen en la memoria micro SD y realizar el procesamiento.

## Ajuste sensibilidad de la camara

A pesar de que la camara al ser configurada funcione correctamente y realice la captura de datos, es necesario verificar la imagen que se esta obteniendo. Y a partir de esto se realiza el cambio de los ajustes de sensibilidad y contraste de la camara para obtener la mejor imagen posible que sea adecuada para el posterior procesamiento.

```c
    sensor_t *s = esp_camera_sensor_get();
    s->set_brightness(s, 2);     // -2 to 2
    s->set_contrast(s, 0);       // -2 to 2
    s->set_saturation(s, 1);     // -2 to 2
    s->set_special_effect(s, 0); // 0 to 6 (0 - No Effect, 1 - Negative, 2 - Grayscale, 3 - Red Tint, 4 - Green Tint, 5 - Blue Tint, 6 - Sepia)
    s->set_whitebal(s, 1);       // 0 = disable , 1 = enable
    s->set_awb_gain(s, 1);       // 0 = disable , 1 = enable
    s->set_wb_mode(s, 0);        // 0 to 4 - if awb_gain enabled (0 - Auto, 1 - Sunny, 2 - Cloudy, 3 - Office, 4 - Home)
    s->set_exposure_ctrl(s, 1);  // 0 = disable , 1 = enable
    s->set_aec2(s, 1);           // 0 = disable , 1 = enable
    s->set_ae_level(s, 0);       // -2 to 2
    s->set_aec_value(s, 300);    // 0 to 1200
    s->set_gain_ctrl(s, 1);      // 0 = disable , 1 = enable
    s->set_agc_gain(s, 0);       // 0 to 30
    s->set_gainceiling(s, (gainceiling_t)4);  // 0 to 6
    s->set_bpc(s, 1);            // 0 = disable , 1 = enable
    s->set_wpc(s, 0);            // 0 = disable , 1 = enable
    s->set_raw_gma(s, 1);        // 0 = disable , 1 = enable
    s->set_lenc(s, 1);           // 0 = disable , 1 = enable
    s->set_hmirror(s, 1);        // 0 = disable , 1 = enable
    s->set_vflip(s, 1);          // 0 = disable , 1 = enable
    s->set_dcw(s, 1);            // 0 = disable , 1 = enable
    s->set_colorbar(s, 0);       // 0 = disable , 1 = enable
```

Lo que se realiza variando los parametros que vienen establecidos por defecto en la configuracion de la camara. En nuestro caso este es el set de ajustes que permite un funcionamiento optimo de la camara.



