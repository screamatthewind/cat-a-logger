#ifndef _REST_API_H
#define _REST_API_H

#include "main.h"

class RestApi
{
public:
  RestApi();
  void callPost(String);
  void callHealthCheck();
};
#endif