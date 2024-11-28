class Line extends Shape {
  float lX, lY;
  float rX, rY;
  float r;
  Line(float lX, float lY, float rX, float rY, AudioSample sound) {
    super(lX, lY);
    this.lX = lX;
    this.lY = lY;
    this.rX = rX;
    this.rY = rY;
    this.sound = sound;
    
    //set up a dot's direction.
    this.dot.direction = (lX != rX) ? Dot.TO_RIGHT : Dot.TO_DOWN;
  }
  
  void play() {
    drawShape();
    dot.drawDot();
    float toX = (this.dot.direction == Dot.TO_RIGHT) ? rX : lX;
    float toY = (this.dot.direction == Dot.TO_DOWN) ? rY : lY;
    if (this.dot.reachLineEdge(toX, toY)) {
      hitSound();
    }
    
    this.dot.dx = calcDx();
    this.dot.dy = calcDy();
    
    
  }
  
  void drawShape() {
    line(lX, lY, rX, rY);
  }
  
  float calcDx() {
    float _dx = 0;
    float _dist = dist(rX, rY, lX, lY);;
    if (this.dot.direction == Dot.TO_RIGHT) {
      _dx = ((rX - lX) / (_dist / 5));
    } else if (this.dot.direction == Dot.TO_LEFT) {
      _dx = ((lX - rX) / (_dist / 5));
    }
    
    return _dx;
  }
  
  float calcDy() {
    float _dy = 0;
    float _dist = dist(rX, rY, lX, lY);
    if (this.dot.direction == Dot.TO_RIGHT
        || this.dot.direction == Dot.TO_DOWN) {
      _dy = ((rY - lY) / (_dist / 5));
    } else if (this.dot.direction == Dot.TO_LEFT
               || this.dot.direction == Dot.TO_UP) {
      _dist = dist(lX, lY, rX, rY);
      _dy = ((lY - rY) / (_dist / 5));
    }
    
    return _dy;
  }
}
