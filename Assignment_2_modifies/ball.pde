final color BLACK = color(0,0,0);
final color GREEN = color(0,255,0);
class Ball {
  float x, y;  //x and y positions
  float r;  //radisu
  color ballColor;
  float dx, dy;  //velosity to x and y directions
  float weight;  //stroke weight
  boolean isStick; //false if ball does not collide, otherwise true.
  ArrayList<Ball> otherBalls; //the array of the balls that sticks to this ball.
  
  //target to delete
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
    isStick = false;
    otherBalls = new ArrayList<>();
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
    isStick = false;
    otherBalls = new ArrayList<>();
    name = nameInit;
  }
  
  void update() {
    if (!isStick) {
      x += dx;
      y += dy;
      bounce();
    } else {
      println("size: " + otherBalls.size());
      HashMap<String, Float> velosities = calcAvgVelosity(); 
      dx = velosities.get("dx");
      dy = velosities.get("dy");
      
      x += dx;
      y += dy;
      for (Ball ball : otherBalls) {
        ball.dx = dx;
        ball.dy = dy;
      }
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
      dx *= -1; //<>//
      for (Ball ball : otherBalls) {
        ball.dx *= -1;
      }
    }
    if ((topEdge <= 0) || (bottomEdge >= height - 1)) {
      dy *= -1; //<>//
      for (Ball ball : otherBalls) {
        ball.dy *= -1;
      }
    }
  }
  
  void render() {
    fill(ballColor);
    if (!isStick) {
      stroke(lerpColor(ballColor, BLACK, 0.5));
    } else {
      //ballColor = lerpColor(GREEN, BLACK, 0.5);
      noStroke();
    }
    
    ellipse(x, y, r*2, r*2);
  }
  
  void setStick(Ball ball) {
    if (!otherBalls.contains(ball)) {
      propagate(otherBalls, ball);
      otherBalls.add(ball);
      isStick = true;
    }
  }
  
  HashMap<String, Float> calcAvgVelosity() {
    HashMap<String, Float> velosities = new HashMap<>();
    if (!isStick) {
      velosities.put("dx",dx);
      velosities.put("dy",dx);
      return velosities;
    }
    
    float newDx = dx;
    float newDy = dy;
    for (Ball ball : otherBalls) {
      newDx += ball.dx;
      newDy += ball.dy;
    }
    float avgDx = newDx/(otherBalls.size()+1);
    velosities.put("dx",avgDx);
    
    float avgDy = newDy/(otherBalls.size()+1);
    velosities.put("dy",avgDy);
    
    return velosities;
  }
  
  void propagate(ArrayList<Ball> otherBalls, Ball hitBall) {
    for (Ball ball1 : hitBall.otherBalls) {
      for(Ball ball2 : otherBalls) {
        if (!ball1.otherBalls.contains(ball2)) {
          ball1.otherBalls.add(ball2);
        }
      }
    }
    
    for (Ball ball3 : otherBalls) {
      for (Ball ball4 : hitBall.otherBalls) {
        if (!ball4.otherBalls.contains(ball3)) {
          ball4.otherBalls.add(ball3);
        }
      }
    }
  }
  
}
