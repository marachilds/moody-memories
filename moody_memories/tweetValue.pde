void tweetValue(){
  
  String[] happyTweets = loadStrings("happy.txt");
  String[] sadTweets = loadStrings("sad.txt");
  String[] scaredTweets = loadStrings("scared.txt");
  String[] madTweets = loadStrings("mad.txt");
  String theTweet;
  String urlBase = "https://maker.ifttt.com/trigger/iwilltweet/with/key/h0Z0xn_Sh1_KNaHfcnoEPUz2ow8n-OZC1eolXk7deZ-?";
  String fullURL;
  int pick;
  
  if (tweet == 0) {
  pick = int(random(20));
  if (gamma == 1) {
    theTweet = happyTweets[pick];
  } else if (gamma == 2) {
    theTweet = sadTweets[pick];
  } else if (gamma == 3) {
    theTweet = scaredTweets[pick];
  } else if (gamma == 4) {
    theTweet = madTweets[pick];
  } else {
    theTweet = "nothing";
  };
  
  fullURL = urlBase + "value1=" + theTweet + "&" + "value2=" + feeling;
  //println(fullURL);
  loadStrings(fullURL);
  } else {
    println("nothing");
  }
}
