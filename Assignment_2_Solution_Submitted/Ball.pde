/**
* This class reporesents a bouncing ball.
* This class detects if the ball hittng boundaries, updates the ball position,
* and renders the ball.
*/
class Ball {
  float x, y; //x and y positions (coordinates)
  float r; //radisu
  color ballColor;
  float dx, dy; //velosity to x and y directions
  float weight; //stroke weight
  final color BLACK = color(0,0,0); //a color to darken the color of the outline.
  
  /*
  * initiate a ball with the following parameters.
  * @param rInit radisu
  * @param weightInit thickness of the outline
  * @param colorCodeLimit the limit of color code
  * @param dxInit velosity to x coordinate
  * @param dyInit velosity to y coordinate
  */
  Ball(float rInit, float weightInit, float colorCodeLimit, float dxInit, float dyInit) {
    r = rInit;
    weight = weightInit;
    dx = dxInit;
    dy = dyInit;
    ballColor = color(random(colorCodeLimit), random(colorCodeLimit), random(colorCodeLimit));
    
    //the entier ball needs to be drawn
    x = random(r+weight, width-(r+weight+1));
    y = random(r+weight, height-(r+weight+1));
  }
  
  void update() {
    x += dx;
    y += dy;
    bounce();
  }
  
  void render() {
    fill(ballColor);
    //50% darker shade of the fill colour for the outline
    stroke(lerpColor(ballColor, BLACK, 0.5)); 
    ellipse(x, y, r*2, r*2);
  }
  
  //if a ball touches the boundaries, bounce it.
  void bounce() {
    if (touchXBoundary()) {
      dx *= -1;
    }
    
    if (touchYBoundary()) {
      dy *= -1;
    }
  }
  
  /* 
  * check it a ball hit the right and left walls.
  * return true if a ball hits the walls.
  */
  boolean touchXBoundary() {
    float rightEdge = x - r;
    float leftEdge = x + r;
    return ((rightEdge <= 0) || (leftEdge >= width - 1));
  }
  
  /*
  * check it a ball hit the top and bottom walls.
  * return true if a ball hits the walls.
  */
  boolean touchYBoundary() {
    float topEdge = y - r;
    float bottomEdge = y + r;
    return ((topEdge <= 0) || (bottomEdge >= height - 1));
 }
}
