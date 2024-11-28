
float dotX, dotY;
float dotR;

float x, y; //mouse clicked point
float r; // with and hight of a rectangle

Rectangle rectangle;

boolean dragged;
boolean isPlay;

final color WHITE = color(255);

void setup() {
  size(500, 500, P2D);
  rectMode(CENTER);
  noFill();
  background(WHITE);
  isPlay = false;
}

void  draw() {
  if(isPlay && (rectangle != null)) {
    background(WHITE);
    rectangle.draw();
  }
}

void mousePressed() {
  x = mouseX;
  y = mouseY;
}

void mouseDragged() {
  dragged = true;
  r = dist(x, y, mouseX, mouseY);
  background(WHITE);
  rect(x, y, r, r);
}

void mouseReleased() {
  if (dragged) {
    background(WHITE);
    r = dist(x, y, mouseX, mouseY);
    rectangle = new Rectangle(x, y, r);
    dragged = false;
  }
}

void keyPressed() {
  if (key == ENTER) {
    isPlay = !isPlay;
  }
}
