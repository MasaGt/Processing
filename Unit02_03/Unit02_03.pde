void setup(){
  size(500,500, P2D);
}

void draw(){
  
  ellipse(mouseX, mouseY, 10, 10);
  ellipse(mouseX, width-mouseY, 10, 10);
}
