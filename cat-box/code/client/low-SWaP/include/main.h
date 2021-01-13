#ifndef _MAIN_H
#define _MAIN_H

#include <FreeRTOS.h>
#include "WiFiUtils.h"

extern QueueHandle_t mainQueue;

enum DataType {MOTION_DETECTED, STATUS_UPDATE, WIFI_STARTED, WIFI_STOPPED, WIFI_ERROR, REST_POST_OK, REST_POST_ERROR, VOLTAGE, HEALTH_CHECK_ERROR, HEALTH_CHECK_OK};
static const char *DataTypeStrings[] = { "MOTION_DETECTED", "STATUS_UPDATE", "WIFI_STARTED", "WIFI_STOPPED", "WIFI_ERROR", "REST_POST_OK", "REST_POST_ERROR", "VOLTAGE", "HEALTH_CHECK_ERROR", "HEALTH_CHECK_OK"};

class ReturnData
{
public:
    DataType dataType;
    String message;
    IPAddress ipAddress;
    long rssi;
};

#endif