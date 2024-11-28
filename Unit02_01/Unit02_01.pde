int c_width = 100;
int c_height = 100;
void setup() {
  size(500, 500, P2D);
}

void draw() {
  background(200);
  
  //middle
  ellipseMode(CENTER);
  ellipse(width/2, height/2, c_width, c_height);

  ellipseMode(CORNER);
  //upper-left
  ellipse(0,0, c_width, c_height);
  //upper-right
  ellipse(width-c_width-1, 0, c_width, c_height);
  //lower-left
  ellipse(0, height-c_height-1, c_width, c_height);
  //lower-right
  ellipse(width-c_width-1, height-c_height-1, c_width, c_height);
}
