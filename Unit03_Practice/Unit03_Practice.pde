final color WHITE = color(255);
final color ORANGE = color(255, 165,0);
//PImage imgFoot;
//PImage imgFish;
float y;
float r;
float dy;

void setup() {
  size(500, 500, P2D);
  //imgFoot = loadImage("foot.png");
  //imgFish = loadImage("fish.png");
  y = 50;
  r = 25;
  dy = 5;
}

void draw() {
  background(WHITE);
  //image(imgFish, 200, 295);
  //image(imgFoot, 0, y);
  fill(ORANGE);
  ellipse(width/2, y, r*2, r*2);
  y = y + dy;
  if ((y + r) >= (height - 1) || (y - r <= 0)) {
    dy *= -1;
  }
}
