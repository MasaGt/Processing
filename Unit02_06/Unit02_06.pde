void setup() {
  size(500, 500, P2D);
}

void draw() {
  background(255);
  strokeWeight(10);
  fill(map(mouseX+mouseY, 0, width+height, 0, 255),
       map(mouseX+mouseY, 0, width+height, 0, 255),
       map(mouseX+mouseY, 0, width+height, 0, 255));
  stroke(250,255,15);
  rect(0, 0, (mouseX+mouseY)/5, (mouseX+mouseY)/5);
}
