#ifndef REST_API_H
#define REST_API_H

class RestApi
{
public:
  RestApi();
  void startWifi();
  void stopWifi();
  void callPost(String);
  void callHealthCheck();
  bool isWiFiUp();
};
#endif