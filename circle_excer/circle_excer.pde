float x, y, r;
float l;
float angle;
float dotX, dotY;
float dx, dy;

void setup() {
  size(500, 500, P2D);
  x = 255;
  y = 255;
  r = 100;
  angle = 0;
  dotX = x + r * -cos(angle);
  dotY = y + r * sin(angle);
  //rectMode(CENTER);
  noFill();
}

void draw() {
  background(255);
  ellipse(x, y, 2*r, 2*r);
  
  dotX = x + r * -cos(angle);
  dotY = y + r * sin(angle);
  ellipse(dotX, dotY, 20, 20);
  //circulate();
  angle += 0.05;
  if (angle >= (2*PI)) {
    println("circulate");
    angle = 0;
  }
  
  //ellipse(xP, yP, 20, 20);
}

//boolean circulate() {
//  float originalX = x + r * -cos(0);
//  float originalY = y + r * sin(0);
//  if (dotX == originalX && dotY == originalY) {
//    println("back to the proginal coordinate");
//    return true;
//  }
  
//  return false;
//}
