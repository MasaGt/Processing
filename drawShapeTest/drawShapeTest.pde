
float x;
float y;

int type = 0;
float dist;

void setup(){
  size(500, 500, P2D);
  noFill();
}

void draw(){
}

void mousePressed(){
  x = mouseX;
  y = mouseY;
}

void mouseDragged(){
  dist = dist(x, y, mouseX, mouseY);
  fill(color(0,100,100));
  if(type == 0){
    ellipse(x, y, 2*dist, 2*dist);
  } else if (type == 1) {
    rect(x, y, dist, dist);
  } else if (type == 2) {
    float distX = sqrt(sq(x - mouseX));
    float anotherX = (mouseX < x) ? (x + distX) : (x - distX);
    triangle(x, y, mouseX, mouseY, anotherX, mouseY);
  } else if (type == 3) {
    line(x, y, mouseX, mouseY);
  }
}

void keyPressed(){
  if(key == 'e'){
    type = 0;
  }
  else if(key == 'r'){
    type = 1;
  } else if (key == 't') {
    type = 2;
  } else if (key == 'l') {
    type = 3;
  } 
}
