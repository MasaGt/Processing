void setup() {
  size(400, 400);
}

void draw() {
  background(200);
  fill(255, 0, 0);
  rect(mouseX, 200, 40, 40);
  fill(0, 255, 0);
  rect(200, mouseY, 40, 40);
}
