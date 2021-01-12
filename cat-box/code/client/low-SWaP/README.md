Create a Creds.cpp file in the src directory as follows:

#include "Creds.h"

const char* Creds::getSSID() {
    return "<YOUR SSID>";
}

const char* Creds::getWifiPassword() {
    return "<YOUR WIFI PASSWORD>";
}

// ie http://10.0.0.98:5000
const char* Creds::getServerName() {
    return "<PROTOCOL>://<SERVER>:<PORT>";
} 

1) Uses an RTOS to allow tasks to run in parallel making them run faster which minimizes the amount of time the unit is awake
2) OTA needs a full-time connection in which case Deep Sleep is disabled