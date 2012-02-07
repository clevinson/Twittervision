int speedUpPin = 4;
int speedDownPin = 7;
int rangePin = 3;
int antennaPin = 5;

int maxRange = 2400;

void readArduino(){
  adjustScrollSpeed();
  adjustRange();
  adjustDegrees();
}

void adjustScrollSpeed(){

  if(arduino.digitalRead(speedUpPin) == Arduino.HIGH){
    speed += 1;
  }
  if(arduino.digitalRead(speedDownPin) == Arduino.HIGH){
    speed -= 1;
    if(speed < 0){
      speed = 0;
    }
  }
  
}

void adjustRange(){

  double rangeReading = arduino.analogRead(rangePin);  
  range = (float)((rangeReading/1023)*maxRange);
  
}

void adjustDegrees(){
  
  int degreeReading = arduino.analogRead(antennaPin);
  angle = (float)(potToDeg(degreeReading));  
  
}

double potToDeg(int pot){
  return (((double)(pot)/1023)*360 + 180 + TVfacing)%360;
}
