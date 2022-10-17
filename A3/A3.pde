import processing.sound.*;

SoundFile industrialSound, renewableSound;
PImage renewableNotClicked;
PImage renewableClicked;

PImage fossilNotClicked;
PImage fossilClicked;

PImage resetImg;

PImage offBackground;
PImage onBackground;
PImage sky1;
PImage sky2;
PImage wire1;
PImage wire2;
PImage smog;
PImage smogIslandOn;
PImage smogIslandOff;
int count = 0;
PImage start;

String attribute1 = "Rhapsody Productions. (2018, December 25). Royalty Free Machines Sound Effects Pack. Youtube.";
String attribute2= "BurghRecords. (2020, April 29). Free Sound Effects - Nature Sounds River and Birds (Royalty-free Sound Effects). Youtube.";
int startX =0;
int startY = 0;

Button renewableButton;
Button fossilButton;
Button resetButton;

float posX[] = new float[2];

boolean rewnewableButtonPressed = false;
boolean fossilButtonPressed, setSmog = false;
boolean rewnewableAfterfossil = false; // if renewable is pressed AFTER fossil then there is a message.

boolean playMusic, reset = false;

int resetCount = 0;

int frame_rate = 10;

int numOfFossilFrames = 3; //num of frames in the animation (num of scenes) for FOSSIL
int numOfRenewableFrames = 3;
int currentFrame = 0;
FossilBackground fossilBackground;
RenewableBackground renewableBackground;

void setup() {
  size(1600, 800);
  industrialSound = new SoundFile(this, "Music/factory.wav");
  renewableSound = new SoundFile(this, "Music/forest.wav");
  sky1 = loadImage("Assets/sky1.png");
  sky2 = loadImage("Assets/sky2.png");
  wire1 = loadImage("Assets/wire1.png");
  wire2 = loadImage("Assets/wire2.png");
  smog = loadImage("Assets/smog.png");
  smogIslandOn = loadImage("Assets/SaveIsland2.png");
  smogIslandOff = loadImage("Assets/SaveIsland.png");
  resetImg = loadImage("Assets/reset.png");

  offBackground = loadImage("Assets/image0.png");
  renewableNotClicked = loadImage("Assets/rbutton1.png");
  renewableClicked = loadImage("Assets/rbutton2.png");
  start = loadImage("Assets/start.png");
  onBackground = loadImage("Assets/image1.png");

  fossilNotClicked = loadImage("Assets/fbutton1.png");
  fossilClicked = loadImage("Assets/fbutton2.png");

  renewableButton = new Button(100, 500, 250, 250, renewableNotClicked, renewableClicked, attribute2);
  fossilButton = new Button(1150, 500, 250, 250, fossilNotClicked, fossilClicked, attribute1);
  resetButton = new Button(700, 600, 150, 150, resetImg, resetImg, "");


  fossilBackground = new FossilBackground(numOfFossilFrames);
  renewableBackground = new RenewableBackground(numOfRenewableFrames);



  frameRate(frame_rate);

  posX[0] = -800;
  posX[1] = 800;
}


void draw() {

  //println(count);
  background(83, 166, 220);
  if (count >= 60) {
    image(smog, 0, 0);
    image(smogIslandOn, 0, 0);
    setSmog = true;
  }

  if (count >= 60 && setSmog == true) {
    image(smogIslandOff, 0, 0);
    if (renewableButton.isClicked() == false && fossilButton.isClicked() == false) {
      resetButton.update();
      resetButton.render();
    }
  } else {
    image(offBackground, 0, 0);
  }


  image(start, startX, startY);
  renewableButton.update();
  renewableButton.render();
  fossilButton.update();
  fossilButton.render();

  // if renewableButton is clicked then showcase the proper array

  if (mousePressed && resetButton.isClicked()) {
    count = 0;
    sky1 = loadImage("Assets/sky1.png");
    sky2 = loadImage("Assets/sky2.png");
  }

  if (mousePressed && renewableButton.isClicked()) {
    if (count < 60) {
      image(onBackground, 0, 0);
    }

    if (count >= 60) {
      image(smogIslandOn, 0, 0);
    }


    image(start, startX, startY);
    startX -= 150;
    image(wire1, 0, 0);

    renewableBackground.display();
    rewnewableButtonPressed = true;
    fossilButtonPressed = false;
  } else {
    playMusic = false;
    if (playMusic == false) {
      renewableSound.stop();
    }
    if (rewnewableButtonPressed) {
      startX = 0;
      renewableButton.setClicked();
      renewableButton.buttonNotClickedRender();
      resetButton.setClicked();
    }
  }


  if (mousePressed && fossilButton.isClicked()) {
    println(count);
    count ++;

    playMusic = true;

    if (count < 60) {
      image(onBackground, 0, 0);
    }
    if (count >= 60) {
      image(smogIslandOn, 0, 0);
    }

    image(start, startX, startY);
    startX += 150;
    image(wire2, 0, 0);
    fossilBackground.display();
    fossilButtonPressed = true;
    rewnewableButtonPressed = false;
  } else {
    playMusic = false;
    if (fossilButtonPressed) {
      startX = 0;
      if (playMusic == false) {
        industrialSound.stop();
      }
      fossilButton.setClicked();
      fossilButton.buttonNotClickedRender();
      resetButton.setClicked();
    }
  }

  pushMatrix();
  rotate(radians(-20));
  image(sky1, posX[0], 0);
  image(sky2, posX[1], 0);
  for (int i = 0; i < 2; i++) {
    if (posX[i] > -1600) {
      if (count > 60) {
        sky1 = loadImage("Assets/SaveClouds.png");
        sky2 = loadImage("Assets/SaveClouds2.png");
      }
      posX[i] -= 2;
    } else {
      posX[i] = 1600;
    }
  }
  popMatrix();
}




void mousePressed() {

  if (mouseX >= fossilButton.xPos && mouseX <= fossilButton.xPos + fossilButton._width && mouseY >= fossilButton.yPos && mouseY <= fossilButton.yPos + fossilButton._height) {
    playMusic = true;
    if (renewableSound.isPlaying()) {
      renewableSound.stop();
    }
    industrialSound.amp(0.3);
    industrialSound.play();
  } else {
    industrialSound.stop();
  }

  if (mouseX >= renewableButton.xPos && mouseX <= renewableButton.xPos + renewableButton._width && mouseY >= renewableButton.yPos && mouseY <= renewableButton.yPos + renewableButton._height) {
    playMusic = true;
    renewableSound.play();
  } else {
    renewableSound.stop();
  }
}
