# Comunicaciones

Las comunicaciones entre los dispositivos se manejaran con la herramienta prestada por espressif ESP-NOW, basada en el protocolo Wifi. Para mas informacion remitirse a el sitio oficial del fabricante [esp-now](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/network/esp_now.html#).

## Funcionamiento 

ESP-NOW es un tipo de protocolo de comunicacion definido por espressif que es ampliamente utilizado en domotica y control remoto. Su funcionamiento se basa en la comunicacion entre dos o mas dispositivos utilizando su direccion MAC (propia de cada dispositivo) para la transmision de informacion.

- [X] Para utilizar la herramienta de comunicaciones esp-now implementada en este proyecto es necesario cambiar el valor de la variable **broadcastAddress** por la direccion MAC del dispositivo receptor.
  
  ```c
  // THE MAC Address of receiver 
  uint8_t broadcastAddress[] = {0x0c, 0xb8, 0x15, 0xd2, 0x9f, 0x9d};
  ```
- [X] Para el envio de datos se utiliza la siguiente funcion, en donde se utiliza una estructura para componer los datos del mensaje a enviar (ver la estructura del mensaje).

  ```c
  esp_now_send(broadcastAddress, (uint8_t *) &msg_send, sizeof(msg_send));
  ```

## Implementacion

La implementacion realizada en el proyecto se basa en la informacion obtenida del repositorio oficial de espressif [esp-now](https://docs.espressif.com/projects/esp-idf/en/latest/esp32/api-reference/network/esp_now.html#) y el ejemplo ubicado en el repositorio de la herramienta de [esp-idf-examples-espnow](https://github.com/espressif/esp-idf/tree/master/examples/wifi/espnow). 

- [X] Es necesario definir la direccion MAC del receptor.
  ```c
  // THE MAC Address of receiver 
  uint8_t broadcastAddress[] = {0x0c, 0xb8, 0x15, 0xd2, 0x9f, 0x9d};
  ```
- [X]   En este caso se define una estructura para el mensaje que se envia, tanto como para el que se recibe.
    ```c
    // Structure example to send data
    // Must match the receiver structure
    typedef struct struct_message {
        float state;
        float inf;
    } struct_message;

    // structure for messages to be sent
    struct_message msg_send;
    // structure to hold incoming readings
    struct_message msg_recv;
     ```

- [X] Se debe inicializar el periferico de WiFi del esp32 antes de utilizar esp-now.
  ```c
    // WiFi should start before using ESPNOW
    static void wifi_init(void)
    {
        ESP_ERROR_CHECK(esp_netif_init());
        ESP_ERROR_CHECK(esp_event_loop_create_default());
        wifi_init_config_t cfg = WIFI_INIT_CONFIG_DEFAULT();
        ESP_ERROR_CHECK( esp_wifi_init(&cfg) );
        ESP_ERROR_CHECK( esp_wifi_set_storage(WIFI_STORAGE_RAM) );
        ESP_ERROR_CHECK( esp_wifi_set_mode(WIFI_MODE_AP) );
        ESP_ERROR_CHECK( esp_wifi_start());
        ESP_ERROR_CHECK( esp_wifi_set_channel(CONFIG_ESPNOW_CHANNEL, WIFI_SECOND_CHAN_NONE));

    #if CONFIG_ESPNOW_ENABLE_LONG_RANGE
        ESP_ERROR_CHECK( esp_wifi_set_protocol(ESPNOW_WIFI_IF, WIFI_PROTOCOL_11B|WIFI_PROTOCOL_11G|WIFI_PROTOCOL_11N|WIFI_PROTOCOL_LR) );
    #endif
    }
  ```
- [X] Luego se procede a inicializar el servicio de esp-now en donde se especifican las funciones a ejecutar para cuantos los registros de recepcion y transmision se vean consumidos.

    ```c
    static void espnow_init(void){
        
        ESP_ERROR_CHECK( esp_now_init() );
        ESP_ERROR_CHECK( esp_now_register_send_cb(espnow_send_cb) );
        ESP_ERROR_CHECK( esp_now_register_recv_cb(espnow_recv_cb) );

    #if CONFIG_ESP_WIFI_STA_DISCONNECTED_PM_ENABLE
        ESP_ERROR_CHECK( esp_now_set_wake_window(65535) );
    #endif
        
        /* Add broadcast peer information to peer list. */
        esp_now_peer_info_t *peer = malloc(sizeof(esp_now_peer_info_t));
        memset(peer, 0, sizeof(esp_now_peer_info_t));
        peer->channel = CONFIG_ESPNOW_CHANNEL;
        peer->ifidx = ESPNOW_WIFI_IF;
        peer->encrypt = false;
        memcpy(peer->peer_addr, broadcastAddress, ESP_NOW_ETH_ALEN);
        ESP_ERROR_CHECK( esp_now_add_peer(peer) );
        free(peer);

    }
    ```

 