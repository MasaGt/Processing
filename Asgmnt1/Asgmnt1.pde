/**
* COMP570 Programming for Creativity 2202 S1
* Assignment - Start Code
* This program graws a black ellipse and rectangle on the screen
* that changes shape via mouse movement
* and that can be turned shite with a mouse click.
*
* @author Masaomi Goto, Student ID# 19075459
* version 1,0 - 13/3/2022: Created
*/

color shapeColour = color(0); // global variable for the shape colour; start "black"
color upperColor = color(0, 0, 255);
color bottomColor = color(0, 255, 0);
color bgColor = color(255, 255, 255);
final float STROKE_WEIGHT = 7;
final int COLOR_CODE_LIMIT = 256;

/**
* Sets up the program.
*/
void setup() {
  size(500, 500, P2D);
}

/**
* Draws a single frame.
*/
void draw() {
  background(bgColor);
  //common setting;
  strokeWeight(STROKE_WEIGHT);
  stroke(shapeColour);
  rectMode(CORNERS);
  ellipseMode(CORNERS);
  
  fill(upperColor);
  //top-left rect
  rect(STROKE_WEIGHT/2,
       STROKE_WEIGHT/2,
       mouseX-(STROKE_WEIGHT/2),
       mouseY-(STROKE_WEIGHT/2));
  //top-right ellipse
  ellipse(mouseX+(STROKE_WEIGHT/2),
          mouseY-(STROKE_WEIGHT/2),
          width-(STROKE_WEIGHT/2),
          STROKE_WEIGHT/2);

  //bottom-left rect
  fill(bottomColor);
  rect(STROKE_WEIGHT/2,
       height-(STROKE_WEIGHT/2),
       mouseX-(STROKE_WEIGHT/2),
       mouseY+(STROKE_WEIGHT/2)); 
  //bottom-right ellipse
  ellipse(mouseX+(STROKE_WEIGHT/2),
          mouseY+(STROKE_WEIGHT/2),
          width-(STROKE_WEIGHT/2),
          height-(STROKE_WEIGHT/2));

}

/**
* Called when the user presses the mouse button.
* This will change the shape colour to white
*/
void mousePressed() {
  shapeColour = color(random(COLOR_CODE_LIMIT));
  
  bgColor = color(random(COLOR_CODE_LIMIT),
                  random(COLOR_CODE_LIMIT),
                  random(COLOR_CODE_LIMIT));
                  
  upperColor = color(random(COLOR_CODE_LIMIT),
                     random(COLOR_CODE_LIMIT),
                     random(COLOR_CODE_LIMIT));
                     
  bottomColor = color(random(COLOR_CODE_LIMIT),
                      random(COLOR_CODE_LIMIT),
                      random(COLOR_CODE_LIMIT));
}
