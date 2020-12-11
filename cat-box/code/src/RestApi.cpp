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

    int i = 1;
    xQueueSend(mainQueue, &i, 0);
}

void RestApi::stopWifi()
{
    int i = 2;
    xQueueSend(mainQueue, &i, 0);
}

void RestApi::callPost()
{
    const char *serverName = "https://reqbin.com/echo/post/json";

    if (WiFi.status() == WL_CONNECTED)
    {
        HTTPClient http;

        http.begin(serverName);

        http.addHeader("Content-Type", "application/x-www-form-urlencoded");
        String httpRequestData = "api_key=tPmAT5Ab3j7F9&sensor=BME280&value1=24.25&value2=49.54&value3=1005.14";

        int httpResponseCode = http.POST(httpRequestData);

        // If you need an HTTP request with a content type: application/json, use the following:
        //http.addHeader("Content-Type", "application/json");
        //int httpResponseCode = http.POST("{\"api_key\":\"tPmAT5Ab3j7F9\",\"sensor\":\"BME280\",\"value1\":\"24.25\",\"value2\":\"49.54\",\"value3\":\"1005.14\"}");

        // If you need an HTTP request with a content type: text/plain
        //http.addHeader("Content-Type", "text/plain");
        //int httpResponseCode = http.POST("Hello, World!");

        http.end();

        xQueueSend(mainQueue, &httpResponseCode, 0);
    }
    else
    {
    }
};