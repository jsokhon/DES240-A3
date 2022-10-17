PImage renewableNotClicked;
PImage renewableClicked;

PImage fossilNotClicked;
PImage fossilClicked;

PImage offBackground;
PImage onBackground;
PImage sky1;
PImage sky2;

Button renewableButton;
Button fossilButton;
Button resetButton;

float posX[] = new float[2];

boolean rewnewableButtonPressed = false;
boolean fossilButtonPressed = false;
boolean rewnewableAfterfossil = false; // if renewable is pressed AFTER fossil then there is a message.

boolean reset = false;

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

  onBackground = loadImage("Assets/image1.png");

  fossilNotClicked = loadImage("Assets/fbutton1.png");
  fossilClicked = loadImage("Assets/fbutton2.png");

  renewableButton = new Button(100, 500, 250, 250, renewableNotClicked, renewableClicked, "renewableButton");
  fossilButton = new Button(1250, 500, 250, 250, fossilNotClicked, fossilClicked, "fossilButton");
  //resetButton = new Button(1000, 600, 100, 100, renewableNotClicked,renewableClicked, "resetButton");
  fossilBackground = new FossilBackground(numOfFossilFrames);
  renewableBackground = new RenewableBackground(numOfRenewableFrames);

  frameRate(frame_rate);
  
  posX[0] = -800;
  posX[1] = 800;
}


void draw() {
  background(83, 166, 220);

  image(offBackground, 0, 0);
  renewableButton.update();
  renewableButton.render();
  fossilButton.update();
  fossilButton.render();
  
  // if renewableButton is clicked then showcase the proper array

  if (mousePressed && renewableButton.isClicked()) {
    println("R BUTTON CLICKED");
    image(onBackground, 0, 0);

    renewableBackground.display();
    rewnewableButtonPressed = true;
  } else {
    if (rewnewableButtonPressed) {
      renewableButton.setClicked();
      renewableButton.buttonNotClickedRender();
    }
  }

  if (mousePressed && fossilButton.isClicked()) {
    println("F BUTTON CLICKED");
    image(onBackground, 0, 0);
    fossilBackground.display();
    fossilButtonPressed = true;
  } else {
    if (fossilButtonPressed) {
      
      fossilButton.setClicked();
      fossilButton.buttonNotClickedRender();
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