class Rectangle {
  float rtX, rbX, ltX, lbX;
  float rtY, rbY, ltY, lbY;
  float x, y;
  float r;
  
  Dot dot;
  
  Rectangle(float centerX, float centerY, float r) {
    this.x = centerX;
    this.y = centerY;
    this.r = r;
    setVertecies(centerX, centerY, r);
    
    this.dot = new Dot(ltX, ltY);
    this.dot.direction = Dot.TO_DOWN;
  }
  
  void setVertecies(float x, float y, float r) {
    this.ltX = x - r/2;
    this.ltY = y - r/2;
    
    this.lbX = x - r/2;
    this.lbY = y + r/2;
    
    this.rtX = x + r/2;
    this.rtY = y - r/2;
    
    this.rbX = x + r/2;
    this.rbY = y + r/2;

  }
  
  void draw() {
    noFill();
    rect(x,y,r,r);
    println("dx: " + calcDx());
    println("dy: " + calcDy());
    this.dot.move(calcDx(), calcDy());
    if (reachRectCorner()) {
      println("hit the corner");
    }
  }
  
  float calcDx() {
    float _dx = 0;
    float _dist = 0;
    if (dot.direction == Dot.TO_DOWN) {
      _dist = dist(ltX, ltY, lbX, lbY);
      _dx = ((lbX - ltX) / (_dist / 5));
    } else if (dot.direction == Dot.TO_RIGHT) {
      _dist = dist(lbX, lbY, rbX, rbY);
      _dx = ((rbX - lbX) / (_dist / 5));
    } else if (dot.direction == Dot.TO_UP) {
      _dist = dist(rbX, rbY, rtX, rtY);
      _dx = ((rtX - rbX) / (_dist / 5));
    } else if (dot.direction == Dot.TO_LEFT) {
      _dist = dist(rtX, rtY, ltX, ltY);
      _dx = ((rtX - ltX)/ (_dist / 5));
    }
    
    return _dx;
  }
  
  float calcDy() {
    float _dy = 0;
    float _dist = 0;
    if (dot.direction == Dot.TO_DOWN) {
      _dist = dist(ltX, ltY, lbX, lbY);
      _dy = ((lbY - ltY) / (_dist / 5));
    } else if (dot.direction == Dot.TO_RIGHT) {
      _dist = dist(lbX, lbY, rbX, rbY);
      _dy = ((rbY - lbY) / (_dist / 5));
    } else if (dot.direction == Dot.TO_UP) {
      _dist = dist(rbX, rbY, rtX, rtY);
      _dy = ((rtY - rbY) / (_dist / 5));
    } else if (dot.direction == Dot.TO_LEFT) {
      _dist = dist(rtX, rtY, ltX, ltY);
      _dy = ((rtY - ltY)/ (_dist / 5));
    }
    return _dy;
  }
  
  boolean reachRectCorner() {
    println("check");
    if (dot.direction == Dot.TO_DOWN) {
      if (lbY <= dot.y && dot.dy > 0) {
        dot.direction = Dot.TO_RIGHT;
        return true;
      }
    } else if (dot.direction == Dot.TO_RIGHT) {
      if (rbX <= dot.x && dot.dx > 0) {
        dot.direction = Dot.TO_UP;
        return true;
      }
    } else if (dot.direction == Dot.TO_UP) {
      if (rtY >= dot.y && dot.dy < 0) {
        dot.direction = Dot.TO_LEFT;
        return true;
      }
    } else if (dot.direction == Dot.TO_LEFT) {
      if (ltX >= dot.x && dot.dx < 0) {
        dot.direction = Dot.TO_DOWN;
        return true;
      }
    }
    return false;
  }
}
