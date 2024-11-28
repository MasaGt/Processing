import controlP5.*;

ControlP5 cp5;

DropdownList d1, d2;
final float FONT_SIZE = 48;
String[] labels;
String[] shapes;
String currentSound;
String currentShape;

void setup() {
  size(700, 700,P2D);
  labels = new String[7];
  labels[0] = "Bass";
  labels[1] = "Crash";
  labels[2] = "HighTom";
  labels[3] = "MidTom";
  labels[4] = "FloorTom";
  labels[5] = "HiHat";
  labels[6] = "RideCymbal";
 
  shapes = new String[3];
  shapes[0] = "Circle";
  shapes[1] = "Rectangle";
  shapes[2] = "Triangle";
  
  cp5 = new ControlP5(this);
  d1 = cp5.addDropdownList("Select Drum")
          .setPosition(10, 10)
          .setSize(100, 200)
          .setItemHeight(50)
          .setBarHeight(50)
          .addItems(labels)
          .close();
 d2 = cp5.addDropdownList("Select Shape")
          .setPosition(150, 10)
          .setSize(100, 200)
          .setItemHeight(50)
          .setBarHeight(50)
          .addItems(shapes)
          .close();
}

void draw() {
  //background(128);
}

void controlEvent(ControlEvent theEvent) {
  if (theEvent.isController()) {
    int index = (int) theEvent.getController().getValue(); 
    if (theEvent.getController() == d1) {
      println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
      currentSound = labels[index];
      println("Selected Item:" + currentSound);
      d1.updateDisplayMode(DropdownList.DROPDOWN);
      d1.close();
    } else if (theEvent.getController() == d2) {
      println("event from controller : "+theEvent.getController().getValue()+" from "+theEvent.getController());
      currentShape = shapes[index];
      println("Selected Item:" + currentShape);
      d2.open();
    }
  }
}
