/*
BH1750

Connection:
 VCC-3.3V
 GND-GND
 SCL-SCL(analog pin 5)
 SDA-SDA(analog pin 4)
 ADD-NC or GND

Motion sensor PIR connected to DIGITAL PIN 3
Relay connected to PIN 5

*/


// Enable debug prints to serial monitor
#define MY_DEBUG 

#define MY_RADIO_RF24
#define MY_RF24_PA_LEVEL RF24_PA_HIGH

#define MY_REPEATER_FEATURE

// Set blinking period
#define MY_DEFAULT_LED_BLINK_PERIOD 300

// Flash leds on rx/tx/err
#define MY_DEFAULT_ERR_LED_PIN 4  // Error led pin
#define MY_DEFAULT_RX_LED_PIN  6  // Receive led pin
#define MY_DEFAULT_TX_LED_PIN  7  // Tx led pin





#define MY_NODE_ID 222
//#define MY_PARENT_NODE_ID 0
//#define MY_PARENT_NODE_IS_STATIC


#include <MySensors.h>
#include <Wire.h>
#include <BH1750.h>
#include <SPI.h>

#define MOTIONSENSOR_PIN 3     // Motion sensor
#define PIN_S_LIGHT_IN 5       // Relay
#define MAX_ATTACHED 16        // Max attached sensors
#define LONG_WAIT 750          // long wait between signals
#define ALIVEDELAY 240000      // Amount of miliseconds to send sendHeartbeat(true) to gateway;

// non-blocking loop timers
unsigned long light_time = 90000;            // How long the ights have to be on, when PIR was activated (ms)
unsigned long lastLightTime = 0;
unsigned long lastLightMeasurementTime = -60000; // used for light level reporting

bool lastState[MAX_ATTACHED];
bool tripped = 0;
bool isLightOn = 0;

BH1750 lightMeter;
int lastLightLevel = 0;
int minimumLightLevel = 6; // minimum light level (lx) when relay shall be on

unsigned long scheduledIMAlive = 0; // Scheduler for sending heartbeat

#define MOTION_CHILD_ID 1
#define LIGHT_CHILD_ID 2
#define RELAY_CHILD_ID 3

MyMessage msg_S_MOTION_T(MOTION_CHILD_ID,V_TRIPPED);  // pir motion sensors
MyMessage msg_S_RELAY(RELAY_CHILD_ID,V_STATUS);  // light relay switch
MyMessage lightMsg(LIGHT_CHILD_ID, V_LEVEL);  // light level sensor


void setup()  
{ 
  pinMode(MOTIONSENSOR_PIN, INPUT);      // sets the motion sensor digital pin as input
  pinMode(PIN_S_LIGHT_IN, OUTPUT);
  lights_off();

  lightMeter.begin();

  #if defined(MY_DEBUG)
    Serial.println( "Testing relay" );
  #endif
  // Testing relay just to let to knew everything is allright
  for ( int i = 0; i < 3; i++ ) {
    lights_on();
    delay( 2000 );
    lights_off();
    delay( 2000 );
   }

}


void presentation() {

  // Send the sketch version information to the gateway and Controller
  sendSketchInfo("Czujnik ruchu-ganek duzy", "1.1");
//  wait(LONG_WAIT);
  present(MOTION_CHILD_ID, S_MOTION,"Czujnik ruchu");
//  wait(LONG_WAIT);
  present(RELAY_CHILD_ID,S_BINARY,"Przekaznik");
//  wait(LONG_WAIT);
  present(LIGHT_CHILD_ID, S_LIGHT_LEVEL, "Czujnik swiatla");
//  wait(LONG_WAIT);
}

void loop()     
{     
    check_motion(MOTIONSENSOR_PIN, MOTION_CHILD_ID);
 //   check_motion(PIN_S_MOTION_BACK_GARAGE_2, ID_S_MOTION_BACK_GARAGE_2);
  if ( isLightOn == 1 && (millis() - lastLightTime) > light_time ) {
    lights_off();
  }
  
  if (millis() >= scheduledIMAlive) {
    IMAlive();
  }
}

void check_motion( uint8_t t_pin, uint8_t t_id ){
  int tripped = digitalRead(t_pin) == HIGH;

  uint16_t lightLevel = lightMeter.readLightLevel();
//  if (lightLevel > 5 && (lightLevel < lastLightLevel-5 || lightLevel >= lastLightLevel+5) && (millis() - lastLightMeasurementTime > 60000)) {
  if (millis() - lastLightMeasurementTime > 60000) {
        send(lightMsg.set(lightLevel), false);
        lastLightLevel = lightLevel;
        #if defined(MY_DEBUG)
          Serial.print("Light: ");
          Serial.print(lightLevel);
          Serial.println(" lx");
        #endif
        lastLightMeasurementTime = millis();
  }
  
  if (lastState[t_id] != tripped){
    send(msg_S_MOTION_T.setSensor(t_id).set(tripped));
    lastState[t_id] = tripped;
  }
  
  if (tripped && lightLevel <= minimumLightLevel){
    if (isLightOn == 0) {
        send(lightMsg.set(lightLevel), false);
    }
    lights_on();
  }
}

  
void lights_on(){
  if ( isLightOn == 0 ){
//    digitalWrite(PIN_S_LIGHT_IN, 0); // in case of relay module with inverted logic
      digitalWrite(PIN_S_LIGHT_IN, 1);
    send(msg_S_RELAY.setSensor(RELAY_CHILD_ID).set(1));
    isLightOn = 1;
  }
  lastLightTime = millis();
}

void lights_off(){
  if ( isLightOn == 1 ){
    isLightOn = 0;
//    digitalWrite(PIN_S_LIGHT_IN, 1); // in case of relay module with inverted logic
    digitalWrite(PIN_S_LIGHT_IN, 0);

    send(msg_S_RELAY.setSensor(RELAY_CHILD_ID).set(0));
  }
}

void receive(const MyMessage &message){
  switch (message.type) { 
    case V_STATUS:
      if(message.sensor==RELAY_CHILD_ID) {
        Serial.print("Message dla przekaznika: "); Serial.println(message.getBool());
        if ( message.getBool() == 1 ){
          digitalWrite(PIN_S_LIGHT_IN, 0);
          send(msg_S_RELAY.setSensor(RELAY_CHILD_ID).set(1));
        }
        else if ( message.getBool() == 0 ){ 
          isLightOn = 0;
          digitalWrite(PIN_S_LIGHT_IN, 1);
          send(msg_S_RELAY.setSensor(RELAY_CHILD_ID).set(0));
        }
        else {
          lights_off();
        }
      }
      break;
  }
}

void IMAlive() {
  #if defined(MY_DEBUG)
    Serial.println("I'm alive");
  #endif
  sendHeartbeat(true);
  scheduledIMAlive = millis() + ALIVEDELAY;
}
