import ddf.minim.*;
Minim minim;

AudioSample[] sounds;
int numSounds = 7;
int index = 0;
void setup() {
  size(500, 500, P2D);
  background(255);
  rect(50, 50, 100, 100);
  minim = new Minim(this);
  sounds = new AudioSample[numSounds];
  sounds[0] = minim.loadSample("bass.wav");
  sounds[1] = minim.loadSample("crash.wav");
  sounds[2] = minim.loadSample("FloorTom.wav");
  sounds[3] = minim.loadSample("HighTom.wav");
  sounds[4] = minim.loadSample("MidTom.wav");
  sounds[5] = minim.loadSample("RideCymbal.wav");
  sounds[6] = minim.loadSample("Snare.wav");
}

void draw(){}

void mousePressed() {
  println("fire");
  fill(255, 0, 0);
  sounds[index].trigger();
  ++index;
  if (index >= 6) {
    index = 0;
  }
}
