final color WHITE = color(255);
final color ORANGE = color(255, 165,0);
float x;
float y;
float r;
float dx;
float dy;

void setup() {
  size(500, 500, P2D);
  r = 25;
  x = r;
  y = r;
  dx = 5;
  dy = 5;
}

void draw() {
  background(WHITE);
  fill(ORANGE);
  ellipse(x, y, r*2, r*2);
  x = x + dx;
  y = y + dy;
  //if ((y + r) >= (height - 1) || (y - r <= 0)) {
  //  dy *= -1;
  //}
}
