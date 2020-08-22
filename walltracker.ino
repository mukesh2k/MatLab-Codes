#include <L298N.h>
#define TP1 12
#define EP1 13
#define EP2 3
#define TP2 2
L298N R(8,9);
L298N L(10,11);
 
void setup() {
  pinMode(TP1, OUTPUT);
  pinMode(EP1, INPUT);
  pinMode(TP2, OUTPUT);
  pinMode(EP2, INPUT);
}
 
void loop() {
 
  long du1, d1,du2,d2;
  digitalWrite(TP1, LOW);  
  delayMicroseconds(2); 
  digitalWrite(TP1, HIGH);
 
  delayMicroseconds(10);
  digitalWrite(TP1, LOW);
  du1 = pulseIn(EP1, HIGH);
  d1 = (du1/2) / 29.1;
  
  digitalWrite(TP2, LOW);  
  delayMicroseconds(2); 
  digitalWrite(TP2, HIGH);
 
  delayMicroseconds(10);
  digitalWrite(TP2, LOW);
  du2 = pulseIn(EP2, HIGH);
  d2 = (du2/2) / 29.1;
  
  if (d1 < 20&&d2<20) {

    
 L.run(1);
  R.run(1);
  delay(2000);     
  L.run(0); 
  R.run(1);
  delay(3350); //CHANGE THIS ACCORDING TO HOW THE ROBOT TURNS.  
  
  }
  else if(d1>20&&d2<20)
  {
    L.run(0);
    R.run(0);
    }
  else if(d1>20&&d2>20) {
    R.run(0);
    L.run(0);
    delay(1000);
    R.run(0);
    L.run(1);
    delay(3350);
    R.run(0);
    L.run(0);
    delay(2000);
}
  else{}
  
}   
