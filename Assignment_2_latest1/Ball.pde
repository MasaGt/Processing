final color BLACK = color(0,0,0);
final color GREEN = color(0,255,0);
class Ball {
  float x, y;  //x and y positions
  float r;  //radisu
  color ballColor;
  float dx, dy;  //velosity to x and y directions
  float weight;  //stroke weight
  Ball otherBall; //the array of the balls that sticks to this ball.
  
  //to de deleted
  String name;
  
  Ball(float rInit, float colorCodeLimit, float dxInit, float dyInit, float weightInit) {
    r = rInit;
    weight = weightInit;
    ballColor = color(random(colorCodeLimit), random(colorCodeLimit), random(colorCodeLimit));
    dx = dxInit;
    dy = dyInit;
    
    //the entier ball needs to be drawn
    x = random(r+weight, width-(r+weight+1));
    y = random(r+weight, height-(r+weight+1));
    otherBall = null;
  }
  
  Ball(float rInit, float colorCodeLimit, float dxInit, float dyInit, float weightInit, String nameInit) {
    r = rInit;
    weight = weightInit;
    ballColor = color(random(colorCodeLimit), random(colorCodeLimit), random(colorCodeLimit));
    dx = dxInit;
    dy = dyInit;
    
    //the entier ball needs to be drawn
    x = random(r+weight, width-(r+weight+1));
    y = random(r+weight, height-(r+weight+1));
    otherBall = null;
    name = nameInit;
  }
  
  void update() {
    if (!isStickingToTheOtherBall()) {
      x += dx;
      y += dy;
      bounce();
    } else {
      //calc the average velosity between this ball and the other ball.
      HashMap<String, Float> velosities = calcAvgVelosity(); 
      //apply the average velosity to both balls.
      dx = velosities.get("dx");
      dy = velosities.get("dy");
      otherBall.dx = dx;
      otherBall.dy = dy;
      
      x += dx;
      y += dy;
      bounceAsSticked();
    }    
  }
  
  void bounce() {
    float rightEdge = x - r;
    float leftEdge = x + r;
    float topEdge = y - r;
    float bottomEdge = y + r;
    
    //collision detection
    if ((rightEdge <= 0) || (leftEdge >= width - 1)) {
      dx *= -1;
    }
    if ((topEdge <= 0) || (bottomEdge >= height - 1)) {
      dy *= -1;
    }
  }  
  
  void bounceAsSticked(){
    float rightEdge = x - r;
    float leftEdge = x + r;
    float topEdge = y - r;
    float bottomEdge = y + r;
    if ((rightEdge <= 0) || (leftEdge >= width - 1)) {
      dx *= -1;
      otherBall.dx = dx;
    }
    
    //if ((otherBall.x - otherBall.r <= 0)
    //    || (otherBall.x + otherBall.r >= width - 1)) {
    //      otherBall.dx *= -1;
    //      dx = otherBall.dx;
    //}
    
    if ((topEdge <= 0) || (bottomEdge >= height - 1)) {
      dy *= -1;
      otherBall.dy = dy;
    }
    
    //if ((otherBall.y - otherBall.r <= 0)
    //    || (otherBall.y + otherBall.r >= height - 1)) {
    //      otherBall.dy *= -1;
    //      dy = otherBall.dy;
    //}
  }
  
  void render() {
    fill(ballColor);
    if (!isStickingToTheOtherBall()) {
      stroke(lerpColor(ballColor, BLACK, 0.5));
    } else {
      ballColor = lerpColor(GREEN, BLACK, 0.5);
      noStroke();
    }
    
    ellipse(x, y, r*2, r*2);
  }
  
  boolean collide(Ball _otherBall) {
    return dist(x,
                y,
                _otherBall.x,
                _otherBall.y)
                <= (r + _otherBall.r
                );
  }
  
  void setOtherBall(Ball ball) {
    otherBall = ball;
  }
  
  boolean isStickingToTheOtherBall() {
    return otherBall != null;
  }
  
  HashMap<String, Float> calcAvgVelosity() {
    HashMap<String, Float> velosities = new HashMap<>();
    if (!isStickingToTheOtherBall()) {
      velosities.put("dx",dx);
      velosities.put("dy",dx);
      return velosities;
    }
    
    float avgDx = (dx + otherBall.dx)/2;
    velosities.put("dx",avgDx);
    
    float avgDy = (dy + otherBall.dy)/2;
    velosities.put("dy",avgDy);
    
    return velosities;
  }
}
