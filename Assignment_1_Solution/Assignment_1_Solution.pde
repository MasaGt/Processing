/**
* COMP570 Programming for Creativity 2202 S1
* Assignment - Start Code
* This program draws two ellipses and two rectangles
* that changes its shape via mouse movement.
* Each shape is touching two edges of the canvas and other shapes.
* When a mouse is clicked, the color of top shapes, the bottom shapes, 
* and the background changes randomly. The outline also change its color
* romdomly in gray scale.
*
* @author Masaomi Goto, Student ID# 19075459
* version 1,0 - 18/3/2022: Created
* version 1,1 - 22/3/2022: Changed variable type of STROKE_WEIGHT to float
*/

color shapeColour = color(0); // global variable for the shape colour; start "black"
color upperColor = color(0, 0, 255); // global variable for the upper shapes; start "blue"
color bottomColor = color(0, 255, 0); // global variable for the bottom shapes; start "green"
color bgColor = color(255, 255, 255); // global variable for background; start "white"
final float STROKE_WEIGHT = 7; // constant variable for thickness of the outline;
final int COLOR_CODE_LIMIT = 256; // constant variable for the limit of color code for random()

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
  //the setting for drawing shapes;
  background(bgColor);
  strokeWeight(STROKE_WEIGHT);
  stroke(shapeColour);
  rectMode(CORNERS);
  ellipseMode(CORNERS);
  
  //draw upper shapes
  fill(upperColor);
  //top-left rect
  rect(STROKE_WEIGHT/2,
       STROKE_WEIGHT/2,
       mouseX,
       mouseY);
  //top-right ellipse
  ellipse(mouseX,
          mouseY,
          width-(STROKE_WEIGHT/2),
          STROKE_WEIGHT/2);

  
  //draw bottom shapes
  fill(bottomColor);
  //bottom-left rect
  rect(STROKE_WEIGHT/2,
       height-(STROKE_WEIGHT/2),
       mouseX,
       mouseY); 
  //bottom-right ellipse
  ellipse(mouseX,
          mouseY,
          width-(STROKE_WEIGHT/2),
          height-(STROKE_WEIGHT/2));
}

/**
* Called when the user presses the mouse button.
* This will change the shape, ouotline and background colour randomly
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
