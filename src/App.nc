#include <Timer.h>
#include "Node.h"

configuration App {

}

implementation {
  components NodeP;
  components MainC;
  components new TimerMilliC() as Timer0;
  components new TimerMilliC() as Timer1;
  components GPSP;
  components SensorsP;
  components SmokeDetectorP;
  components RandomC;

  components ActiveMessageC;
  components new AMSenderC(AM_FIRE_DETECTION);
  components new AMReceiverC(AM_FIRE_DETECTION);

  NodeP.Boot -> MainC;
  NodeP.Timer0 -> Timer0;
  NodeP.GPS -> GPSP;
  SensorsP.Random -> RandomC;
  NodeP.Sensors -> SensorsP;
  NodeP.SmokeDetector -> SmokeDetectorP;
  SmokeDetectorP.Random -> RandomC;
  SmokeDetectorP.Timer1 -> Timer1;
  GPSP.Random ->RandomC;

  NodeP.Packet -> AMSenderC;
  NodeP.AMSend -> AMSenderC;
  NodeP.AMControl -> ActiveMessageC;
  NodeP.Receive -> AMReceiverC;
}
