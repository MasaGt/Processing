/**
* This class reporesents a bouncing ball.
* This class detects if the ball hittng the boundaries, updates the ball position,
* and renders the ball.
*/
class Ball {
  final float WEIGHT = 3; //constant variable for thickness of the outline
  final color BLACK = color(0,0,0);
  final color GREEN = color(0,255,0);
  
  float x, y;  //x and y positions
  float r;  //radius
  color ballColor;
  float dx, dy;  //velosity to x and y directions
  Ball partner; //the other ball
  
  Ball(float rInit, float dxInit, float dyInit) {
    //initialize a ball with parameters
    r = rInit;
    ballColor = color(random(256), random(256), random(256));
    dx = dxInit;
    dy = dyInit;
    
    //the entier ball needs to be drawn
    x = random(r+WEIGHT, width-(r+WEIGHT+1));
    y = random(r+WEIGHT, height-(r+WEIGHT+1));
    partner = null;
  }

  void move() {
    //update the position of a ball
    x += dx;
    y += dy;
    bounce();
  }
  
  void moveTogether(Ball otherBall) {
    //update the positions of the two balls at a time
    x += dx;
    y += dy;
    otherBall.x += otherBall.dx;
    otherBall.y += otherBall.dy;
    bounce();
  }
  
  void bounce() {
    //check if a ball hit the boundaries.
    if (this.partner == null) { //<>//
      if (hitRightEdge(this) || hitLeftEdge(this)) {
        //hit x boundaries
        xBounce();
      }
      if (hitTopEdge(this) || hitBottomEdge(this)) {
        //hit y boundaries
        yBounce();
      } //<>//
    } else {
      if (hitRightEdge(partner) || hitLeftEdge(partner) || hitRightEdge(this) || hitLeftEdge(this)) {
        //hit x boundaries
        xBounce();
      }
      if (hitTopEdge(partner) || hitBottomEdge(partner) || hitTopEdge(this) || hitBottomEdge(this)) {
        //hit y boundaries
        yBounce();
      }
    }
  }  
  
  void render() {
    if (partner == null) {
      //non sticked ball: 3 pixel wide outline and 50% darker shade of the fill colour for the outline
      strokeWeight(WEIGHT);
      stroke(lerpColor(ballColor, BLACK, 0.5));
    } else {
      //sticked balls: 50% darker green and no outline
      ballColor = lerpColor(GREEN, BLACK, 0.5);
      noStroke();
    }
    fill(ballColor);
    
    ellipse(x, y, r*2, r*2);
  }
  
  void stickTo(Ball otherBall) {
    //set a partner and other way around
    this.partner = otherBall;
    otherBall.partner = this;
  }
  
  void setAverageVelosity() {
    //set the average velosity of the two balls.
    HashMap<String, Float> velosity = calcVelosity();
    dx = velosity.get("dx");
    dy = velosity.get("dy");    
    partner.dx = dx;
    partner.dy = dy;
  }
  
  boolean collide(Ball otherBall) {
    //check if the balls collide each other.
    //if the balls already sticked, no need run the distance calculation.
    if (this.partner != null) return true;
    return dist(x,
                y,
                otherBall.x,
                otherBall.y) <= (r + otherBall.r);
  }
  
  void xBounce() {
    //bounce a ball toward x direction //<>//
    this.dx *= -1;
    if (partner != null) {
      partner.dx = dx;
    }
  }
  
  void yBounce() {
    //bounce a ball toward y direction //<>//
    this.dy *= -1;
    if (partner != null) {
      partner.dy = dy;
    }
  }
  
  HashMap<String, Float> calcVelosity() {
    //calculate the average velosity
    HashMap<String, Float> velosity = new HashMap<>();
    velosity.put("dx", (dx + partner.dx) / 2);
    velosity.put("dy", (dy + partner.dy) / 2);
    return velosity;
  }
  
  boolean hitRightEdge(Ball ball) {
    //check it a ball hit right boundary
    float rightEdge = ball.x + ball.r;
    return (rightEdge >= width - 1 && ball.dx > 0);
  }
  
  boolean hitLeftEdge(Ball ball) {
    //check it a ball hit left boundary
    float leftEdge = ball.x - ball.r;
    return (leftEdge <= 0 && ball.dx < 0);
  }
  
  boolean hitTopEdge(Ball ball) {
    //check it a ball hit top boundary
    float topEdge = ball.y - ball.r;
    return (topEdge <= 0 && ball.dy < 0);
  }
  
  boolean hitBottomEdge(Ball ball) {
    //check it a ball hit bottom boundary
    float bottomEdge = ball.y + ball.r;
    return (bottomEdge >= height - 1 && ball.dy > 0);
  }
}
