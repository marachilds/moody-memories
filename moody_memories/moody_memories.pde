int feel;
int presence;

int alpha;
int beta;
int gamma;

String mood;
String lonely;
String state;

int napTime = 3000;

void setup(){
  size(400, 400, P2D);
}

void draw(){
  
  // Determine mood every 30 frames
  //if (frameCount % 30 == 0){
    
  feel = int(random(10));
  //println(feel);
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
  }
  
  state = "I'm in a " + mood + " mood and I am " + lonely;
  println(state);
  //}
  
  delay(napTime);
}
