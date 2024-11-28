final color WHITE = color(255);
final color GREEN = color(0, 255,0);
final color RED = color(255, 0,0);
float redY;
float greenY;
float redX;
float greenX;
float r;
float dy;
float dx;

void setup() {
  size(500, 500, P2D);
  r = 25;
  redY = r;
  redX = r;
  greenY = height-1-r;
  greenX = width-1-r;
  dy = 5;
  dx = 5;
}

void draw() {
  background(WHITE);
  fill(GREEN);
  ellipse(greenX, greenY, r*2, r*2);
  fill(RED);
  ellipse(redX, redY, r*2, r*2);
  greenY = greenY - dy;
  greenX = greenX - dx;
  redY = redY + dy;
  redX = redX + dx;
  //if ((y + r) >= (height - 1) || (y - r <= 0)) {
  //  dy *= -1;
  //}
}
