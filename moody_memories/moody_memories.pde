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
int napTime = 3000;

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

void setup(){
  size(400, 400, P2D);
  background(255);
}

void draw(){
  background(255);
  // Determine mood every 30 frames
  //if (frameCount % 30 == 0){
    
  getMood();
  getPresence();
  getEmotionAction();
  
  state = "I'm in a " + mood + " mood, I am " + lonely + ", and I feel " + feeling;
  
  fill(0, 102, 153);
  text(state, 20, 20);
  text(output, 20, 40);
  println(state);
  println("So I will " + output);
  //}
  
  delay(napTime);
}

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
  presence = int(random(2));
  //println(presence);
  switch(presence){
    case 0:
      lonely = "lonely";
      beta = 0;
      toDo = 0;
      break;
    case 1:
      lonely = "not lonely";
      beta = 1;
      toDo = 1;
      break;
  };
}

void getEmotionAction(){
  //Determine emotion and action
  action = int(random(4));
  emotion = int(random(10));
  
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
  
  switch(tweet){
    case 0:
      sendTweet = "I will tweet";
      break;
    case 1:
      sendTweet = "I will not tweet";
      break;
  }
  
  switch(spotify){
    case 0:
      playMusic = "I will play music";
      break;
    case 1:
      playMusic = "I will not play music";
      break;
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
