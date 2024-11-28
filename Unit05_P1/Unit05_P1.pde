final color ORANGE = color(255, 165, 0);
final color RED = color(255, 0, 0);
final color WHITE = color(255);

float x;
float y;
float r;
float dx;
float dy;
color ballColor;

void setup() {
  size(500,500,P2D);
  smooth();
  x = width/2;
  y = height/2;
  r = 25;
  dx = 1;
  dy = 2;
  ballColor = ORANGE;
}

void draw() {
  background(WHITE);
  
  noStroke();
  fill(ballColor);
  ellipse(x,y,r*2,r*2);
  
  x += dx;
  y += dy;
  
  if ((x-r <= 0) && (dx < 0)) {
    dx = -dx;
  }
  
  if ((x+r >= width-1) && (dx > 0)) {
    dx = -dx;
  }
  
  if ((y-r <= 0) && (dy < 0)) {
    dy = -dy;
  }
  
  if ((y+r >= height-1) && (dy > 0)) {
    dy = -dy;
  }
  
  if (dist(mouseX, mouseY, x, y) <= r) {
    ballColor = RED;
  }
}
