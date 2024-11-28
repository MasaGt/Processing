class Circle extends Shape {
  float x;
  float y;
  float r;
  float angle;
  Circle(float x, float y, float r, AudioSample sound) {
    super((x + r * - cos(0)), (y + r * sin(0)));
    this.x = x;
    this.y = y;
    this.r = r;
    this.angle = 0;
    this.sound = sound;
  }
  
  void play() {
    drawShape();
    dot.drawDot(angle, x, y, r);
    //this.angle += 0.05;
    this.angle += 5/r;
    if (this.circulate()) {
      this.hitSound();
    }
  }
  
  void drawShape() {
    ellipse(x, y, 2*r, 2*r);
  }
  
  boolean circulate() {
    if (angle >= (2 * PI)) {
      angle %= (2 * PI);
      return true;
    }
    return false;
  }
}
