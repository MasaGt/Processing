import controlP5.*;
import ddf.minim.*;
Minim minim;
float x, y; // x, y position when a mouse is clicked
float r; // radisu/length for circlie/rectangle/line to draw.
float xP;
ArrayList<Shape> shapes;
boolean isPlay;
boolean dragged;
final color WHITE = 255;
ControlP5 cp5;
DropdownList d1, d2;
AudioSample[] sounds;
String[] soundLabels;
String[] shapeLabels;
AudioSample currentSound;
String currentShape;
void setup(){
  size(500, 500, P2D);
  noFill();
  shapes = new ArrayList<>();
  isPlay = false;
  dragged = false;
  rectMode(RADIUS);
  background(WHITE);
  smooth();
  minim = new Minim(this);
  cp5 = new ControlP5(this);
  setSoundList();
  setShapeList();
  loadSoundFiles();
  currentSound = sounds[0];
  currentShape = "Circle";
}

void draw(){
  if (isPlay) {
    playShapes();
  }
}

void mousePressed(){
  x = mouseX;
  y = mouseY;
}

void mouseDragged(){
  if (isPlay) {
    return;
  }
  drawShapes();
  r = dist(x, y, mouseX, mouseY);
  
  //ellipse(x, y, 2*r, 2*r);
  //rect(x, y, r, r);
  //line(x, y, mouseX, mouseY);
  xP = getX();
  drawShape();
  //triangle(x, y, mouseX, mouseY, xP, mouseY);
  dragged = true;
}

void mouseReleased() {
  if (isPlay || !dragged) {
    return;
  }
  println("released mouseX: " + mouseX);
  addShape();
  //shapes.add(new Circle(x, y, r));
  //shapes.add(new Line(x, y, mouseX, mouseY));
  //shapes.add(new Triangle(x, y, mouseX, mouseY, xP, mouseY));
  dragged = false;
}

void keyPressed () {
  if (key == ENTER) {
    isPlay = !isPlay;
  }
  if (!isPlay) {
    if (key == BACKSPACE) {
      //remove a shape that added last time.
      if (shapes.size() > 0) {
        shapes.remove(shapes.size() - 1);
        drawShapes();
      }
    }
  }
}  

// get opposite x
float getX() {
  float distX = sqrt(sq(x - mouseX));
  float xP = (x > mouseX) ? (x + distX) : (x - distX);
  return xP;
}

void setSoundList() {
  soundLabels = new String[8];
  soundLabels[0] = "Bass";
  soundLabels[1] = "Crash";
  soundLabels[2] = "HighTom";
  soundLabels[3] = "MidTom";
  soundLabels[4] = "FloorTom";
  soundLabels[5] = "Hi-Hat";
  soundLabels[6] = "RideCymbal";
  soundLabels[7] = "Snare";
  
  d1 = cp5.addDropdownList("Select Drum")
          .setPosition(10, 10)
          .setSize(100, 200)
          .setItemHeight(50)
          .setBarHeight(50)
          .addItems(soundLabels)
          .close();
}

void setShapeList() {
  shapeLabels = new String[4];
  shapeLabels[0] = "Circle";
  shapeLabels[1] = "Rectangle";
  shapeLabels[2] = "Triangle";
  shapeLabels[3] = "Line";
  
  d2 = cp5.addDropdownList("Select Shape")
          .setPosition(150, 10)
          .setSize(100, 200)
          .setItemHeight(50)
          .setBarHeight(50)
          .addItems(shapeLabels)
          .close();
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isController()) {
    int index = (int) theEvent.getController().getValue(); 
    if (theEvent.getController() == d1) {
      println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
      currentSound = sounds[index];
      println("Selected Item:" + currentSound);
      drawShapes();
    } else if (theEvent.getController() == d2) {
      println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
      currentShape = shapeLabels[index];
      println("Selected Item:" + currentShape);
      drawShapes();
    }
  }
}

void addShape() {
  switch (currentShape) {
    case "Circle":
      addCircle();
      break;
    case "Rectangle":
      addRectangle();
      break;
    case "Triangle":
      addTriangle();
      break;
    case "Line":
      addLine();
      break;
  }
}

void addCircle() {
  shapes.add(new Circle(x, y, r, currentSound));
}

void addRectangle() {
  shapes.add(new Rectangle(x, y, r, currentSound));
}

void addTriangle() {
  if (x == mouseX || y == mouseY) {
    return;
  }
  
  float rX, lX;
  if (mouseX <= xP) {
    rX = xP;
    lX = mouseX;
  } else {
    rX = mouseX;
    lX = xP;
  }
  shapes.add(new Triangle(x, y, rX, mouseY, lX, mouseY, currentSound));
  //shapes.add(new Triangle(x, y, mouseX, mouseY, xP, mouseY, currentSound));
}

void addLine() {
  float lX, lY, rX, rY;
  if (x == mouseX && y > mouseY) {
    lX = mouseX;
    lY = mouseY;
    rX = x;
    rY = y;
  } else if (x == mouseX && y < mouseY) {
    lX = x;
    lY = y;
    rX = mouseX;
    rY = mouseY;
  } else if (x < mouseX) {
    lX = x;
    lY = y;
    rX = mouseX;
    rY = mouseY;
  } else {
    lX = mouseX;
    lY = mouseY;
    rX = x;
    rY = y;
  }
  shapes.add(new Line(lX, lY, rX, rY, currentSound));
}


void loadSoundFiles() {
  sounds = new AudioSample[8];
  for (int i = 0; i < soundLabels.length; i++) {
    sounds[i] = minim.loadSample(soundLabels[i] + ".mp3");
  }
}

void drawShape() {
  switch (currentShape) {
    case "Circle":
      ellipse(x, y, 2*r, 2*r);
      break;
    case "Rectangle":
      rect(x, y, r, r);
      break;
    case "Triangle":
      triangle(x, y, mouseX, mouseY, xP, mouseY);
      break;
    case "Line":
      line(x, y, mouseX, mouseY);
      break; 
  }
}

void drawShapes() {
  background(WHITE);
  for (Shape shape : shapes) {
    shape.drawShape();
  }
}

void playShapes() {
  background(WHITE);
  for (Shape shape : shapes) {
    shape.play();
  }
}
