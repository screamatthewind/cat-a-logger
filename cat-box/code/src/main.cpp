#include <Arduino.h>
#include <FreeRTOS.h>

#include "main.h"
#include "RestApi.h"
#include "VoltageMonitor.h"

#define SHOW_STACK_REMAINING 1

const int maxRunTime = 30; // seconds

QueueHandle_t mainQueue;
int queueSize = 20;

void startListener(void *parameter);
void startWifiTask(void *parameter);
void voltageMonitorTask(void *parameter);

void setup()
{
  Serial.begin(115200);
  Serial.println("Starting");

  mainQueue = xQueueCreate(queueSize, sizeof(ReturnData));

  if (mainQueue == NULL)
  {
    Serial.println("Error creating the queue");
  }

  xTaskCreate(startListener, "ListenerTask", 1024, NULL, 1, NULL);
  xTaskCreate(startWifiTask, "StartWifiTask", 4196, NULL, 1, NULL); 
  xTaskCreate(voltageMonitorTask, "VoltageMonitorTask", 1024, NULL, 1, NULL); 
}

void loop()
{
  delay(100000);
}

void startWifiTask(void *parameter)
{
  RestApi restApi;

  restApi.startWifi();
  restApi.callPost();
  restApi.stopWifi();

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

void startListener(void *parameter)
{
  ReturnData receivedData;

  for( int i=0; i<maxRunTime; i++ )
  {
    if (xQueueReceive( mainQueue, &receivedData, 0 ) == pdPASS)
    {
      Serial.print("received: ");

      if (receivedData.dataType == REST_POST_ERROR) {
        Serial.print("POST ERROR: ");
        Serial.println(receivedData.message);
      }
      else if (receivedData.dataType == VOLTAGE) {
        Serial.print("VOLTAGE: ");
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

  Serial.print("Powering Down");

  vTaskDelete(NULL);
}
