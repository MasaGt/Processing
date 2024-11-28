final color WHITE = color(255);
final color ORANGE = color(255, 165, 0);

float x, y, r, dx, dy, rightEdge, leftEdge, topEdge, bottomEdge;
boolean isDragged;

void setup() {
  size(500,500,P2D);
  x = 250;
  y = 250;
  r = 25;
  dx = 0;
  dy = 0;
  isDragged = false;
}

void draw() {
  x += dx;
  y += dy;
  
  rightEdge = x - r;
  leftEdge = x + r;
  topEdge = y - r;
  bottomEdge = y + r;
  
  //collision detection
  if ((rightEdge <= 0) && (dx < 0)|| (leftEdge >= width - 1) && (dx > 0)) {
    dx = -dx;
  } 
  if ((topEdge <= 0) && (dy < 0) || (bottomEdge >= height - 1) && (dy > 0)) {
    dy = -dy;
  }
  
  background(WHITE);
  noStroke();
  fill(ORANGE);
  ellipse(x,y,r*2,r*2);
}

void mousePressed() {
  if (pointInCircle(mouseX, mouseY, x, y, r) && mouseButton == RIGHT) {
    isDragged = true;
    dx = 0;
    dy = 0;
  }
}

void mouseDragged() {
  if (isDragged) {
    dx = 0;
    dy = 0;
    x += mouseX - pmouseX;
    y += mouseY - pmouseY;
  }
}

void mouseReleased() {
  if (isDragged) {
    dx = mouseX - pmouseX;
    dy = mouseY - pmouseY;
    isDragged = false;
  }
}

boolean pointInCircle(float xP, float yP, float xC, float yC, float r) {
  return (dist(xP, yP, xC, yC) <= r);
}
