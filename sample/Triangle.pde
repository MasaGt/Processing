class Triangle extends Shape {
  float cX, rX, lX; // x positions for center, right, left corners.
  float cY, rY, lY; // y positions for center, right, left corners.
  
  Triangle(float cX, float cY, float rX, float rY, float lX, float lY, AudioSample sound) {
    super(lX, lY); // pass dot's x and y position
    this.cX = cX;
    this.cY = cY;
    this.rX = rX;
    this.rY = rY;
    this.lX = lX;
    this.lY = lY;
    this.sound = sound;
    
    //set dot, direction, dx, dy
    dot.direction = Dot.TO_RIGHT;
    dot.dx = calcDx();
    dot.dy = calcDy();
  }
  
  void play() {
    drawShape();
    dot.drawDot();
    
    float toX = 0; // x of the corner of a triangle where a dot goes to.
    float toY = 0; // y of the corner of a triangle where a dot goes to.
    if (dot.direction == Dot.TO_RIGHT) {
      toX = rX;
      toY = rY;
    } else if (dot.direction == Dot.TO_CENTER) {
      toX = cX;
      toY = cY;
    } else if (dot.direction == Dot.TO_LEFT) {
      toX = lX;
      toY = lY;
    }
    
    if (dot.ReachedTriangleCorner(toX, toY)) {
      hitSound();
      dot.dx = calcDx();
      dot.dy = calcDy();
    }
  }
  
  void drawShape() {
    triangle(cX, cY, rX, rY, lX, lY);
  }
  
  float calcDx() {
    float _dx = 0;
    float dist = 0;
    if (dot.direction == Dot.TO_RIGHT) {
      dist = dist(rX, rY, lX, lY);
      _dx = ((rX - lX) / (dist/5));
    } else if (dot.direction == Dot.TO_CENTER) {
      dist = dist(lX, lY, cX, cY);
      _dx = ((lX - cX) / (dist/5));
    } else if (dot.direction == Dot.TO_LEFT) {
      dist = dist(cX, cY, rX, rY);
      _dx = ((cX - rX) / (dist/5));
    }
    return _dx;
  }
  
  float calcDy() {
    float _dy = 0;
    float dist = 0;
    if (dot.direction == Dot.TO_RIGHT) {
      dist = dist(rX, rY, lX, lY);
      _dy = ((lY - rY) / (dist/5));
    } else if (dot.direction == Dot.TO_CENTER) {
      dist = dist(lX, lY, cX, cY);
      _dy = ((cY - lY) / (dist/5));
    } else if (dot.direction == Dot.TO_LEFT) {
      dist = dist(cX, cY, rX, rY);
      _dy = ((lY - cY) / (dist/5));
    }
    return _dy;
  }
}
