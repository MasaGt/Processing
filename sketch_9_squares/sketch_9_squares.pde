//void setup() {
//  size(400, 400, P2D);
//  background(200);
  
//  int y = 20;
  
//  for(int i = 0; i < 3; i += 1){
//    int x = 20;
//    noFill();
//    rect(x, y, 30, 30);

//    noFill();
//    x += 30;
//    rect(x, y, 30, 30);
    
//    noFill();
//    x += 30;
    
//    rect(x, y, 30, 30);
    
//    y += 30;
//  }
//}

void setup() {
  size(500, 500, P2D);
  noFill();
}

void draw() {
  rect(0, 0, width-1, height-1);
  rect(width/3, 0, width/3, height-1);
  rect(0, height/3, width-1, height/3);
}
