int feel;
int presence;
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
    
  feel = int(random(2));
  //println(feel);
  switch(feel){
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
      break;
    case 1:
      lonely = "lonely";
      break;
  }
  
  state = mood + " " + lonely;
  println(state);
  //}
  
  delay(napTime);
}
