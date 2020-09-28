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
  Serial.begin(9600);
}
 
void loop() {
 
  long du1, d1,du2,d2;
  int f=0;
  digitalWrite(TP1, LOW);  
  delayMicroseconds(2); 
  digitalWrite(TP1, HIGH);
 
  delayMicroseconds(10);
  digitalWrite(TP1, LOW);
  d1 = pulseIn(EP1, HIGH);
  du1 = ((du1/2) / 29.1);
  
  digitalWrite(TP2, LOW);  
  delayMicroseconds(2); 
  digitalWrite(TP2, HIGH);
 
  delayMicroseconds(10);
  digitalWrite(TP2, LOW);
  d2 = pulseIn(EP2, HIGH);
  du2 = ((du2/2) / 29.1);
  Serial.print(d1);
    Serial.print(" ");
      Serial.println(d2);
 
 if(d1>1000&&d2<1000)
  {
    L.run(0);
    R.run(0);
    delay(300);
    }
 
  
   /* else if(d1>2000||d2>2000)
  {
    L.run(1);
    R.run(1);
    delay(1000);
    }*/
  else if(d1>1000&&d2>1000) {
  if(f==0)
  { R.run(0);
    L.run(0);
    delay(100);
    f=f+1;
    }
    R.run(0);
    L.run(1);
    delay(1500);
    f=f-1;
    //delay(2000);
}
  else if(d1<500&&d2>500) 
  {
    L.run(0);
    R.run(1);
    delay(1000);
    }
  
     else
  if (d1 < 1000&&d2<1000||(d1>4000)) {

    
  L.run(0);
  R.run(1);
  delay(4000);
  L.run(0);
  R.run(0);
  delay(1000);
  //CHANGE THIS ACCORDING TO HOW THE ROBOT TURNS.  
  
  }
  
}   
