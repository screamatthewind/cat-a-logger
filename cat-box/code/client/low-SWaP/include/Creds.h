#ifndef _CREDS_H
#define _CREDS_H
class Creds {
    public:
        static char const *getSSID();
        static char const *getWifiPassword();
        static char const *getServerName();
};
#endif