final color WHITE = color(255);
final color ORANGE = color(255, 165, 0);

float r;
float x;
float dx;

void setup() {
  size(500, 500, P2D);
  r = 50;
  x = r/2;
  dx = 5;
}

void draw() {
  background(WHITE);
  rectMode(CENTER);
  fill(ORANGE);
  rect(x, height/2, r, r);
  if (x+r/2 >= width-1) {
    x = r/2;
  }
  x = x + dx;
}
