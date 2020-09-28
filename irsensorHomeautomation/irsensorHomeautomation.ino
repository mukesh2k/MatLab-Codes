
int dtect=8;
int sense=A0;
int buzzpin=9;
int sense1=A1;
void setup() {
  // put your setup code here, to run once:
     pinMode(sense1,INPUT);
      pinMode(sense,INPUT);
      pinMode(dtect,OUTPUT);
      Serial.begin(9600);
}
int c=0,c1=0,f=0,f1=0;
void loop() {
  // put your main code here, to run repeatedly:
    int val=analogRead(sense);
    int val1=analogRead(sense1);
   // Serial.println(val1);
   
   
    if(val>1000)
    {
      while(val>1000)
      {
        val=analogRead(sense);
        val1=analogRead(sense1);
        if(val<1000)break;
        while(val1>1000)
        {
           val=analogRead(sense);
        val1=analogRead(sense1);
          po1:
        if(val<1000)
        {
        
       
          while(val1>1000)
              { val=analogRead(sense);
              val1=analogRead(sense1);
              if(val>1000)goto po1;
              }
              f++;
          }}
        }
         val=analogRead(sense);
        val1=analogRead(sense1);
        
      }
     if(f==1)c++;
      if(val1>1000)
    {
      while(val1>1000)
      {
        val=analogRead(sense);
        val1=analogRead(sense1);
        if(val1<1000)break;
        while(val>1000)
        {
           val=analogRead(sense);
        val1=analogRead(sense1);
          po2:
        if(val1<1000)
        {
        
       
          while(val>1000)
              { val=analogRead(sense);
              val1=analogRead(sense1);
              if(val1>1000)goto po2;
              }
              f1++;
          }}
        }
         val=analogRead(sense);
        val1=analogRead(sense1);
        
      }
      if(f1==1)c--;
      int y;
      Serial.write(y);
      digitalWrite(8,HIGH);
      delay(y);
      digitalWrite(8,LOW);
  Serial.print(val);
    Serial.print(" ");
     Serial.print(val1);
     Serial.print(" ");
     Serial.println(c);
     f=0;
     f1=0;
    
}
