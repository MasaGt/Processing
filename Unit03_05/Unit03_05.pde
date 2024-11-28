final color WHITE = color(255);
final color GREEN = color(0, 255,0);
final color RED = color(255, 0,0);
float redY;
float greenY;
float r;
float dy;

void setup() {
  size(500, 500, P2D);
  r = 25;
  redY = height/2 + r;
  greenY = height/2 - r;
  dy = 5;
}

void draw() {
  background(WHITE);
  fill(GREEN);
  ellipse(width/2, greenY, r*2, r*2);
  fill(RED);
  ellipse(width/2, redY, r*2, r*2);
  greenY = greenY - dy;
  redY = redY + dy;
  //if ((y + r) >= (height - 1) || (y - r <= 0)) {
  //  dy *= -1;
  //}
}
