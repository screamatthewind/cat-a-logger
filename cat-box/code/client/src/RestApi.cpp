#include <Arduino.h>
#include <WiFi.h>
#include <HTTPClient.h>

#include "main.h"
#include "creds.h"
#include "RestApi.h"

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

    if (WiFi.status() == WL_CONNECTED) {
        returnData.dataType = WIFI_STARTED;
        Serial.print(WiFi.localIP());
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

void RestApi::callPost()
{
    const char *serverName = "http://10.0.0.83:5000/api/catalogger";

    if (WiFi.status() == WL_CONNECTED)
    {
        HTTPClient http;

        http.begin(serverName);

        http.addHeader("Content-Type", "application/vnd.api+json");
        http.addHeader("Accept", "application/vnd.api+json");

        String httpRequestData = "{\"data\": {\"type\": \"catalogger\", \"attributes\": {\"voltage\": \"11.0\", \"eventType\": 1}}}";
        Serial.print(httpRequestData);

        int httpResponseCode = http.POST(httpRequestData);

        http.end();

        ReturnData returnData;

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