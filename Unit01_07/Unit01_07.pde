//void setup() {
//  size(500, 500);
//  background(200);
//  noFill();
//  triangle(10, 10, 250, 490, 490, 10);
//  triangle(80, 153, 160, 10, 240, 153);
//  triangle(241, 153, 326, 10, 417, 153);
//  triangle(157, 310, 241, 153, 341, 310);
//}

void setup() {
  size(500, 500, P2D);
  background(200);
  noFill();
  triangle(0,0, width/2, height-1, width-1, 0);
  triangle(width/6, height/3, width/3, 0, width/2, height/3);
  triangle(width/2, height/3, 4*width/6, 0, 5*width/6, height/3);
  triangle(width/3, 2*height/3, width/2, height/3, 2*width/3, 2*height/3);
}
