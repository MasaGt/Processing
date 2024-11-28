import controlP5.*;

ControlP5 cp5;

void startSetup() {
  cp5 = new ControlP5(this);
}

void startDraw() {
  
  if (count == 0) {
    println("hi");
    background(WHITE);
    count++;
  }
  triangle(width/2, height/2, 50, 400, 450, 400);
}
