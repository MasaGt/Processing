void setup() {
  size(500, 500, P2D);
}

void draw() {
  //background(200);
  
  ellipse(mouseX,mouseY,10,10);
  ellipse(width-mouseX,mouseY,10,10);
  ellipse(mouseX,height-mouseY,10,10);
  ellipse(width-mouseX,height-mouseY,10,10);
}
