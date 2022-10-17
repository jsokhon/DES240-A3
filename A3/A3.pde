import processing.sound.*;

SoundFile industrialSound;
PImage renewableNotClicked;
PImage renewableClicked;

PImage fossilNotClicked;
PImage fossilClicked;

PImage offBackground;
PImage onBackground;
PImage sky1;
PImage sky2;
PImage start;

Button renewableButton;
Button fossilButton;
Button resetButton;

float posX[] = new float[2];

boolean rewnewableButtonPressed = false;
boolean fossilButtonPressed = false;
boolean rewnewableAfterfossil = false; // if renewable is pressed AFTER fossil then there is a message.

boolean playMusic, reset = false;

int frame_rate = 10;

int numOfFossilFrames = 2; //num of frames in the animation (num of scenes) for FOSSIL
int numOfRenewableFrames = 2;
int currentFrame = 0;
FossilBackground fossilBackground;
RenewableBackground renewableBackground;
//PImage[] fossilBackgrounds = new PImage[2];
//PImage[] renewableBackgrounds = new PImage[2];

void setup() {
  size(1600, 800);
  sky1 = loadImage("Assets/sky1.png");
  sky2 = loadImage("Assets/sky2.png");

  offBackground = loadImage("Assets/image0.png");
  renewableNotClicked = loadImage("Assets/rbutton1.png");
  renewableClicked = loadImage("Assets/rbutton2.png");
  start = loadImage("Assets/start.png");
  onBackground = loadImage("Assets/image1.png");

  fossilNotClicked = loadImage("Assets/fbutton1.png");
  fossilClicked = loadImage("Assets/fbutton2.png");

  renewableButton = new Button(100, 500, 250, 250, renewableNotClicked, renewableClicked, "renewableButton");
  fossilButton = new Button(1250, 500, 250, 250, fossilNotClicked, fossilClicked, "fossilButton");
  //resetButton = new Button(1000, 600, 100, 100, renewableNotClicked,renewableClicked, "resetButton");
  fossilBackground = new FossilBackground(numOfFossilFrames);
  renewableBackground = new RenewableBackground(numOfRenewableFrames);

  industrialSound = new SoundFile(this, "Music/factory.wav");

  frameRate(frame_rate);

  posX[0] = -800;
  posX[1] = 800;
}


void draw() {
  background(83, 166, 220);

  //text("word", 40, 120);

  image(offBackground, 0, 0);


  //image(start, 0,0);

  //textSize(120);
  //text("Choose your source", 300, height/2);
  renewableButton.update();
  renewableButton.render();
  fossilButton.update();
  fossilButton.render();

  // if renewableButton is clicked then showcase the proper array

  if (mousePressed && renewableButton.isClicked()) {
    //println("R BUTTON CLICKED");
    image(onBackground, 0, 0);

    renewableBackground.display();
    rewnewableButtonPressed = true;
  } else {
    if (rewnewableButtonPressed) {
      renewableButton.setClicked();
      renewableButton.buttonNotClickedRender();
    }
  }

  if (playMusic){
    print("SOUND");
    industrialSound.amp(0.2);
    industrialSound.play();
  }else{
    println("here");
    println();
    industrialSound.stop();
    println(industrialSound.isPlaying());
  }
  


  if (mousePressed && fossilButton.isClicked()) {
    println("in here");
    //println(playMusic);
    playMusic = true;


    //industrialSound.pause();
    //println("F BUTTON CLICKED");
    image(onBackground, 0, 0);
    fossilBackground.display();
    fossilButtonPressed = true;

    //println("PLAY");
  } else {
    playMusic = false;
    if (fossilButtonPressed) {
      
      
      //println(industrialSound.isPlaying());
      if (playMusic == false) {
        industrialSound.stop();
      }
      fossilButton.setClicked();
      fossilButton.buttonNotClickedRender();
      //playMusic=false;
      //println("STOPS");
      //industrialSound.pause();
    }
  }

  pushMatrix();
  rotate(radians(-20));
  image(sky1, posX[0], 0);
  image(sky2, posX[1], 0);
  for (int i = 0; i < 2; i++) {
    if (posX[i] > -1600) {
      posX[i] -= 1;
    } else {
      posX[i] = 1600;
    }
  }
  popMatrix();
}
