#include <Arduino.h>
#include <FreeRTOS.h>

#include "main.h"
#include "RestApi.h"
#include "VoltageMonitor.h"

QueueHandle_t mainQueue;
int queueSize = 20;

void startListener(void *parameter);
void startWifiTask(void *parameter);
void voltageMonitorTask(void *parameter);

TaskHandle_t hStartWifiTask;
TaskHandle_t hVoltageMonitorTask;

void setup()
{
  Serial.begin(115200);
  Serial.println("Starting");

  mainQueue = xQueueCreate(queueSize, sizeof(int));

  if (mainQueue == NULL)
  {
    Serial.println("Error creating the queue");
  }

  xTaskCreate(startListener, "ListenerTask", 1024, NULL, 1, NULL);
  xTaskCreate(startWifiTask, "StartWifiTask", 4196, NULL, 1, &hStartWifiTask); 
  xTaskCreate(voltageMonitorTask, "VoltageMonitorTask", 1024, NULL, 1, &hVoltageMonitorTask); 
}

void loop()
{
  delay(100000);
}

void startWifiTask(void *parameter)
{
  UBaseType_t uxHighWaterMark;
  uxHighWaterMark = uxTaskGetStackHighWaterMark( hStartWifiTask );
  Serial.print("startWifiTask-stack-1: ");
  Serial.println(uxHighWaterMark);

  RestApi restApi;

  restApi.startWifi();
  restApi.callPost();
  restApi.stopWifi();

  uxHighWaterMark = uxTaskGetStackHighWaterMark( hStartWifiTask );
  Serial.print("startWifiTask-stack-2: ");
  Serial.println(uxHighWaterMark);

  vTaskDelete(NULL);
}

void voltageMonitorTask(void *parameter)
{
  UBaseType_t uxHighWaterMark;
  uxHighWaterMark = uxTaskGetStackHighWaterMark( hVoltageMonitorTask );
  Serial.print("voltageMonitorTask-stack-1: ");
  Serial.println(uxHighWaterMark);

  VoltageMonitor voltageMonitor;
  voltageMonitor.readVoltage();

  uxHighWaterMark = uxTaskGetStackHighWaterMark( hVoltageMonitorTask );
  Serial.print("voltageMonitorTask-stack-1: ");
  Serial.println(uxHighWaterMark);

  vTaskDelete(NULL);
}

void startListener(void *parameter)
{
  UBaseType_t uxHighWaterMark;
  uxHighWaterMark = uxTaskGetStackHighWaterMark( NULL );
  Serial.print("startListener-stack-1: ");
  Serial.println(uxHighWaterMark);

  int receivedValue;

  for( int i=0; i<30; i++ )
  {
    if (xQueueReceive( mainQueue, &receivedValue, 0 ) == pdPASS)
    {
      Serial.print("received: ");
      Serial.println(receivedValue);
    }

    delay(1000);
  }

  uxHighWaterMark = uxTaskGetStackHighWaterMark( NULL );
  Serial.print("startListener-stack-2: ");
  Serial.println(uxHighWaterMark);

  vTaskDelete(NULL);
}
