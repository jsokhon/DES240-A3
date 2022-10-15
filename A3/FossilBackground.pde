// class to store all the images for the fossil fuel background



class FossilBackground {
  int numOfFrames;
  PImage[] backgrounds;
  boolean finsihed = false;


  float posX [] = new float[2];

  int offset = 0;

  //PImage image0;
  //PImage image1;

  FossilBackground(int frameNum) {
    numOfFrames = frameNum;
    backgrounds = new PImage[numOfFrames];

    posX[0] = 0;
    posX[1] = 1000;

    //image1 = loadImage("Assets/sky1.png");
    //image1 = loadImage("Assets/sky2.png");




    for (int i = 0; i < numOfFrames; i++) {
      //println("image" + i);
      backgrounds[i] = loadImage("Assets/image" + nf(i) + ".png");
    }
  }




  // if some boolean is true, then play an animation for x seconds
  void display() {
    println("FOSSIL BG DISPLAY");
    if (!finished) {
      pushMatrix();
      //imageMode(CENTER);
      popMatrix();


      for (int x = -100; x < width; x += backgrounds[0].width) {
        image(backgrounds[(currentFrame+offset) % numOfFrames], x, -20);
        offset+=2;
        image(backgrounds[(currentFrame+offset) % numOfFrames], x, height/2);
        offset+=2;
      }



      //for (int i = 0; i < 2; i++) {
      //println(i);
      //image(backgrounds[i], posX[0], 0);
      //image(backgrounds[i], posX[0], 0);
      //size(400, 400);
      //fill(255,0,0);
      //rect(120, 80, 220, 220);
      //}
    }
  }
}
