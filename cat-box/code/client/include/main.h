#ifndef MAIN_H
#define MAIN_H

#include <FreeRTOS.h>

extern QueueHandle_t mainQueue;

enum DataType {WIFI_STARTED, WIFI_STOPPED, WIFI_ERROR, REST_POST_OK, REST_POST_ERROR, VOLTAGE};
static const char *DataTypeStrings[] = { "WIFI_STARTED", "WIFI_STOPPED", "WIFI_ERROR", "REST_POST_OK", "REST_POST_ERROR", "VOLTAGE" };

class ReturnData
{
public:
    DataType dataType;
    String message;
};

#endif