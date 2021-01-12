#include <Arduino.h>
#include <WiFi.h>

#include "wiFiUtils.h"
#include "Creds.h"

WiFiUtils::WiFiUtils(){};

void WiFiUtils::startWifi()
{
    WiFi.mode(WIFI_STA);
    WiFi.begin(Creds::getSSID(), Creds::getWifiPassword());

    while (WiFi.status() != WL_CONNECTED)
    {
        delay(500);
    }

    ReturnData returnData;

    if (WiFi.status() == WL_CONNECTED)
    {
        returnData.dataType = WIFI_STARTED;
        Serial.println(WiFi.localIP());
    }
    else
        returnData.dataType = WIFI_ERROR;

    xQueueSend(mainQueue, &returnData, 0);
}

void WiFiUtils::stopWifi()
{
    ReturnData returnData;
    returnData.dataType = WIFI_STOPPED;
    xQueueSend(mainQueue, &returnData, 0);
}

bool WiFiUtils::isWiFiUp()
{
    int ctr = 0;
    bool result = false;
    while (WiFi.status() != WL_CONNECTED)
    {
        delay(1000);
        if (ctr++ > 30)
        {
            break;
        }
    }

    if (WiFi.status() == WL_CONNECTED)
        result = true;

    return result;
}

IPAddress WiFiUtils::getIp() {
    return WiFi.localIP();
}

