#include <Arduino.h>
#include <ArduinoOTA.h>
#include <FreeRTOS.h>

#include "main.h"
#include "Creds.h"
#include "Ota.h"
#include "RestApi.h"
#include "VoltageMonitor.h"

#define SHOW_STACK_REMAINING 1

const int maxRunTime = 30; // seconds
const int motionSensor = 27;
const OperatingMode operatingMode = OTA; // cannot use LOW_SWAP and OTA at the same time

QueueHandle_t mainQueue;
const int queueSize = 20;

WiFiUtils wifiUtils;
RestApi restApi;
Ota ota;

void startListener(void *parameter);
void startWifiTask(void *parameter);
void voltageMonitorTask(void *parameter);
void healthCheckTask(void *parameter);
void deepSleepTask(void *parameter);
void motionDetectedTask(void *parameter);
void IRAM_ATTR motionDetected();

void setup()
{
  Serial.begin(115200);
  Serial.println("Starting");

  mainQueue = xQueueCreate(queueSize, sizeof(ReturnData));
  
  wifiUtils = WiFiUtils();
  restApi = RestApi();

  if (mainQueue == NULL)
  {
    Serial.println("Error creating the queue");
  }

  xTaskCreate(startListener, "ListenerTask", 3000, NULL, 1, NULL);
  xTaskCreate(startWifiTask, "StartWifiTask", 2048, NULL, 1, NULL); 
  xTaskCreate(voltageMonitorTask, "VoltageMonitorTask", 1024, NULL, 1, NULL); 
  xTaskCreate(healthCheckTask, "HealthCheckTask", 2048, NULL, 1, NULL); 

  if (operatingMode == LOW_SWAP)
    xTaskCreate(deepSleepTask, "DeepSleepTask", 1024, NULL, 1, NULL);

  // PIR Motion Sensor mode INPUT_PULLUP
  pinMode(motionSensor, INPUT_PULLUP);
  // Set motionSensor pin as interrupt, assign interrupt function and set RISING mode
  attachInterrupt(digitalPinToInterrupt(motionSensor), motionDetected, RISING);

}

void loop()
{
  if ((operatingMode == OTA) && (ota.isStarted())) {
    ota.keepAlive();
    delay(100);
  }
  else
    delay(100000);
}

// https://randomnerdtutorials.com/esp32-pir-motion-sensor-interrupts-timers/
void IRAM_ATTR motionDetected() {
  xTaskCreate(motionDetectedTask, "motionDetectedTask", 2400, NULL, 1, NULL); 
}

void motionDetectedTask(void *parameter)
{
  String httpRequestData = "{\"data\": {\"type\": \"catalogger\", \"attributes\": {\"eventType\": " + String(MOTION_DETECTED) + "}}}";
  restApi.callPost(httpRequestData);

  #ifdef SHOW_STACK_REMAINING
    UBaseType_t uxHighWaterMark;
    uxHighWaterMark = uxTaskGetStackHighWaterMark( NULL );
    Serial.print("motionDetectedTask-stack-2: ");
    Serial.println(uxHighWaterMark);
  #endif

  vTaskDelete(NULL);
}

void startWifiTask(void *parameter)
{
  wifiUtils.startWifi();

  #ifdef SHOW_STACK_REMAINING
    UBaseType_t uxHighWaterMark;
    uxHighWaterMark = uxTaskGetStackHighWaterMark( NULL );
    Serial.print("startWifiTask-stack-2: ");
    Serial.println(uxHighWaterMark);
  #endif

  vTaskDelete(NULL);
}

void voltageMonitorTask(void *parameter)
{
  VoltageMonitor voltageMonitor;
  voltageMonitor.readVoltage();

  #ifdef SHOW_STACK_REMAINING
    UBaseType_t uxHighWaterMark;
    uxHighWaterMark = uxTaskGetStackHighWaterMark( NULL );
    Serial.print("voltageMonitorTask-stack-1: ");
    Serial.println(uxHighWaterMark);
  #endif

  vTaskDelete(NULL);
}

void healthCheckTask(void *parameter)
{
  restApi.callHealthCheck();

  #ifdef SHOW_STACK_REMAINING
    UBaseType_t uxHighWaterMark;
    uxHighWaterMark = uxTaskGetStackHighWaterMark( NULL );
    Serial.print("healthCheckTask-stack-1: ");
    Serial.println(uxHighWaterMark);
  #endif

  vTaskDelete(NULL);
}

void deepSleepTask(void *parameter)
{
  #ifdef SHOW_STACK_REMAINING
    UBaseType_t uxHighWaterMark;
    uxHighWaterMark = uxTaskGetStackHighWaterMark( NULL );
    Serial.print("healthCheckTask-stack-1: ");
    Serial.println(uxHighWaterMark);
  #endif

  vTaskDelete(NULL);
}

void startListener(void *parameter)
{
  ReturnData receivedData;

  for( int i=0; i<maxRunTime; i++ )
  {
    if (xQueueReceive( mainQueue, &receivedData, 0 ) == pdPASS)
    {
      Serial.print("received: ");

      if (receivedData.dataType == WIFI_STARTED) {
        Serial.print("WiFi Started: ");
        Serial.println(receivedData.message);
        if (operatingMode == OTA)
        {
          ota = Ota();
          ota.start();
        }
      }
      else if (receivedData.dataType == REST_POST_ERROR) {
        Serial.print("POST ERROR: ");
        Serial.println(receivedData.message);
      }
      else if (receivedData.dataType == VOLTAGE) {
        Serial.print("VOLTAGE: ");
        Serial.println(receivedData.message);
      }
      else if (receivedData.dataType == HEALTH_CHECK_ERROR) {
        Serial.print("HEALTH_CHECK_ERROR: ");
        Serial.println(receivedData.message);
      }
      else
        Serial.println(DataTypeStrings[receivedData.dataType]);
    }

    delay(1000);
  }

  #ifdef SHOW_STACK_REMAINING
    UBaseType_t uxHighWaterMark;
    uxHighWaterMark = uxTaskGetStackHighWaterMark( NULL );
    Serial.print("startListener-stack-2: ");
    Serial.println(uxHighWaterMark);
  #endif

  String httpRequestData = "{\"data\": {\"type\": \"catalogger\", \"attributes\": {\"voltage\": \"11.0\", \"eventType\": " + String(STATUS_UPDATE) + "}}}";
  restApi.callPost(httpRequestData);
  delay(1000);

  wifiUtils.stopWifi();
  delay(1000);

  Serial.println("Powering Down");

  vTaskDelete(NULL);
}
