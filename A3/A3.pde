PImage renewableNotClicked;
PImage renewableClicked;

PImage fossilNotClicked;
PImage fossilClicked;

PImage offBackground; 
Button renewableButton;
Button fossilButton;
Button resetButton;


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
  offBackground = loadImage("Assets/image0.png");
  renewableNotClicked = loadImage("Assets/rbutton1.png");
  renewableClicked = loadImage("Assets/rbutton2.png");
  
  fossilNotClicked = loadImage("Assets/fbutton1.png");
  fossilClicked = loadImage("Assets/fbutton2.png");
  
  renewableButton = new Button(100, 400, 400, 400, renewableNotClicked, renewableClicked, "renewableButton");
  fossilButton = new Button(1200, 400, 400, 400, fossilNotClicked, fossilClicked, "fossilButton");
  //resetButton = new Button(1000, 600, 100, 100, renewableNotClicked,renewableClicked, "resetButton");
  fossilBackground = new FossilBackground(numOfFossilFrames);
  renewableBackground = new RenewableBackground(numOfRenewableFrames);
  
  frameRate(frame_rate);
}


void draw() {
  background(0,0,200);
  
  image(offBackground, 0,0);
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
