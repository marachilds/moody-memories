int feel;
int presence;
int emotion;

int alpha;
int beta;
int gamma;

String mood;
String lonely;
String state;

int napTime = 3000;

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
  //Could have also populated an array with six 0s and four 1s and a random index
  switch(feel){
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
      mood = "good";
      alpha = 0;
      break;
    case 6:
    case 7:
    case 8:
    case 9:
      mood = "bad";
      alpha = 1;
      break;
  };
  
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

  state = "I'm in a " + mood + " mood, I am " + lonely + ", and I feel " + gamma;
  println(state);
  //}
  
  delay(napTime);
}
