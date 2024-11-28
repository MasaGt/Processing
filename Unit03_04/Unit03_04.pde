final color WHITE = color(255);
final color ORANGE = color(255, 165,0);
float y;
float r;
float dy;

void setup() {
  size(500, 500, P2D);
  r = 25;
  y = height - r - 1;
  dy = 5;
}

void draw() {
  background(WHITE);
  line(width/2, y, width/2, y + r + 100);
  fill(ORANGE);
  ellipse(width/2, y, r*2, r*2);
  y = y - dy;
  //if ((y + r) >= (height - 1) || (y - r <= 0)) {
  //  dy *= -1;
  //}
}
