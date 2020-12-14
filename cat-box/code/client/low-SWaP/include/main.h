#ifndef MAIN_H
#define MAIN_H

#include <FreeRTOS.h>

extern QueueHandle_t mainQueue;

enum DataType {WIFI_STARTED, WIFI_STOPPED, WIFI_ERROR, REST_POST_OK, REST_POST_ERROR, VOLTAGE, HEALTH_CHECK_ERROR, HEALTH_CHECK_OK};
static const char *DataTypeStrings[] = { "WIFI_STARTED", "WIFI_STOPPED", "WIFI_ERROR", "REST_POST_OK", "REST_POST_ERROR", "VOLTAGE", "HEALTH_CHECK_ERROR", "HEALTH_CHECK_OK" };

class ReturnData
{
public:
    DataType dataType;
    String message;
};

#endif