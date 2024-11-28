Ball ball1, ball2;
int ballNum = 3;
final int WEIGHT = 3;
final int COLOR_CODE_LIMIT = 256;
final color WHITE = color(255);

BallUnit balls;
float minVelosity = 30;
float maxVelosity = 41;
void setup() {
  size(500, 500, P2D);
  smooth();
  //noStroke();
  strokeWeight(WEIGHT);
  //frameRate(10);
  
  //balls = new ArrayList<>();
  balls = new BallUnit();
  
  //create balls
  for (int i = 0; i < ballNum; i++) {
    balls.addBall(
      new Ball(random(minVelosity, maxVelosity),
               WEIGHT,
               COLOR_CODE_LIMIT)
    );
  }
}
                   
void draw() {
  
  background(WHITE);
  balls.update();
  balls.render();
  //if (ball1.collide(ball2)) {
  //  ball1.isStick = true;
  //  ball2.isStick = true;
  //  ball1.ballColor = lerpColor(color(0,255,0), color(0,0,0), 0.5);
  //  ball2.ballColor = lerpColor(color(0,255,0), color(0,0,0), 0.5);
  //  ball1.stick(ball2);

}
