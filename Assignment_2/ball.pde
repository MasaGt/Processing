class Ball {
    float x, y;
    float r;
    color ballColor;
    float dx, dy;
    float weight;
    boolean isStick;
    
    Ball(float rInit, float weightInit, float colorCodeLimit) {
      r = rInit;
      weight = weightInit;
      x = random(r+weight, width-(r+weight));
      y = random(r+weight, height-(r+weight));
      ballColor = color(random(colorCodeLimit), random(colorCodeLimit), random(colorCodeLimit));
      dx = random(-5, 6);
      dy = random(-5, 6);
    }
    
    Ball(float xInit, float yInit, color colorInit, float dxInit, float dyInit, float rInit, float weightInit) {
      x = xInit;
      y = yInit;
      ballColor = colorInit;
      dx = dxInit;
      dy = dyInit;
      r = rInit;
      weight = weightInit;
    }
    
    void update() {
      x += dx;
      y += dy;
      bounce();
    }
    
    void updateWIthOtherBall(Ball _otherBall) {
      x += dx;
      y += dy;
      _otherBall.x += dx;
      _otherBall.y += dy;
      
      println("------------stick------------------");
      println("dx:" + dx + " dy:" + dy);
      
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
      //stroke(
      //  color(
      //    red(ballColor)/2,
      //    green(ballColor)/2,
      //    blue(ballColor)/2
      //  )
      //);
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
    
    boolean collide(Ball _otherBall) {      
      return dist(x,
                  y,
                  _otherBall.x,
                  _otherBall.y) <= (r + _otherBall.r);
    }
    
    void stick(Ball _otherBall) {
      //dx = 0;
      //_otherBall.dx = 0;
      dx = (dx + _otherBall.dx) / 2;
      _otherBall.dx = dx;
      
      //dy = 0;
      //_otherBall.dy = 0;
      dy = (dy + _otherBall.dy) / 2;
      _otherBall.dy = dy;
    }
}
