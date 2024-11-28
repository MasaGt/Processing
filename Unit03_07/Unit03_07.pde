final color WHITE = color(255);
final color ORANGE = color(255, 165,0);
PImage imgFoot;
PImage imgFish;
float y;
float dy;

void setup() {
  size(500, 500, P2D);
  imgFoot = loadImage("foot.png");
  imgFish = loadImage("fish.png");
  y = -250;
  dy = 1;
}

void draw() {
  background(WHITE);
  image(imgFish, mouseX, 295);
  image(imgFoot, 0, y);
  y = y + dy;
}
