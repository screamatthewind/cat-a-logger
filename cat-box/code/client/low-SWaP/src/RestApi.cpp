#include <Arduino.h>
#include <WiFi.h>
#include <HTTPClient.h>

#include "RestApi.h"
#include "WiFiUtils.h"
#include "Creds.h"

extern WiFiUtils wifiUtils;

String serverName = String(Creds::getServerName());

RestApi::RestApi() {

}

void RestApi::callHealthCheck()
{
    ReturnData returnData;

    if (!wifiUtils.isWiFiUp())
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

    if (!wifiUtils.isWiFiUp())
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