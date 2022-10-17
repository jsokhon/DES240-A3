// class to store all the images for the rewnewable background;

class RenewableBackground {
  int numOfFrames;
  PImage[] backgrounds;
  boolean finsihed = false;

  int imageCount;
  int frame;


  float posX [] = new float[2];

  int offset = 0;

  RenewableBackground(int frameNum) {

    imageCount = frameNum;
    numOfFrames = frameNum;
    backgrounds = new PImage[numOfFrames];

    posX[0] = 0;
    posX[1] = 1000;



    for (int i = 0; i < numOfFrames; i++) {
      backgrounds[i] = loadImage("Assets/renewablebg" + nf(i) + ".png");
    }
  }



  // if some boolean is true, then play an animation for x secondss

  void display() {
    if (renewableButton.isClicked()) {
      pushMatrix();
      frame = (frame+1) % imageCount;
      image(backgrounds[frame], 0, 0);
      popMatrix();
    }
  }
}
