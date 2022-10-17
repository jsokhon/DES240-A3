import processing.sound.*;


class Button {
  float xPos;
  float yPos;
  float _width;
  float _height;
  PImage notClickedImg;
  PImage clickedImg;
  //PImage mainImage;
  boolean pressed = false;
  boolean clicked = false;
  boolean overButton = false;

  boolean held = false;

  String text;
  
  


  Button(float x, float y, float w, float h, PImage i1, PImage i2, String txt) {
    xPos = x;
    yPos = y;
    _width = w;
    _height = h;
    notClickedImg = i1;
    clickedImg = i2;
    //mainImage = i2;
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
        //image(notClickedImg, xPos, yPos, _width, _height);
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
    if (isClicked()) {
      image(clickedImg, xPos, yPos, _width, _height);
    } else {
      image(notClickedImg, xPos, yPos, _width, _height); //(image file name, x coordinate, y coordinate, width, height)
    }
  }

  void buttonNotClickedRender() {
    image(notClickedImg, xPos, yPos, _width, _height);
  }

  boolean isClicked() { // use in the if statemenets to check if if the button is has been clicked returns boolean
    return clicked;
  }


  void setClicked() {
    if (pressed) {
      pressed = false;
      clicked = false;
    }
  }

  
}
