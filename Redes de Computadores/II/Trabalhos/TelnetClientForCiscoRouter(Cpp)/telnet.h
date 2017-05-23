#ifndef TELNET_H

#define TELNET_H

namespace TELNET
{

class Telnet
{
public:
  virtual bool          isServer(void) = 0; // returns true if we are a server or a client.  First one created on a machine is a server, additional copies are clients.
  virtual bool          haveConnection(void) = 0; // returns true if we (as a client) successfully connected to the server.
  virtual bool          sendMessage(unsigned int client,const char *fmt,...) = 0; // send a message to the server, all clients (client=0) or just a specific client.
  virtual const char *  receiveMessage(unsigned int &client) = 0; // receive an incoming message (client=0) means it came from the server, otherwise it designates a specific client.
  virtual const char ** getArgs(const char *input,int &argc) = 0; // parse string into a series of arguments.
protected:
  virtual ~Telnet(void) { };
};

Telnet * createTelnet(const char *address="LOCALHOST",unsigned int port=23);
void     releaseTelnet(Telnet *t);

};

extern TELNET::Telnet *gTelnet; // optional global variable representing the TELNET singleton for the application.

#endif