PImage bg;

void setup() {
    size(800, 600, P2D);
    bg = loadImage("http://creativetechnologies.aut.ac.nz/coding/processing/grass.jpg");
}

void draw() {
  //ellipse(250, 250, mouseX, mouseY);
  //background(200);
  background(bg);
  ellipse(mouseX, mouseY, 40, 40);
}
