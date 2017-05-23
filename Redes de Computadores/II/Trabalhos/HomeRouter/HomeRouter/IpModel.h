#include <stdio.h>
#include <stdlib.h>
#include <string>

using namespace std;

#pragma once
class IpModel
{
public:
	IpModel(void);
	IpModel(string _ip);
	IpModel(string _ip, int _port);
	IpModel(string _ip, string _senha, int _port);
	~IpModel(void);

	void setIp(string _ip);
	void setPass(string _pass);
	void setPort(int _port);
private:
	string ip;
	string pass;
	int port;
};

