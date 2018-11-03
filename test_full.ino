#include <Wire.h>
#include "DS1307.h"
DS1307 clock;
#include "DHT.h"

#define DHTPIN 12
#define DHTTYPE DHT22
DHT dht(DHTPIN, DHTTYPE);

int t_hour,t_min;
float temp,humid;
int t_day, t_night;
int dht_err;
int a;
int night;
int heater;
int top_water, bottom_water;
int osmosis;
int led1_start, led1_stop, led2_start, led2_stop,led3_start, led3_stop,led1_status, led2_status, led3_status;
float t1 = .111111;
float t2 = .111111;
float h = .111111;
unsigned long fogger;
long fogger_on,fogger_off;
int f1_status, f2_status, f3_status;
void setup()
{
 Serial.begin(9600);
 Serial.println("Initialising....");
 clock.begin();
 delay(1000);
 dht.begin();
 delay(1000);
 dht_err=0; 
 pinMode(8, OUTPUT); //heater
 heater=0;
 pinMode (10, INPUT); //flotor top
 pinMode (9, INPUT); //flotor bottom
 pinMode (11, OUTPUT); //eletrovalva
 pinMode (2, OUTPUT); //LED 1
 pinMode (3, OUTPUT); //LED 2
 pinMode (4, OUTPUT); //LED 3
 pinMode (5, OUTPUT); //Fogger 1
 pinMode (6, OUTPUT); //Fogger 2
 pinMode (7, OUTPUT); //Fogger 3
 osmosis=0;
 led1_start=10;
 led1_stop=22;
 led2_start=10;
 led2_stop=22;
 led3_start=10;
 led3_stop=22;
 
 t_day=27;
 t_night=17;
 
 
 led1_status=0;
 led2_status=0;
 led3_status=0;
 night=1;
 fogger_on=30000;
 fogger_off=120000;
 
 digitalWrite(5, HIGH);
 digitalWrite(6, HIGH);
 digitalWrite(7, HIGH);
 f1_status=1;
 f2_status=1;
 f3_status=1;

 fogger=millis();
 
 Serial.println("Starting....");
}

void loop()
{
 clock.getTime();
 t_hour=clock.hour;
 t_min=clock.minute;
 
 for (a = 1; a < 11; a++) { 
  delay(1000);  
  humid = dht.readHumidity();
  temp = dht.readTemperature();
  if (isnan(temp) || isnan(humid) || temp<=0 || humid<=0) {     
   dht_err=dht_err+1;
  } else {
   dht_err=0;
   break;
  }
 }  
 
 if (digitalRead (10) == HIGH) {
   top_water=0;
 } else {
   top_water=1;
 }

 if (digitalRead (9) == HIGH) {
   bottom_water=0;
 } else {
   bottom_water=1;
 }
 
 if (top_water==0 && bottom_water==0 && osmosis==0) {
  digitalWrite(11, HIGH); //start osmosis
  osmosis=1;
 } 
 
 if ((top_water==1) || (bottom_water==1) && (osmosis==1)) {
  digitalWrite(11, LOW); //stop osmosis
  osmosis=0;
 }
 
 if (night==1) {
 if (temp <= t_night-1 && dht_err==0) {
   digitalWrite(8, HIGH);
   heater=1;
 }

 if (temp >= t_night+1 || dht_err > 100) {
   digitalWrite(8, LOW);
   heater=0;
 }
 }
 if (night==0) {
 if (temp <= t_day-1 && dht_err==0) {
   digitalWrite(8, HIGH);
   heater=1;
 }

 if (temp >= t_day+1 || dht_err > 100) {
   digitalWrite(8, LOW);
   heater=0;
 }
 }

 
 
 //t1 = (float)led1_start / 24.0;  
 //t2 = (float)led1_stop / 24.0;
 //h = (float)t_hour / 24.0;
  
 //if ((h>=t1) || (h<t2)) {
 //  if (led1_status==0) {
 //   digitalWrite(2, HIGH);
 //   night=0;
 //   led1_status=1;
 //   delay(500);
 //  }
 //} else {
 //  if (led1_status==1) {
 //    digitalWrite(2, LOW);
 //    night=1;
 //    led1_status=0;
 //    delay(500);
 //  }
// }


 t1 = (float)led2_start / 24.0;  
 t2 = (float)led2_stop / 24.0;
 h = (float)t_hour / 24.0;
  
 if ((h>=t1) && (h<t2)) {
   if (led2_status==0) {
    digitalWrite(3, HIGH);
    night=0;
    led2_status=1;
    delay(500);
   }
 } else {
   if (led2_status==1) {
     digitalWrite(3, LOW);
     night=1;
     led2_status=0;
     delay(500);
   }
 }


 //t1 = (float)led3_start / 24.0;  
 //t2 = (float)led3_stop / 24.0;
 //h = (float)t_hour / 24.0;
  
 //if ((h>=t1) || (h<t2)) {
 //  if (led3_status==0) {
 //   digitalWrite(4, HIGH);
 //   led3_status=1;
 //   delay(500);
 //  }
 //} else {
 //  if (led3_status==1) {
 //    digitalWrite(4, LOW);
 //    led3_status=0;
 //    delay(500);
 //  }
// }


 if (f1_status==1) {
  if (millis()-fogger>fogger_on) {
   digitalWrite(5, LOW);
   f1_status=0;
   delay(500);
   digitalWrite(6, LOW);
   f2_status=0;
   delay(500);
   digitalWrite(7, LOW);
   f3_status=0;
   delay(500);
   fogger=millis();
  } 
 }  

 if (f1_status==0) {
  if (millis()-fogger>fogger_off) {
   digitalWrite(5, HIGH);
   f1_status=1;
   delay(500);
   digitalWrite(6, HIGH);
   f2_status=1;
   delay(500);
   digitalWrite(7, HIGH);
   f3_status=1;
   delay(500);
   fogger=millis();
  } 
 }  

 Serial.print(t_hour);
 Serial.print(":");
 Serial.println(t_min);
 Serial.print ("T: ");
 Serial.print(temp);
 Serial.print(" H: ");
 Serial.print(humid);
 Serial.print(" Err count: ");
 Serial.println(dht_err);
 Serial.print("Heater: ");
 Serial.print(heater);
 Serial.print(" Night: ");
 Serial.println(night);
 Serial.print("Bottom: ");
 Serial.print(bottom_water);
 Serial.print(" Top: ");
 Serial.print(top_water);
 Serial.print(" Osmosis: ");
 Serial.println(osmosis);
 Serial.print("LED: ");
 Serial.print(led1_status);
 Serial.print(" ");
 Serial.print(led2_status);
 Serial.print(" ");
 Serial.print(led3_status);
 Serial.println(" ");
 Serial.print("Fogger: ");
 Serial.print(f1_status);
 Serial.print(" ");
 Serial.print(f2_status);
 Serial.print(" ");
 Serial.print(f3_status);
 Serial.println(" ");
 
 Serial.println();

 
 delay(3000); 
}
