import processing.video.*;
Capture video;
PImage img;
int stage;

void setup() {
  size(1280, 720);
  video = new Capture(this, 640, 480);
  video.start();
  img = loadImage("testPic.jpg");
  stage = 1;
}


void draw() {
  if (stage == 1) {
    image(img, 0, 0);
    noFill();
    stroke(255);
    rect(400, 600, 500, 50);
    text("Start capture", 600, 620);
    if (mouseX > 0 && mousePressed) {
      stage = 2;
    }
  }

  if (stage == 2) {
    background(0);
    image(video, 0, 0);
    if (key == CODED) {
      if (keyCode == SHIFT) {
        snap();
      }
    }
  }

  if (stage ==3) {
  }
}

void snap() {
  video.read();
  if (key == CODED) {
    if (keyCode == ENTER) {
      halt();
    }
  }
}

void halt() {  // Work in progress.


  saveFrame("filename.jpg");
  println("yes");
  video.stop();
}
