float x1;
float y1;
float x2;
float y2;
float r;

void setup() {
  size(500,500,P2D);
  x1 = width/2;
  y1 = height/2;
  x2 = r;
  y2=r;
  r = 60;
}

void draw() {
  background(255);
  noStroke();
  fill(200,0,0);
  ellipse(x1,y1,r*2,r*2);
  
  fill(0,200,0,120);
  ellipse(x2,y2,r*2,r*2);
}

void mouseDragged() {
  if (pointInCircle(mouseX,mouseY,x1,y1,r)){
    x1 += mouseX - pmouseX;
    y1 += mouseY- pmouseY;
  } 
  
  if (pointInCircle(mouseX,mouseY,x2,y2,r)){
    x2 += mouseX - pmouseX;
    y2 += mouseY- pmouseY;
  } 
}

boolean pointInCircle(float xPoint, float yPoint, float xCircle, float yCircle, float r) {
  return (dist(xPoint, yPoint, xCircle, yCircle) <= r);
}
