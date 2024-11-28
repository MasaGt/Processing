final color WHITE = color(255);
final color ORANGE = color(255, 165,0);
float x;
float r;
float dx;

void setup() {
  size(500, 500, P2D);
  x = width-1-r;
  r = 25;
  dx = 5;
}

void draw() {
  background(WHITE);
  fill(ORANGE);
  ellipse(x, height/2, r*2, r*2);
  x = x - dx;
  //if ((y + r) >= (height - 1) || (y - r <= 0)) {
  //  dy *= -1;
  //}
}
