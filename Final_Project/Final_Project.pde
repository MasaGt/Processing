ArrayList<Shape> shapes;
Shape currentShape;
float startPointX;
float startPointY;
float endPointX;
float endPointY;
void setup() {
  size(500, 500, P2D);
  ellipseMode(CORNER);
  rectMode(CORNER);
  currentShape = new Circle();
  background(255);
}

void draw() {
  
}

void mouseClicked() {
  if( mouseButton == LEFT){
    println("set starting point");
    startPointX = mouseX;
    startPointY = mouseY;
  } else if (mouseButton == RIGHT) {
    println("choose sound");
  }
}

void mouseReleased() {
}
