/**
* This class manages independent (non sticked) balls and sticked balls.
* Also, this class detect a ball collision.
*/
class BallManager {
  private ArrayList<Ball> independentBalls; //The balls that does not sticks to any ball.
  private StickedBalls stickedBalls; //the sticked balls as one unit.
  
  BallManager() {
    independentBalls = new ArrayList<>();
    stickedBalls = new StickedBalls();
  }
  
  void addBall(Ball ball) {
     independentBalls.add(ball);
  }
  
  /*
  * check if a ball collides the other ball.
  * if collision is detected, remove them from independentBalls,
  * and add them to stickedBalls.
  */
  void collide() {
    for (int i = 0; i < independentBalls.size(); i++) {
      for (int k = i + 1; k < independentBalls.size(); k++) {
        Ball ball1 = independentBalls.get(i);
        Ball ball2 = independentBalls.get(k);
        if (isBallsTouching(ball1, ball2)) {
          stickedBalls.addBall(ball1);
          stickedBalls.addBall(ball2);          
          independentBalls.remove(independentBalls.indexOf(ball1));
          independentBalls.remove(independentBalls.indexOf(ball2));
        }
      }
    }
  }
  
  void update() {
    //update the position of the independent balls
    for (Ball ball: independentBalls) {
      ball.x += ball.dx;
      ball.y += ball.dy;
      ball.bounce();
    }
    //update the position of sticked balls
    stickedBalls.update();
  }
  
  void render() {
    //collision check
    //once the balls stick, collide does not check collision
    collide();
    //render the independent balls
    for (Ball ball: independentBalls) {
      fill(ball.ballColor);
      stroke(lerpColor(ball.ballColor, color(0,0,0), 0.5));
      ellipse(ball.x, ball.y, ball.r*2, ball.r*2);
    }
    //render the sticked balls
    stickedBalls.render();
  }
  
  //check the distance between the balls
  boolean isBallsTouching(Ball ball1, Ball ball2) {
    return dist(ball1.x, ball1.y, ball2.x, ball2.y) <= (ball1.r + ball2.r);
  }
}
