import com.twitter.processing.*;

int tweets = 0;
String tweetText = "";

void createTweetStream(){
  String [] lines = loadStrings("credentials.txt");
  if (lines.length == 2) {
    String user = lines[0];
    String password = lines[1];
    // open a geo hose connection, monitoring THE WORLD
    // IMPORTANT: in all likelihood you wont be able to monitor a bounding box of this size
    TweetStream stream = new TweetStream(this, "https", "stream.twitter.com", 443, "1/statuses/filter.json?locations=-116.98,32.57,-68.05,86.68", user, password);
    stream.go();
  } else {
    println("couldn't load username/password from credentials.txt");
  }
}

// called by twitter stream whenever a new tweet comes in
void tweet(Status tweet) {
  // print a message to the console just for giggles if you like
  //println("got tweet " + tweet.id());
  if( isInRange(tweet, angle, range/60) ){
    addTweet(tweet);
    tweets += 1;
   // println(tweet.geo().longitude());
  }
}

void addTweet(Status s){
  if(tweetList.size() < 40){
    tweetList.add(s);
  }else{
    tweetList.remove(0);
    tweetList.trimToSize();
    addTweet(s);
  }
}
