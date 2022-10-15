class Button {
  float xPos;
  float yPos;
  float _width;
  float _height;
  PImage image1;
  PImage image2;
  PImage mainImage;
  boolean pressed = false;
  boolean clicked = false;
  boolean overButton = false;
  
  String text;


  Button(float x, float y, float w, float h, PImage i1, PImage i2, String txt) {
    xPos = x;
    yPos = y;
    _width = w;
    _height = h;
    image1 = i1;
    image2 = i2;
    mainImage = i1;
    text = txt;
  }

  //must be placed in void draw to work and check if buttons are clicked.
  void update() {
    if (mousePressed == true && pressed == false) {
      pressed = true;
      //println(text, "Pressed");
      // has to be pressed in the dimensions of the buttons
      // positions to be worked out
      if (mouseX >= xPos && mouseX <= xPos + _width && mouseY >= yPos && mouseY <= yPos + _height) {
        //pressed = true;
        clicked = true;
      } else {
        clicked = false;
        pressed = false;
      }
    }
  }

  //render button to show up on screen
  void render() {
    //imageMode(CENTER);
    image(mainImage, xPos, yPos, _width, _height); //(image file name, x coordinate, y coordinate, width, height)
  }

  boolean isClicked() { // use in the if statemenets to check if if the button is has been clicked returns boolean
    return clicked;
  }

  // if mouse is over this button then it'll change colour
  boolean overButton() {
    if (mouseX >= xPos && mouseX <= xPos + _width && mouseY >= yPos && mouseY <= yPos + _height) {
      return true;
    } else {
      return false;
    }
  }
  
  void display(){

  
  }
  
  //doesn't work rn
  /*
  void hover() {

    if (overButton) {
      mainImage = image2;
      println("TRUE");
    } else {
      mainImage = image1;
    }
  }
  */
}
