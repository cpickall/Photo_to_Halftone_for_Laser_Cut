import processing.pdf.*;

PImage pic;

float size;

//this is the image you want to convert. it should be in the data folder.
String myFile = "imagesmall.jpg"

void setup(){
  size(3000, 1600);
  pic = loadImage(myFile);
  beginRecord(PDF, "dotPic.pdf");
  
}

void draw(){
  background(255);
  noLoop();
  noFill();
  strokeWeight(.001);
  stroke(255,0,0);
  pic.loadPixels();
   for (int y = 0; y < pic.height; y++) {
    for (int x = 0; x < pic.width; x++) {
      int loc = x + y*pic.width;
      float r = red(pic.pixels[loc]);
      float g = green(pic.pixels[loc]);
      float b = blue(pic.pixels[loc]);
      float c = (0.21*r + 0.72*g + 0.07*b);
      float size = map(c, 0, 255, 0, 10);
      ellipse(x*15, y*15, size, size);
    }
   }
  
  endRecord();
}