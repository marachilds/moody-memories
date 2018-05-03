//IFTTT
import processing.net.*;
Client c;
String data;
String myserver = "maker.ifttt.com";

//Syphon
import codeanticode.syphon.*;
PImage img;
SyphonClient client;

//Face Detection
import gab.opencv.*;
import processing.video.*;
import java.awt.*;
Capture video;
OpenCV opencv;

void setup(){
  size(640, 480, P2D);
  //background(255);
  //Syphon
  client = new SyphonClient(this);
  //Face detection
  video = new Capture(this, 640/2, 480/2);
  opencv = new OpenCV(this, 640/2, 480/2);
  opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);  

  video.start();
}

void draw(){
  //Face Detectioin
  scale(2);
  opencv.loadImage(video);
  //Redraw
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
    //seeImage();
  }
}

void getState(){
  getMood();
  getPresence();
  getEmotionAction();
  
  state = "I'm in a " + mood + " mood, I am " + lonely + ", and I feel " + feeling;

  println(state);
  println(output);
};

//Face detection
void captureEvent(Capture c) {
  c.read();
}
