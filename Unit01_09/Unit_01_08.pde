PImage bg;

void setup() {
  size(800, 600, P2D);
  bg = loadImage("grass.jpg");
}

void draw() {
  background(bg);
  fill(255,0, 0);
  ellipse(400, 300, mouseX+50, 50);
  
  fill(0, 255, 0);
  ellipse(400, 300, 50, mouseY+50);
}
