Create a creds.h file in the include directory as follows:

#ifndef CREDS_H
#define CREDS_H
const char *kSSID = "YOUR WIFI SSID";
const char *kPASSWORD = "YOUR WIFI PASSWORD";
const char *kSERVER = "<PROTOCOL>://<SERVER>:<PORT>";
#endif

Uses an RTOS to allow tasks to run in parallel making them run faster which minimizes the amount of time the unit is awake
OTA needs a full-time connection in which case Deep Sleep is disabled