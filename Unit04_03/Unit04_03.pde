float x;
float y;
float alpha;
float dAlpha;

void setup() {
  size(500,500,P2D);
  smooth();
  dAlpha = -0.02;
}

void draw() {
  background(255);
  noStroke();
  float a = map(alpha,0,1,0,255);
  
  fill(0,0,255, a);
  ellipse(x,y,150,150);
  alpha += dAlpha;
  alpha = constrain(alpha,0,1);
  if ((alpha == 0) || (alpha == 1)) {
    dAlpha*=-1;
  }
}

void mousePressed() {
  x = mouseX;
  y = mouseY;
  alpha = 1;
}
