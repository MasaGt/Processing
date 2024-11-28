void setup() {
  size(500, 500);
}


void draw() {
  background(200);
  triangle(mouseX-40, mouseY+40, mouseX, mouseY, mouseX+40, mouseY+40);
}
