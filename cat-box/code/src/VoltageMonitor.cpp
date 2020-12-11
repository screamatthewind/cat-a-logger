#include <Arduino.h>

#include "main.h"
#include "VoltageMonitor.h"

const int voltageSensor = A0;
const int samples = 10;
const int settlingTime = 1000;
const float voltageDivisor = 116.5;
int adSum = 0;
float finalValue;

VoltageMonitor::VoltageMonitor()
{
  analogReadResolution(11);
  analogSetAttenuation(ADC_11db); // 3.3v
}

void VoltageMonitor::readVoltage()
{
  adSum = 0;

  // smooth out a/d jitter
  for (int i = 0; i < samples; i++)
  {
    delay(settlingTime);
    adSum += analogRead(voltageSensor);
  }

  finalValue = (adSum / samples) / voltageDivisor;
  int returnValue = (int) finalValue * 10;
  xQueueSend(mainQueue, &returnValue, 0);
};
