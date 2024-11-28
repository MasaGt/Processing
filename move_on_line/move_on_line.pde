float rX, lX;
float rY, lY;
float dx, dy;
float r;
float dotX, dotY;

final int TO_RIGHT = 1;
final int TO_LEFT = 2;
int direction;

final color WHITE = color(255);
void setup() {
  size(500, 500, P2D);
  noFill();
  
  lX = (width/2) - 200;
  //lY = height/2; // horizontal
  //rY = height/2 + 100; // slanted toward right
  rY = height/2 - 100; // slanted toward left
  
  rX = (width/2) + 200;
  //rY = height/2; // horizontal
  //lY = height/2 - 100; // slanted toward right
  lY = height/2 + 100; // slanted toward left
  
  dotX = lX;
  dotY = lY;
  r = 10;
  dx = calcDx();
  dy = calcDy();
  direction = TO_RIGHT;
}

void draw() {
  background(WHITE);
  line(rX, rY, lX, lY);
  ellipse(dotX, dotY, r*2, r*2);
  
  float toX = (direction == TO_RIGHT) ? rX : lX;
  reached(toX);
  
  //update ellipse position
  dotX += calcDx();
  dotY += calcDy();
}


float calcDx() {
  float _dx = 0;
  float _dist;
  if (direction == TO_RIGHT) {
    _dist = dist(rX, rY, lX, lY);
    _dx = ((rX - lX) / (_dist / 5));
  } else if (direction == TO_LEFT) {
    _dist = dist(lX, lY, rX, rY);
    _dx = ((lX - rX) / (_dist / 5));
  }
  
  return _dx;
}

float calcDy() {
  float _dy = 0;
  float _dist = 0;
  if (direction == TO_RIGHT) {
    _dist = dist(rX, rY, lX, lY);
    _dy = ((rY - lY) / (_dist / 5));
  } else if (direction == TO_LEFT) {
    _dist = dist(lX, lY, rX, rY);
    _dy = ((lY - rY) / (_dist / 5));
  }
  
  return _dy;
}

boolean reached(float toX) {
  if (direction == TO_RIGHT) {
    if (dotX >= toX && calcDx() > 0) {
      direction = TO_LEFT;
      println("reached right point dotX: " + dotX + ", dotY: " + dotY + ", rX: " + rX + ", rY: " + rY);
      return true;
    }
  } else if (direction == TO_LEFT) {
    if (dotX <= toX && calcDx() < 0) {
      println("reached left point dotX: " + dotX + ", dotY: " + dotY + ", lX: " + lX + ", lY: " + lY);
      direction = TO_RIGHT;
      return true;
    }
  }
  
  return false;
}
