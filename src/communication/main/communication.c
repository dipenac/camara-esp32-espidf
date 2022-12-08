#include <stdlib.h>
#include <time.h>
#include <string.h>
#include <assert.h>
#include "freertos/FreeRTOS.h"
#include "freertos/semphr.h"
#include "freertos/timers.h"
#include "nvs_flash.h"
#include "esp_random.h"
#include "esp_event.h"
#include "esp_netif.h"
#include "esp_wifi.h"
#include "esp_log.h"
#include "esp_mac.h"
#include "esp_now.h"
#include "esp_crc.h"


#define CONFIG_ESPNOW_CHANNEL 1
#define ESPNOW_WIFI_IF  ESP_IF_WIFI_AP

// THE MAC Address of receiver 
uint8_t broadcastAddress[] = {0x58, 0xbf, 0x25, 0x18, 0x8, 0x1};
//uint8_t broadcastAddress[] = {0x94, 0xb9, 0x7e, 0xce, 0x1f, 0x2d};
//uint8_t broadcastAddress[] = {0x08, 0x3a, 0xf2, 0xbb, 0x1c, 0xd1};

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

static void espnow_send_cb(const uint8_t *mac_addr, esp_now_send_status_t status){
    printf(status == ESP_NOW_SEND_SUCCESS ? "Delivery Success\n" : "Delivery Fail\n");
}

static void espnow_recv_cb(const uint8_t *mac_addr, const uint8_t *data, int len){
    memcpy(&msg_recv, data, sizeof(msg_recv));
    printf("State received: %f",msg_recv.state);
    printf("Info received: %f",msg_recv.inf);
}

static void espnow_init(void){
    
    ESP_ERROR_CHECK( esp_now_init() );
    ESP_ERROR_CHECK( esp_now_register_send_cb(espnow_send_cb) );
    ESP_ERROR_CHECK( esp_now_register_recv_cb(espnow_recv_cb) );

#if CONFIG_ESP_WIFI_STA_DISCONNECTED_PM_ENABLE
    ESP_ERROR_CHECK( esp_now_set_wake_window(65535) );
#endif

    /* Set primary master key. */
    //ESP_ERROR_CHECK( esp_now_set_pmk((uint8_t *)CONFIG_ESPNOW_PMK) );
    
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

void app_main(void)
{   
    // Initialize NVS
    esp_err_t ret = nvs_flash_init();
    if (ret == ESP_ERR_NVS_NO_FREE_PAGES || ret == ESP_ERR_NVS_NEW_VERSION_FOUND) {
        ESP_ERROR_CHECK( nvs_flash_erase() );
        ret = nvs_flash_init();
    }
    ESP_ERROR_CHECK( ret );

    wifi_init();
    espnow_init();
    msg_send.inf = 20;
    msg_send.state = 20;
    while (true) {
    uint8_t derived_mac_addr[6] = {0};
    //Get MAC address for WiFi Station interface
    ESP_ERROR_CHECK(esp_read_mac(derived_mac_addr, ESP_MAC_WIFI_STA));
    ESP_LOGI("WIFI_STA MAC", "0x%x, 0x%x, 0x%x, 0x%x, 0x%x, 0x%x",
             derived_mac_addr[0], derived_mac_addr[1], derived_mac_addr[2],
             derived_mac_addr[3], derived_mac_addr[4], derived_mac_addr[5]);
    esp_err_t result = esp_now_send(broadcastAddress, (uint8_t *) &msg_send, sizeof(msg_send));
    if(result == ESP_OK){
        printf("Send success\n");
    }
    else {
        printf("Send failed\n");
    }
    vTaskDelay(500 / portTICK_PERIOD_MS);
    }
}
