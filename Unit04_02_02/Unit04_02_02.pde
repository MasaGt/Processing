float x;
float y;
float r;

void setup() {
  size(500,500,P2D);
  x = width/2;
  y = height/2;
  r = 60;
}

void draw() {
  background(255);
  noStroke();
  fill(200,0,0);
  ellipse(x,y,r*2,r*2);
}

void mouseDragged() {
  
  if (pointInCircle(mouseX,mouseY,x,y,r)){
    x = constrain(x,r,width-r);
    x += mouseX - pmouseX;
    y = constrain(y,r,height-r);
    y += mouseY- pmouseY;
  } 
}

boolean pointInCircle(float xPoint, float yPoint, float xCircle, float yCircle, float r) {
  return (dist(xPoint, yPoint, xCircle, yCircle) <= r);
}
