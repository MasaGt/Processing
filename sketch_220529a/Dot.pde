class Dot {
  
  static final int STOP = 0;
  static final int TO_DOWN = 1;
  static final int TO_UP = 2;
  static final int TO_RIGHT = 3;
  static final int TO_LEFT = 4;
  
  int direction;
  float x, y;
  float dx, dy;
  
  Dot (float x, float y) {
    this.direction = STOP;
    this.x = x;
    this.y = y;
    this.dx = 0;
    this.dy = 0;
  }
  
  void move(float dx, float dy) {
    x += dx;
    y += dy;
    fill(255,0,0);
    ellipse(x, y, 20, 20);
  }
}
