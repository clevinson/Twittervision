void garble(int amount){
  
  loadPixels();
  for(int i=0; i<height; i++){
    int offset = (int)random(0,amount);
    for(int j=width-1; j<=offset; j--){
      pixels[width*i + j] = pixels[width*i + j - offset];
    }
    for(int j=0; j<offset; j++){
      pixels[width*i + j] = pixels[width*i];
    }

  }
  updatePixels();

}

void garble2(int amount){
  
  loadPixels();
  for(int i=0; i<height; i++){
    int offset = (int)random(0,amount);
    for(int j=offset; j<width; j++){
      pixels[width*i + j] = pixels[width*i + j - offset];
    }
    for(int j=0; j<offset; j++){
      pixels[width*i + j] = pixels[width*i];
    }

  }
  updatePixels();

}

void displayInfo(){
  
}

void dispThetaR(float theta, float r){
  //PFont d = createFont("Courier New", 40);
  //textFont(d);
  textFont(infoFont,32);
  fill(0,255,0);
  String theta_s = "" + (int)theta + "° "+getDir(theta);
  String r_s = "" + (int)r + "mi";
  text(theta_s, 20, 35);
  text(r_s, 180, 35);
  fill(0);
  textFont(tweetFont,40);
}

void dispLatLon(){

  String slat = "" + searchLat;
  String slon = "" + searchLon;
  
  slat = slat.substring(0, slat.indexOf('.')+2);
  slon = slon.substring(0, slon.indexOf('.')+2);
  
  
  String s = slat+","+slon+" ("+(int)(accuracy*(1+.3*range))+"mi acc.)";
  fill(0,255,0);
  textFont(infoFont,32);
  text(s, 300, 35);
  textFont(tweetFont,40);

}

void createBackgroundNoise(){

  loadPixels();
  for(int p=0; p<width*height-1; p++){
    pixels[p] = color(random(255));
  }
  updatePixels();
  fill (0, 100);
  rect(0, 0, 800, 600);
  fill (255);


}

