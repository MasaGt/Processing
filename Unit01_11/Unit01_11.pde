void setup() {
  size(500, 500);
}

void draw() {
  background(200);
  stroke(255, 0, 0);
  line(0, 0, mouseX, mouseY);
  stroke(0, 255, 0);
  line(500, 0, mouseX, mouseY);
  stroke(0, 0, 255);
  line(0, 500, mouseX, mouseY);
  stroke(255, 255, 255);
  line(500, 500, mouseX, mouseY);
}
