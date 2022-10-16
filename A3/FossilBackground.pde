// class to store all the images for the fossil fuel background



class FossilBackground {
  int numOfFrames;
  PImage[] backgrounds;
  boolean finsihed = false;

  int imageCount;
  int frame;


  float posX [] = new float[2];

  int offset = 0;

  //PImage image0;
  //PImage image1;

  FossilBackground(int frameNum) {

    imageCount = frameNum;
    numOfFrames = frameNum;
    backgrounds = new PImage[numOfFrames];

    posX[0] = 0;
    posX[1] = 1000;

    //image1 = loadImage("Assets/sky1.png");
    //image1 = loadImage("Assets/sky2.png");



    // load all images
    for (int i = 0; i < numOfFrames; i++) {
      println("image" + i);
      backgrounds[i] = loadImage("Assets/renewablebg" + nf(i) + ".png");
    }
    
    
  }





  // if some boolean is true, then play an animation for x seconds

  void display() {
    if (fossilButton.isClicked()) {
      pushMatrix();
      frame = (frame+1) % imageCount;
      println("FRAME", frame);
      //imageMode(CENTER);
      image(backgrounds[frame], 0, 0);
      popMatrix();
    }
  }

  void c() {
    println("FOSSIL BG DISPLAY");
    if (!finished) {
      pushMatrix();
      //imageMode(CENTER);
      popMatrix();


      for (int x = 0; x < width; x += backgrounds[0].width) {
        //image(backgrounds[(currentFrame+offset) % numOfFrames], x, -20);
        image(backgrounds[(currentFrame) % numOfFrames], x, -20);
        offset+=2;
        image(backgrounds[(currentFrame) % numOfFrames], x, height/2);
        //image(backgrounds[(currentFrame+offset) % numOfFrames], x, height/2);
        offset+=2;
      }

    }
  }
}
