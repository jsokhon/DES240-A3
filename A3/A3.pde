PImage testImage;
Button renewableButton;
Button fossilButton; 
PImage testImage2;


void setup() {
  size(1600, 800);
  testImage = loadImage("Assets/test.png");
  testImage2 = loadImage("Assets/test2.png");
  renewableButton = new Button(200, 600, 100, 100, testImage, testImage2, "renewableButton");
  fossilButton = new Button(1400, 600, 100, 100, testImage2, testImage, "fossilButton");
  
}


void draw() {
  renewableButton.update();
  renewableButton.render();
  //renewableButton.hover();
  
  fossilButton.update();
  fossilButton.render();
}



//class to store all Fossil fuels

class FossilButton {
}
