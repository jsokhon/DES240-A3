PImage testImage;
Button renewableButton;
Button fossilButton;
Button resetButton;
PImage testImage2;

boolean rewnewableButtonPressed = false;
boolean fossilButtonPressed = false;
boolean rewnewableAfterfossil = false; // if renewable is pressed AFTER fossil then there is a message.

boolean reset = false; 

int frame_rate = 10;

int numOfFossilFrames = 6; //num of frames in the animation (num of scenes) for FOSSIL
int numOfRenewableFrames = 12; 
int currentFrame = 0;
FossilBackground fossilBackground;
RenewableBackground renewableBackground;
//PImage[] fossilBackgrounds = new PImage[2];
//PImage[] renewableBackgrounds = new PImage[2];

void setup() {
  size(1600, 800);
  testImage = loadImage("Assets/test.png");
  testImage2 = loadImage("Assets/test2.png");
  renewableButton = new Button(200, 600, 100, 100, testImage, "renewableButton");
  fossilButton = new Button(1400, 600, 100, 100, testImage2, "fossilButton");
  resetButton = new Button(1000, 600, 100, 100, testImage2, "resetButton");
  fossilBackground = new FossilBackground(numOfFossilFrames);
  renewableBackground = new RenewableBackground(numOfRenewableFrames);
  
  frameRate(frame_rate);
}


void draw() {
  renewableButton.update();
  renewableButton.render();
  fossilButton.update();
  fossilButton.render();
  
  
  // if renewableButton is clicked then showcase the proper array
  if (renewableButton.isClicked()) {
    println("R BUTTON CLICKED");
    renewableBackground.display();
    rewnewableButtonPressed = true;
    
  }

  if (fossilButton.isClicked()) {
    println("F BUTTON CLICKED");
    fossilBackground.display();
    fossilButtonPressed = true; 
  }
}
