#ifndef _OTA_H_
#define _OTA_H_
class Ota
{
public:
    Ota();
    void start();
    bool isStarted();
    void keepAlive();
    void delay(unsigned int ms);
private:
    bool otaStarted;
};
#endif