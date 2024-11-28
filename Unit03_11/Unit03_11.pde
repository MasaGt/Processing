final color WHITE = color(255);
final color ORANGE = color(255, 165, 0);

float y;
float dy;

void setup() {
  size(500, 500, P2D);
  y = 0;
  dy = 1;
}

void draw() {
  background(WHITE);
  fill(ORANGE);
  ellipse(width/2, y, 20,20);
  dy = map(mouseY, 0, height-1, 0, 10);
  y = y + dy;
}
