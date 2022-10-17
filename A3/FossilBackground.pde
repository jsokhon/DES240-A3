// class to store all the images for the fossil fuel background



class FossilBackground {
  int numOfFrames;
  PImage[] backgrounds;
  boolean finsihed = false;

  int imageCount;
  int frame;


  float posX [] = new float[2];

  int offset = 0;
  FossilBackground(int frameNum) {

    imageCount = frameNum;
    numOfFrames = frameNum;
    backgrounds = new PImage[numOfFrames];

    posX[0] = 0;
    posX[1] = 1000;


    // load all images
    for (int i = 0; i < numOfFrames; i++) {
      //println("image" + i);
      backgrounds[i] = loadImage("Assets/frame" + nf(i) + ".png");
    }
  }



  // if some boolean is true, then play an animation for x seconds

  void display() {
    if (fossilButton.isClicked()) {
      pushMatrix();
      frame = (frame+1) % imageCount;
      image(backgrounds[frame], 0, 0);
      popMatrix();
    }
  }
}
