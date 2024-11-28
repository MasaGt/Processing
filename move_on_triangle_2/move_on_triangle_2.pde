float cX, lX, rX;
float cY, lY, rY;
float dotX, dotY;
float r;

final color WHITE = color(255);
final int TO_RIGHT = 1;
final int TO_CENTER = 2;
final int TO_LEFT = 3;
int direction;


void setup() {
  size(500, 500, P2D);
  noFill();
  
  //center x and y of triangle
  cX = 250;
  cY = 50;
  
  //right x and y of triangle
  rX = 450;
  rY = 250;
  
  //left x and y of triangle
  lX = 50;
  lY = 250;
  
  //setup a dot
  dotX = lX;
  dotY = lY;
  r = 10;
  direction = TO_RIGHT;
}

void draw() {
  background(WHITE);
  triangle(cX, cY, rX, rY, lX, lY);
  ellipse(dotX, dotY, r*2, r*2);
  
  float toX = 0;
  float toY = 0;
  if (direction == TO_RIGHT) {
    toX = rX;
    toY = rY;
} else if (direction == TO_CENTER) {
    toX = cX;
    toY = cY;
  } else if (direction == TO_LEFT) {
    toX = lX;
    toY = lY;
  }
  
  if (reached(toX, toY)) {
  }
  dotX += calcDx();
  dotY += calcDy();
}

float calcDx() {
  float _dx = 0;
  float _dist = 0;
  if (direction == TO_RIGHT) {
    _dist = dist(lX, lY, rX, rY);
    _dx = ((rX - lX) / (_dist / 5));
    //_dx = ((rX - fromX) / (_dist / 5));
  } else if (direction == TO_CENTER) {
    _dist = dist(cX, cY, rX, rY);
    _dx = ((cX - rX) / (_dist / 5));
  } else if (direction == TO_LEFT) {
    _dist = dist(cX, cY, lX, lY);
    _dx = ((lX - cX) / (_dist / 5));
    //_dx = ((lX - fromX) / (_dist / 5));
  }
  
  return _dx;
}

float calcDy() {
  float _dy = 0;
  float _dist = 0;
  if (direction == TO_RIGHT) {
    _dist = dist(lX, lY, rX, rY);
    _dy = ((rY - lY) / (_dist / 5));
    //_dy = ((rY - fromY) / (_dist / 5));
  } else if (direction == TO_CENTER) {
    _dist = dist(rX, rY, cX, cY);
    _dy = ((cY - rY) / (_dist / 5));
    //_dy = ((cY - fromY) / (_dist / 5));
  } else if (direction == TO_LEFT) {
    _dist = dist(cX, cY, lX, lY);
    _dy = ((lY - cY) / (_dist / 5));
    //_dy = ((lY - fromY) / (_dist / 5));
  }
  
  return _dy;
}

boolean reached(float toX, float toY) {
  if (direction == TO_RIGHT) {
    if (dotX >= toX && calcDx() > 0) {
      println("hit right corner");
      println("dotX: " + dotX + ", dotY: " + dotY + ", rX: " + rX + ", rY: " + rY);
      direction = TO_CENTER;
      //direction = TO_LEFT;
      return true;
    }
  } else if (direction == TO_CENTER) {
    if ((dotX <= toX || dotY <= toY)) {
      println("hit center corner");
      println("dotX: " + dotX + ", dotY: " + dotY + ", cX: " + cX + ", cY: " + cY);
      direction = TO_LEFT;
      return true;
    }
  } else if (direction == TO_LEFT) {
    if ((dotX <= toX || dotY >= toY) && calcDx() < 0 && calcDy() > 0) {
      println("hit left corner");
      println("dotX: " + dotX + ", dotY: " + dotY + ", lX: " + lX + ", lY: " + lY);
      direction = TO_RIGHT;
      return true;
    }
  }
  
  return false;
}
