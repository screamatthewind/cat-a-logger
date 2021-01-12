#ifndef _WIFI_UTILS_H
#define _WIFI_UTILS_H

#include "main.h"

class WiFiUtils
{
public:
  WiFiUtils();
  void startWifi();
  void stopWifi();
  bool isWiFiUp();
};
#endif