class BallsManager {
  private ArrayList<Ball> balls;
  
  BallsManager() {
    balls = new ArrayList<>();
  }
  
  void addBall(Ball ball) {
     balls.add(ball);
  }
  
  int size() {
    return balls.size();
  }
  
  boolean collide(Ball _ball, Ball _otherBall) {
    return dist(_ball.x,
                _ball.y,
                _otherBall.x,
                _otherBall.y)
                <= (_ball.r + _otherBall.r
                );
  }
  
  void detectCollision() {
    for (int i = 0; i < balls.size(); i++ ) {
      for (int k = i + 1; k < balls.size(); k++) {
        Ball ball1 = balls.get(i);
        Ball ball2 = balls.get(k);
        if (collide(ball1, ball2)) {
          ball1.setStick(ball2);
          ball2.setStick(ball1);
        }
      }
    }
  }
  
  void update() {
    for (Ball ball : balls) {
      ball.update();
    }
  }
  
  void render() {
    detectCollision();
    for (Ball ball : balls) {
      ball.render();
    }
  }
}
