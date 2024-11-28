abstract class Shape {
  AudioSample sound;
  float startingPoint;
  Dot dot;
  
  Shape(float x, float y) {
    this.dot = new Dot(x, y);
  }
  
  abstract void play();
  abstract void drawShape();
  
  void hitSound() {
    this.sound.trigger();
  }
}
