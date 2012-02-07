import fullscreen.*; 
import java.net.URLEncoder;
import com.twitter.processing.*;
import processing.serial.*;
import cc.arduino.*;

float nyclat = 40.77;
float nyclon = -73.98;
float lalat = 33.93;
float lalon = -118.40;

Arduino arduino;
SoftFullScreen fs; 

ArrayList<Status> tweetList = new ArrayList<Status>();
List<String> cats = new ArrayList<String>();
MOBSystem mobsys;

int fontsize = 40;  
int speed = 1;

boolean[] openslots = new boolean[10];
PFont tweetFont;
PFont infoFont;

int masterClock = 0;



void setup() {
/*  
  arduino = new Arduino(this, Arduino.list()[0], 57600);
  arduino.pinMode(speedUpPin, Arduino.INPUT);
  arduino.pinMode(speedDownPin, Arduino.INPUT);
*/
  
  println("the distance between aa and la is "+haversin(homeLat, homeLon, lalat, lalon));
  
  println("pottodeg(256) is "+potToDeg(256));
 
  createTweetStream();

  size(800, 600);
  fs = new SoftFullScreen(this); 
  background(0);
  
  mobsys = new MOBSystem();
  mobsys.addMOBs();
  
  tweetFont = createFont("Courier New", fontsize);
  infoFont = createFont("Andale Mono", 40);
  textFont(tweetFont);
  mobsys.drawMOBs();
  //fs.enter();
}

void draw() {
// readArduino();
  
  createBackgroundNoise();
  garble2(2);

  for(int i=0; i<speed; i++){
    mobsys.tick();
  }
  mobsys.drawMOBs();
  smooth();

  dispThetaR(angle, range);
  dispLatLon();
    
  masterClock+=1;

 // println("tweetlist.size() is "+tweetList.size());
}



int toslot(int y){
  return (y/60);
}

int numslots(){
  int s = 0;
  for(int i=0; i<10; i++){
    if(openslots[i]){
      s+=1;
    }
  }
  return s;
}

void keyPressed(){
  if(keyCode==UP){
    range += 1;
  }
  if(keyCode==DOWN){
    range -= 1;
    if(range<0){
      range = 0;
    }
  }
  if(key == 'r'){
    mobsys.addMOBs();
  }
  if(keyCode==RIGHT){
    angle+=1;
    angle = angle%360;
  }
  if(keyCode == LEFT){
    angle -= 1;
    angle = (angle+360)%360;
  }
  if(key == 'a'){
    speed += 1;
    println("the speed is "+speed);
  }
  if(key == 'z'){
    speed -= 1;
    if(speed<0){
      speed = 0;
    }
    println("the speed is "+speed);
  }
  
  
}




