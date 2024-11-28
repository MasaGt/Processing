class Dot {
  
  float x, y;
  float dx, dy;
  float r;
  int direction;
  
  static final int STOP = 0;
  static final int TO_UP = 1;
  static final int TO_DOWN = 2;
  static final int TO_RIGHT = 3;
  static final int TO_LEFT = 4;
  static final int TO_CENTER = 5;
  
  Dot (float x, float y) {
    this.x = x;
    this.y = y;
    r = 10;
    dx = 0;
    dy = 0;
    direction = STOP;
  }
  
  void drawDot(float angle, float circleX, float circleY, float circleR) {
    x = circleX + circleR * -cos(angle);
    y = circleY + circleR * sin(angle);
    ellipse(x, y, r*2, r*2);
  }
  
  void drawDot() {
    move();
    ellipse(x, y, r*2, r*2);
  }
  
  void move() {
    x += dx;
    y += dy;
  };
  
  float getX() {
    return this.x;
  }
  
  float getY() {
    return this.y;
  }
  
  boolean ReachedTriangleCorner(float toX, float toY) {
  if (direction == TO_RIGHT) {
    if (x >= toX) {
      direction = TO_CENTER;
      return true;
    }
  } else if (direction == TO_CENTER) {
    if (x <= toX || y <= toY) {
      direction = TO_LEFT;
      return true;
    }
  } else if (direction == TO_LEFT) {
    if (x <= toX || y >= toY) {
      direction = TO_RIGHT;
      return true;
    }
  }
  
  return false;
 }
 
 boolean reachLineEdge(float toX, float toY) {
   if (this.direction == TO_RIGHT) {
     if (this.x >= toX && this.dx > 0) {
       this.direction = TO_LEFT;
       return true;
     }
   } else if (this.direction == TO_LEFT) {
     if (this.x <= toX && this.dx < 0) {
       this.direction = TO_RIGHT;
       return true;
     }
   } else if (this.direction == TO_UP) {
     if (this.y <= toY && this.dy < 0) {
       this.direction = TO_DOWN;
       return true;
     }
   } else if (this.direction == TO_DOWN) {
     if (this.y >= toY && this.dy > 0) {
       this.direction = TO_UP;
       return true;
     }
   }
   
   return false;
 }
}
