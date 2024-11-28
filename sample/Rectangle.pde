class Rectangle extends Shape {
  float x;
  float y;
  float r;
  
  
  Rectangle(float x, float y, float r, AudioSample sound) {
    super(x, y);
    this.x = x;
    this.y = y;
    this.r = r;
    this.sound = sound;
  }
  
  void play() {
  }
  
  void drawShape() {
    rect(x, y, r, r);
  }
  
  void start() {
    drawShape();
  }
}
