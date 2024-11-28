final color WHITE = color(255);
final color ORANGE = color(255, 165, 0);

float y;
float dy;
float r;

void setup() {
  size(500, 500, P2D);
  y = height/2;
  dy = 5;
  r = 25;
}

void draw() {
  background(WHITE);
  fill(ORANGE);
  ellipse(width/2, y, r*2, r*2);
  
  if (y+r >= height-1) {
    dy *= -1;
  } else if (y-r <= 0) {
    dy *= -1;
  }
  y = y + dy;
}
