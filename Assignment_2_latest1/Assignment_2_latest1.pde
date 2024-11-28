int ballNum = 2;
//radius should be between 30 and 40
float minRadius = 30;
float maxRadius = 41;
//velocity should be between -5 and 5
float minVelosity = -5;
float maxVelosity = 6;

final color WHITE = color(255);
final float WEIGHT = 3;
final float COLOR_CODE_LIMIT = 256;
ArrayList<Ball> balls;


void setup() {
  size(500, 500, P2D);
  smooth();
  strokeWeight(WEIGHT);
  
  balls = new ArrayList<>();
  
  //create balls
  for (int i = 0; i < ballNum; i++) {
    balls.add(new Ball(
                    random(minRadius, maxRadius), //radius
                    COLOR_CODE_LIMIT,
                    random(minVelosity, maxVelosity), //x velosity
                    random(minVelosity, maxVelosity), //y velosity
                    WEIGHT
                 ));
  }
}

void draw() {
  background(WHITE);
  
  if (balls.get(0).collide(balls.get(1))) {
    balls.get(0).setOtherBall(balls.get(1));
    balls.get(1).setOtherBall(balls.get(0));
  } else {
    if (balls.get(0).otherBall != null) {
      println("detatched");
    }
  }
  
  for (Ball ball : balls) {
    ball.update();
    ball.render();
  }
}
