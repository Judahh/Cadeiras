#include "IpModel.h"

IpModel::IpModel(void)
{
}

IpModel::IpModel(string _ip)
{
	ip = _ip;
}

IpModel::IpModel(string _ip, int _port)
{
	ip = _ip;
	port = _port;
}

IpModel::IpModel(string _ip, string _pass, int _port)
{
	ip = _ip;
	port = _port;
	pass = _pass;
}

IpModel::~IpModel(void)
{
}

void IpModel::setIp(string _ip)
{
	ip = _ip;
}

void IpModel::setPass(string _pass)
{
	pass = _pass;
}

void IpModel::setPort(int _port)
{
	port = _port;
}