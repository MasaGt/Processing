class Ball {
    float x, y;
    float r;
    color ballColor;
    float dx, dy;
    float weight;
    boolean isStick;
    ArrayList<Ball> otherBalls;
    
    Ball(float rInit, float weightInit, float colorCodeLimit) {
      r = rInit;
      weight = weightInit;
      x = random(r+weight, width-(r+weight));
      y = random(r+weight, height-(r+weight));
      ballColor = color(random(colorCodeLimit), random(colorCodeLimit), random(colorCodeLimit));
      dx = random(-5, 6);
      dy = random(-5, 6);
      
      otherBalls = new ArrayList<>();
    }
    
    void update() {
      if (!isStick) {
        x += dx;
        y += dy;
        bounce();
      } else {
        dx = getAvgDy();
        x += dx;
        y += dy;
        for (Ball ball : otherBalls) {
          x += dx;
          y += dy;
          if (ball.touchX()) {
            xBounce();
            continue;
          }
          
          if (ball.touchY()) {
            yBounce();
            continue;
          }
        }
      }
    }
    
    void updateWIthOtherBall(Ball _otherBall) {
      x += dx;
      y += dy;
      _otherBall.x += dx;
      _otherBall.y += dy;
      
      if ((x - r <= 0)
          || (x + r >= width - 1)
          ) {
        dx *= -1;
        _otherBall.dx = dx;
      }
      
      if ((_otherBall.x - _otherBall.r <= 0)
          || (_otherBall.x + _otherBall.r >= width - 1)) {
            _otherBall.dx *= -1;
            dx = _otherBall.dx;
      }
      if ((y - r <= 0)
          || (y + r >= height - 1)
         ) {
        dy *= -1;
        _otherBall.dy = dy;
      }
      
      if ((_otherBall.y - _otherBall.r <= 0)
          || (_otherBall.y + _otherBall.r >= height - 1)
         ) {
        _otherBall.dy *= -1;
        dy = _otherBall.dy;
      }
    }
    
    void render() {
      fill(ballColor);
      if (!isStick) {
        stroke(lerpColor(ballColor, color(0,0,0), 0.5));
      } else {
        noStroke();
      }
      
      ellipse(x, y, r*2, r*2);
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
    
    void xBounce() {
      for (Ball ball : otherBalls) {
        ball.dx *= -1;
      }
    }
    
    void yBounce() {
      for (Ball ball : otherBalls) {
        ball.dy *= -1;
      }
    }
    
    void stick(Ball _otherBall) {
      dx = (dx + _otherBall.dx) / 2;
      _otherBall.dx = dx;
      
      dy = (dy + _otherBall.dy) / 2;
      _otherBall.dy = dy;
    }
    
    boolean touchX() {
      float rightEdge = x - r;
      float leftEdge = x + r;
      return ((rightEdge <= 0) || (leftEdge >= width - 1));
    }
    
    boolean touchY() {
      float topEdge = y - r;
      float bottomEdge = y + r;
      return ((topEdge <= 0) || (bottomEdge >= height - 1));
    }
    
    void setStick(Ball ball) {
      otherBalls.add(ball);
      isStick = true;
    }
    
    float getAvgDx() {
      if (otherBalls.size() == 0) {
        return dx;
      }
      
      float dxSum = dx;
      for (Ball ball: otherBalls){
        dxSum += ball.dx;
      }
      
      return dxSum/(otherBalls.size()+1);
  }
  
  float getAvgDy() {
    if (otherBalls.size() == 0) {
      return dy;
    }
    
    float dySum = dy;
    for (Ball ball: otherBalls){
      dySum += ball.dy;
    }
    
    return dySum/(otherBalls.size()+1);
  }
}
