/**
* This class represents the sticked ball as one.
* This class moves, bounces as one unit.
*/
class StickedBalls {
  private ArrayList<Ball> balls;
  final color GREEN = color(0,255,0);
  final color BLACK = color(0,0,0);
  
  StickedBalls() {
    balls = new ArrayList<>();
  }
  
  //add the sticked ball in the style of 50% darker green.
  void addBall(Ball ball) {
    ball.ballColor = lerpColor(GREEN, BLACK, 0.5); //50% darker green
    balls.add(ball);
  };
  
  //update the positoin of two sticked balls.
  void update(){
    //dx and dy are the average of dxes and dyes of the sticked balls
    HashMap<String, Float> velosities = getAvgVelosities();
    float dx = velosities.get("dx");
    float dy = velosities.get("dy");
    
    //apply the average of dx and dy to all the sticked balls
    for (Ball ball: balls) {
      ball.x += dx;
      ball.y += dy;
      
      //check if any of the sticked ball hit the walls
      if (ball.touchXBoundary()) {
        xBounce();
        continue;
      }
      
      if (ball.touchYBoundary()) {
        yBounce();
        continue;
      }
    }
  }
  
  //render the two sticked balls.
  void render() {
    for (Ball ball: balls) {
      fill(ball.ballColor);
      noStroke();
      ellipse(ball.x, ball.y, ball.r*2, ball.r*2);
    }
  }
  
  //bounce the sticked balls towards to x coordinate
  void xBounce() {
    for (Ball ball : balls) {
      ball.dx *= -1;
    }
  }
  
  //bounce the sticked balls towards to y coordinate
  void yBounce() {
    for (Ball ball : balls) {
      ball.dy *= -1;
    }
  }
  
  //calculate the velosity of the two balls.
  HashMap<String, Float> getAvgVelosities() {
    float dx = 0;
    float dy = 0;
    HashMap<String, Float> velosities = new HashMap<>();
    
    if (balls.size() == 0) {
      velosities.put("dx", dx);
      velosities.put("dy", dy);
      return velosities;
    }
    
    //adding up dx and dy
    for (Ball ball: balls){
      dx += ball.dx;
      dy += ball.dy;
    }
    
    dx = dx / balls.size();
    velosities.put("dx", dx);
    dy = dy / balls.size();
    velosities.put("dy", dy);
    
    return velosities;
  }
 
}
