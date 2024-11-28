float x;
float y;
float w;
float h;

void setup() {
  size(500,500,P2D);
  w = 100;
  h = 100;
  x = width/2 - w/2;
  y = height/2 - h/2;
}

void draw() {
  background(255);
  noStroke();
  fill(200,0,0);
  rect(x,y,w,h);
}

void mouseDragged() {
  if (pointInRect(mouseX, mouseY, x, y, w, h)){
    x += mouseX - pmouseX;
    y += mouseY- pmouseY;
  } 
}

boolean pointInRect (float xP, float yP, float xC, float yC, float w, float h) {
  return (xP <= xC+w && xP >= xC) && (yP <= yC + h && yP >= yC);
}

//boolean pointInCircle(float xPoint, float yPoint, float xCircle, float yCircle, float r) {
//  return (dist(xPoint, yPoint, xCircle, yCircle) <= r);
//}
