//Random array index for mood, presence, emotion
int feel;
int presence;
int emotion;

//Int for mood, presence, emotion
int alpha;
int beta;
int gamma;

//Human readable output
String mood;
String lonely;
String feeling;
String state;

//Arrays for probability
int[] moodTendency = { 0, 0, 0, 0, 0, 0, 1, 1, 1, 1 };
int[] goodLonely = { 1, 1, 1, 2, 3, 3, 3, 3, 4, 4 };
int[] goodNotLonely = { 1, 1, 1, 1, 2, 2, 2, 3, 3, 4 };
int[] badLonely = { 1, 2, 2, 3, 3, 3, 4, 4, 4, 4 };
int[] badNotLonely = { 1, 1, 2, 2, 2, 2, 3, 4, 4, 4 };

//Determining IFTTT action
int tweet;
int spotify;
int action;
String sendTweet;
String playMusic;
int[] goodTweet = { 0, 0, 0, 1 };
int[] badTweet = { 0, 1, 1, 1 };
int[] goodMusic = { 0, 0, 0, 1 };
int[] badMusic = { 0, 1, 1, 1 };
int toDo;
String output;

void getMood(){
  feel = int(random(10));
  alpha = moodTendency[feel];
  switch(alpha){
    case 0:
      mood = "good";
      break;
    case 1:
      mood = "bad";
      break;
  }
}

void getPresence(){
  //Face detection
  Rectangle[] faces = opencv.detect();
  if (faces.length > 0) {
    beta = 1;
    lonely = "not lonely";
    output = playMusic;
  } else {
    beta = 0;
    lonely = "lonely";
    output = sendTweet;
  };
}

void getEmotionAction(){
  //Determine emotion and action
  emotion = int(random(10));
  action = int(random(4));
  
  //Determine emotion
  if (alpha == 0 && beta == 0){
    gamma = goodLonely[emotion];
    tweet = goodTweet[action];
    spotify = 1;
  } else if (alpha == 0 && beta == 1){
    gamma = goodNotLonely[emotion];
    spotify = goodMusic[action];
    tweet = 1;
  } else if (alpha == 1 && beta == 0){
    gamma = badLonely[emotion];
    tweet = badTweet[action];
    spotify = 1;
  } else if (alpha == 1 && beta == 1){
    gamma = badNotLonely[emotion];
    spotify = badMusic[action];
    tweet = 1;
  }
  
  switch(gamma){
    case 1:
      feeling = "happy";
      break;
    case 2:
      feeling = "sad";
      break;
    case 3:
      feeling = "scared";
      break;
    case 4:
      feeling = "mad";
      break;
  }
  
  if(tweet == 0){
    sendTweet = "I will tweet";
    tweetValue();
  } else {
    sendTweet = "I will not tweet";
  }
  
  if(spotify == 0){
    playMusic = "I will play music";
    loadStrings("https://maker.ifttt.com/trigger/iwillplaymusic/key/h0Z0xn_Sh1_KNaHfcnoEPUz2ow8n-OZC1eolXk7deZ-");
    println("sent");
  } else {
    playMusic = "I will not play music";
  }
}
