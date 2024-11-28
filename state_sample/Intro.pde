void introDraw() {
  background(bg);
  //background(WHITE);
  //textAlign(CENTER, CENTER);
  //textSize(32);
  //fill(0, 408, 612);
  //text("Press Enter to start App", width/2, height/2);
  //text("Press Space to see Tutorial", width/2, height/2 + 50);
}

void introKeyPress() {
  if (key == ENTER) {
    current = START;
    startSetup();
  }
}
