// class to store all the images for the fossil fuel background



class FossilBackground {
  PImage[] backgrounds = new PImage[2];
  boolean finsihed = false;

  float posX [] = new float[2];

  //PImage image0;
  //PImage image1;

  FossilBackground() {

    posX[0] = -540;
    posX[1] = 540;

    //image1 = loadImage("Assets/sky1.png");
    //image1 = loadImage("Assets/sky2.png");




    for (int i = 0; i < 2; i++) {
      //println("image" + i);
      backgrounds[i] = loadImage("Assets/image" + nf(i) + ".png");
    }
  }




  // if some boolean is true, then play an animation for x seconds
  void display() {
    println("FOSSIL BG DISPLAY");
    if (!finished) {
      imageMode(CENTER);
      for (int i = 0; i < 2; i++) {
        image(backgrounds[i], posX[0], 0);
        //size(400, 400);
        fill(255,0,0);
        rect(120, 80, 220, 220);
      }
    }
  }
}
