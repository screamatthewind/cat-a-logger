#include <Arduino.h>
#include <WiFi.h>
#include <HTTPClient.h>

#include "main.h"
#include "creds.h"
#include "RestApi.h"

String serverName = "http://10.0.0.83:5000";

RestApi::RestApi(){};

void RestApi::startWifi()
{
    const char *ssid = kSSID;
    const char *password = kPASSWORD;

    WiFi.mode(WIFI_STA);
    WiFi.begin(ssid, password);

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

void RestApi::stopWifi()
{
    ReturnData returnData;
    returnData.dataType = WIFI_STOPPED;
    xQueueSend(mainQueue, &returnData, 0);
}

bool RestApi::isWiFiUp()
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

void RestApi::callHealthCheck()
{
    ReturnData returnData;

    if (!isWiFiUp())
    {
        returnData.dataType = HEALTH_CHECK_ERROR;
        returnData.message = "no wifi";
        xQueueSend(mainQueue, &returnData, 0);
    }

    if (WiFi.status() == WL_CONNECTED)
    {
        HTTPClient http;
        String serverPath = serverName + "/api/check";

        http.begin(serverPath);

        int httpResponseCode = http.GET();

        http.end();

        if (httpResponseCode == 200)
            returnData.dataType = HEALTH_CHECK_OK;
        else
            returnData.dataType = HEALTH_CHECK_ERROR;

        returnData.message = String(httpResponseCode);

        xQueueSend(mainQueue, &returnData, 0);
    }
    else
    {
        ReturnData returnData;
        returnData.dataType = HEALTH_CHECK_ERROR;
        xQueueSend(mainQueue, &returnData, 0);
    }
}

void RestApi::callPost(String httpRequestData)
{
    ReturnData returnData;

    if (!isWiFiUp())
    {
        returnData.dataType = REST_POST_ERROR;
        returnData.message = "no wifi";
        xQueueSend(mainQueue, &returnData, 0);
    }

    if (WiFi.status() == WL_CONNECTED)
    {
        HTTPClient http;
        String serverPath = serverName + "/api/catalogger";

        http.begin(serverPath);

        http.addHeader("Content-Type", "application/vnd.api+json");
        http.addHeader("Accept", "application/vnd.api+json");

        // String httpRequestData = "{\"data\": {\"type\": \"catalogger\", \"attributes\": {\"voltage\": \"11.0\", \"eventType\": 1}}}";
        // Serial.println(httpRequestData);

        int httpResponseCode = http.POST(httpRequestData);

        http.end();

        if (httpResponseCode == 201)
            returnData.dataType = REST_POST_OK;
        else
            returnData.dataType = REST_POST_ERROR;

        returnData.message = String(httpResponseCode);

        xQueueSend(mainQueue, &returnData, 0);
    }
    else
    {
        ReturnData returnData;
        returnData.dataType = REST_POST_ERROR;
        xQueueSend(mainQueue, &returnData, 0);
    }
};