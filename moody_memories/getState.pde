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

//Define delay time, this might be randomised later
//int napTime = 3000;

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
  //println(feel);
  //Using array instead of switch case
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
  // Simulate the reading of someone being present
  // Beta will be 0 (nobody) or 1 (somebody)
  // Use wekinator to train
  beta = int(random(2));
  //println(beta);
  switch(beta){
    case 0:
      lonely = "lonely";
      toDo = 0;
      break;
    case 1:
      lonely = "not lonely";
      toDo = 1;
      break;
  };
}

void getEmotionAction(){
  //Determine emotion and action
  emotion = int(random(10));
  action = int(random(4));
  
  tweet = 2;
  spotify = 2;
  
  //Determine emotion
  if (alpha == 0 && beta == 0){
    gamma = goodLonely[emotion];
    tweet = goodTweet[action];
  } else if (alpha == 0 && beta == 1){
    gamma = goodNotLonely[emotion];
    spotify = goodMusic[action];
  } else if (alpha == 1 && beta == 0){
    gamma = badLonely[emotion];
    tweet = badTweet[action];
  } else if (alpha == 1 && beta == 1){
    gamma = badNotLonely[emotion];
    spotify = badMusic[action];
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
    //Uncomment to send
    loadStrings("https://maker.ifttt.com/trigger/iwilltweet/with/key/cKNrta9uT3vzH13ZncTvaW");
  } else {
    sendTweet = "I will not tweet";
  }
  
  if(spotify == 0){
    playMusic = "I will play music";
    //Uncomment to send
    loadStrings("https://maker.ifttt.com/trigger/iwillplaymusic/with/key/cKNrta9uT3vzH13ZncTvaW");
  } else {
    playMusic = "I will not play music";
  }

  switch(toDo){
    case 0:
      output = sendTweet;
      break;
    case 1:
      output = playMusic;
      break;
  }
}
