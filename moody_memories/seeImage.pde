void seeImage(){
  //Read current frame
  int dimension = img.width * img.height;
  img.loadPixels();
  
  //Make change based on mood
  if (gamma == 1) {
    //Happy
    //Make rose tinted
    PImage pic = loadImage("pic.jpg");
    img.blend(pic, 0, 0, pic.width, pic.height, 0, 0, img.width, img.height, MULTIPLY);
  } else if (gamma == 2) {
    //Sad
    //Make image blue
    for (int i = 0; i < dimension; i += 3) { 
      img.pixels[i] = color(0, 0, 255); 
    }
    //img.resize(img.width*2, img.height*2);
  } else if (gamma == 3) {
    //Scared
    float v = 1.0 / 9.0;
    float[][] kernel = {{ v, v, v }, 
                    { v, v, v }, 
                    { v, v, v }};
    //Blur image from Processing example
    for (int y = 1; y < img.height-1; y++) {
      for (int x = 1; x < img.width-1; x++) {
        float sum = 0;
        for (int ky = -1; ky <= 1; ky++) {
          for (int kx = -1; kx <= 1; kx++) {
            int pos = (y + ky)*img.width + (x + kx);
            float val = red(img.pixels[pos]);
            sum += kernel[ky+1][kx+1] * val;
          }
        }
        img.pixels[y*img.width + x] = color(sum);
      }
    }
  } else if (gamma == 4) {
    //Mad
    //Distort image from Processing example
    int halfImage = width * height / 2 + 7;
    for (int i = 0; i < halfImage; i++) {
      img.pixels[i+halfImage] = img.pixels[i];
    }
    for (int i = 0; i < dimension; i += 10) { 
      img.pixels[i] = color(0, 0, 0); 
    }
    //img.resize(img.width/2, img.height/2);
  }
  
  //Update with new image
  img.updatePixels();
  
  //Write memory
  saveFrame("memory-" + alpha + beta + gamma + "-######.png");
}
