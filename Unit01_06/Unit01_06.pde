void setup() {
  size(500, 500);
}

void draw() {
  background(200);
  fill(255,0, 0);
  ellipse(250, 250, mouseX+50, 50);
  
  fill(0, 255, 0);
  ellipse(250, 250, 50, mouseY+50);
}
