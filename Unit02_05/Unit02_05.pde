void setup() {
  size(500, 500, P2D);
}

void draw() {
  background(255);
  strokeWeight(10);
  fill(183,2,234);
  stroke(250,255,15);
  rect(0, 0, (mouseX+mouseY)/5, (mouseX+mouseY)/5);
}
