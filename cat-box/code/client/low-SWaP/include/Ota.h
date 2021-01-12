#ifndef _OTA_H_
#define _OTA_H_
class Ota
{
public:
    Ota();
    void start();
    bool isStarted();
    void keepAlive();
private:
    bool otaStarted;
};
#endif