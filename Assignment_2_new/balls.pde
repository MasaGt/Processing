class BallUnit {
  private ArrayList<Ball> balls;  
  BallUnit() {
    balls = new ArrayList<>();
  }
  
  void addBall(Ball ball) {
     balls.add(ball);
  }
  
  int size() {
    return balls.size();
  }
  
  void collide() {
    for (int i = 0; i <= balls.size() - 1; i++) {
      for (int k = i + 1; k <= balls.size() - 1; k++) {
        ball1 = balls.get(i);
        ball2 = balls.get(k);
        if (ballsTouching(ball1, ball2)) {
          ball1.setStick(ball2);
          ball2.setStick(ball1);
        }
      }
    }
  }
  
  void update() {
    for (Ball ball: balls) {
      ball.update();
    }
  }
  
  void render() {
    //collision check
    collide();
    for (Ball ball: balls) {
      fill(ball.ballColor);
      stroke(lerpColor(ball.ballColor, color(0,0,0), 0.5));
      ellipse(ball.x, ball.y, ball.r*2, ball.r*2);
    }
  }
  
  boolean ballsTouching(Ball ball1, Ball ball2) {
    return dist(ball1.x, ball1.y, ball2.x, ball2.y) <= (ball1.r + ball2.r);
  }
}
