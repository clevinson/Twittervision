public class MOB {

  public int x, y;
  public int wid, hei;
  Status t;
  PImage img;
  boolean isTweet;
  String s;

  public MOB() {
    x=0;
    y=0;
    isTweet = false;
    println("default constructor used. oops?");
  }
  public MOB(Status intweet) {
    x = 800;
    int slot = (int)random(10);
    while(openslots[slot] == false){
      slot = (int)random(10);
    }
    y = slot*60 + 50;
    openslots[slot] = false;
    t = intweet;
    isTweet = true;
    s = "@"+t.user().screenName() + ": "+t.text();
    wid = (int)textWidth(s);
    println("the length of the tweet "+s+" is "+textWidth(s));
    hei = fontsize;
  }
  public MOB(PImage p) {
    x = (int)random(800);
    y = (int)random(600);
    isTweet = false;
    img = p;
    
  }
}

public class MOBSystem {
  
  int clock = 0;
  public ArrayList<MOB> mobs;
  
  public MOBSystem() {
    mobs = new ArrayList<MOB>();
    for(int i =0; i<10; i++){
      openslots[i] = true;
    }
    openslots[0] = false;
  }
  
  public void addMOB(Status t) {
    if(numslots() > 5){
      MOB tmob = new MOB(t);
      mobs.add(tmob);
    }
  }
  
  public void addMOB(PImage p) {
    MOB tmob = new MOB(p);
    mobs.add(tmob);
  }
  
  public void tick() {
    clock += 1;
    if(clock%60 == 0 && tweetList.size() != 0){
      this.addMOB(tweetList.get((int)random(tweetList.size())));
      println("TOCK");
    }
    for (int i=0; i<mobs.size(); i++) {
      mobs.get(i).x -= 1;
      if(mobs.get(i).x + mobs.get(i).s.length()*24 < 0){
        mobs.remove(i);
        mobs.trimToSize();
        println("deleted a tweet!");
      }
      if(mobs.get(i).x + mobs.get(i).s.length()*25 == 700){
        openslots[toslot(mobs.get(i).y)] = true;
      }
    }
  }
  
  public void drawMOBs(){
    for (MOB m: mobs){
      if(m.isTweet){
          text(m.s, m.x, m.y);
      }
    }
  }
  
  void addMOBs(){
    for(int i=0; i<tweetList.size(); i++){
      addMOB(tweetList.get(i));
    }
  }
}
