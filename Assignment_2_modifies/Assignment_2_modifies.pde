int ballNum = 6;
//radius should be between 30 and 40
float minRadius = 30;
float maxRadius = 41;
//velocity should be between -5 and 5
float minVelosity = -5;
float maxVelosity = 6;

final color WHITE = color(255);
final float WEIGHT = 3;
final float COLOR_CODE_LIMIT = 256;
//ArrayList<Ball> balls;
BallsManager balls;

void setup() {
  size(500, 500, P2D);
  smooth();
  strokeWeight(WEIGHT);
  
  balls = new BallsManager();
  
  //create balls
  for (int i = 0; i < ballNum; i++) {
    balls.addBall(new Ball(
                    random(minRadius, maxRadius), //radius
                    COLOR_CODE_LIMIT,
                    random(minVelosity, maxVelosity), //x velosity
                    random(minVelosity, maxVelosity), //y velosity
                    WEIGHT,
                    "ball" + (i+1)
                 ));
  }
}

void draw() {
  background(WHITE);
  
  balls.update();
  balls.render();
}
