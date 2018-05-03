//IFTTT
import processing.net.*;

Client c;
String data;
String myserver = "maker.ifttt.com";

//Syphon
import codeanticode.syphon.*;

PImage img;
SyphonClient client;

void setup(){
  size(480, 340, P2D);
  //background(255);
  client = new SyphonClient(this);
}

void draw(){
  background(0);
  // Get image from Syphon
  if (client.newFrame()) {
    img = client.getImage(img);   
  }
  if (img != null) {
    image(img, 0, 0, width, height);  
  }
  
  //Run getState every 100 frames
  if (frameCount % 100 == 0){
    getState();
    seeImage();
  }
}

void getState(){
  getMood();
  getPresence();
  getEmotionAction();
  
  state = "I'm in a " + mood + " mood, I am " + lonely + ", and I feel " + feeling;
  
  //fill(0, 102, 153);
  //text(state, 20, 20);
  //text(output, 20, 40);
  println(state);
  println(output);
  
  //delay(napTime);
};
