final color WHITE = color(255);
final color ORANGE = color(255, 165, 0);

float y;
float dy;
float r;
PImage fishImg;

void setup() {
  size(500, 500, P2D);
  r = 25;
  y = height - 1 - r;
  dy = 5;
  fishImg = loadImage("fish.png");
}

void draw() {
  background(WHITE);
  fill(ORANGE);
  if (y - r >= 0) {
    ellipse(width/2, y, r*2, r*2);
    y = y - dy;
  } else {
    image(fishImg, width/2 - r, y);
  }
    
}
