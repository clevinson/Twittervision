double homeLat = 42.277047;
double homeLon = -83.745326;
double accuracy = 0.5;

float angle = 90;
float range = 600;

double searchLat;
double searchLon;

int TVfacing = 90; //0 for NORTH, 90 for EAST, etc;

boolean isInRange(Status tweet, float angle, double r){
  if(tweet.geo() != null){
    searchLat = homeLat + r*cos(radians(angle));
    searchLon = homeLon + r*sin(radians(angle));
    double distance = sqrt( sq((float)( searchLat - tweet.geo().latitude() )) + sq((float)( searchLon - tweet.geo().longitude() )) );
    if(distance< accuracy*(1+.3*r)){
      return true;
    }else{
      return false;
    }
  }else{
    return false;
  }
}


float haversin(double lat1, double lon1, double lat2, double lon2){

  float r = 3959;    //earth's radius, in miles
  float dist_lat = radians((float)(lat2-lat1));
  float dist_lon = radians((float)(lon2 - lon1));
  float lat_1 = radians((float)lat1);
  float lat_2 = radians((float)lat2);
  
  float a = sin(dist_lat/2)*sin(dist_lat/2) + sin(dist_lon/2)*sin(dist_lon/2)*cos(lat_1)*cos(lat_2);
  float c = 2*atan2(sqrt(a), sqrt(1-a));
  
  float d = r * c;
  
  return d;
}


String getDir(double x){
  
  if(x>337.5 || x<22.5){
    return "N";
  }else if(x>=22.5 && x<67.5){
    return "NE";
  }else if(x>=67.5 && x<112.5){
    return "E";
  }else if(x>=112.5 && x<157.5){
    return "SE";
  }else if(x>=157.5 && x<202.5){
    return "S";
  }else if(x>=202.5 && x< 247.5){
    return "SW";
  }else if(x>=247.5 && x<292.5){
    return "W";
  }else{
    return "NW";
  }
  
}
