int feel;
int presence;
int emotion;

int alpha;
int beta;
int gamma;

String mood;
String lonely;
String feeling;
String state;

int napTime = 3000;

int[] moodTendency = { 0, 0, 0, 0, 0, 0, 1, 1, 1, 1 };
int[] goodLonely = { 1, 1, 1, 2, 3, 3, 3, 3, 4, 4 };
int[] goodNotLonely = { 1, 1, 1, 1, 2, 2, 2, 3, 3, 4 };
int[] badLonely = { 1, 2, 2, 3, 3, 3, 4, 4, 4, 4 };
int[] badNotLonely = { 1, 1, 2, 2, 2, 2, 3, 4, 4, 4 };

void setup(){
  size(400, 400, P2D);
}

void draw(){
  
  // Determine mood every 30 frames
  //if (frameCount % 30 == 0){
    
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
  
  // Simulate the reading of someone being present
  presence = int(random(2));
  //println(presence);
  switch(presence){
    case 0:
      lonely = "not lonely";
      beta = 0;
      break;
    case 1:
      lonely = "lonely";
      beta = 1;
      break;
  };
  
  emotion = int(random(10));
  //println(emotion);
  
  //Determine emotion
  if (alpha == 0 && beta == 0){
    gamma = goodLonely[emotion];
  } else if (alpha == 0 && beta == 1){
    gamma = goodNotLonely[emotion];
  } else if (alpha == 1 && beta == 0){
    gamma = badLonely[emotion];
  } else if (alpha == 1 && beta == 1){
    gamma = badNotLonely[emotion];
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

  state = "I'm in a " + mood + " mood, I am " + lonely + ", and I feel " + feeling;
  println(state);
  //}
  
  delay(napTime);
}
