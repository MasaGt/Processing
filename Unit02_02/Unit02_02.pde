void setup() {
  size(500, 500, P2D);
}

void draw() {
  background(200);
  
  noFill();
  ellipse(width/2, height/2, mouseX, mouseY);
  rectMode(CENTER);
  rect(width/2, height/2, mouseX, mouseY);
}
