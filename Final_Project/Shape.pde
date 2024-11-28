abstract class Shape {
  //SoundFile sound;
  float startingPoint;
  Dot dot;
  
  Shape() {
    this.dot = new Dot();
  }
  
  void play() {}
  void sound() {}
  void drawShape() {}
}
