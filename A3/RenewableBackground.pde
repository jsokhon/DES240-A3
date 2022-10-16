// class to store all the images for the rewnewable background;

class RenewableBackground {
  int numOfFrames;
  PImage[] backgrounds;
  boolean finsihed = false;

  int imageCount;
  int frame;


  float posX [] = new float[2];

  int offset = 0;

  //PImage image0;
  //PImage image1;

  RenewableBackground(int frameNum) {

    imageCount = frameNum;
    numOfFrames = frameNum;
    backgrounds = new PImage[numOfFrames];

    posX[0] = 0;
    posX[1] = 1000;

    //image1 = loadImage("Assets/sky1.png");
    //image1 = loadImage("Assets/sky2.png");



 
    for (int i = 0; i < numOfFrames; i++) {
      //println("image" + i);
      backgrounds[i] = loadImage("Assets/renewablebg" + nf(i) + ".png");
    }
  }

  /////




  // if some boolean is true, then play an animation for x seconds

  void display() {
    if (renewableButton.isClicked()) {
      pushMatrix();
      frame = (frame+1) % imageCount;
      //println("FRAME", frame);
      //imageMode(CENTER);
      image(backgrounds[frame], 0, 0);
      popMatrix();
    }
  }
}
