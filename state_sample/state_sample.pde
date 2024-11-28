int current;
final int INTRO = 0;
final int START = 1;
final color WHITE = color(255);
int count = 0;

PImage bg;

void setup() {
  size(800, 600, P2D);
  bg = loadImage("grass.jpg");
  current = INTRO;
  noFill();
}

void draw() { 
  switch(current) {
    case INTRO: introDraw(); break;
    case START: startDraw(); break;
  }
}

void keyPressed() {
  switch(current) {
    case INTRO: introKeyPress(); break;
  }
}
