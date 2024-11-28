Ball ball1, ball2;
final int WEIGHT = 3;
final int COLOR_CODE_LIMIT = 256;
ArrayList<Ball> balls;

void setup() {
  size(500, 500, P2D);
  smooth();
  //noStroke();
  strokeWeight(WEIGHT);
  //frameRate(10);
  
  balls = new ArrayList<>();
  
  //create ball1
  ball1 = new Ball(random(30, 41),
                   WEIGHT,
                   COLOR_CODE_LIMIT);
  //ball1 = new Ball(random(radius+WEIGHT, width-(radius+WEIGHT)),
  //                 random(radius+WEIGHT, height-(radius+WEIGHT)),
  //                 color(random(COLOR_CODE_LIMIT), random(COLOR_CODE_LIMIT), random(COLOR_CODE_LIMIT)),
  //                 random(5, 10),
  //                 random(5, 10),
  //                 radius,
  //                 WEIGHT);                
   balls.add(ball1);
                   
  //create ball2
  ball2 = new Ball(random(30, 41),
                   WEIGHT,
                   COLOR_CODE_LIMIT);
  //ball2 = new Ball(random(radius+WEIGHT, width-(radius+WEIGHT)),
  //                 random(radius+WEIGHT, height-(radius+WEIGHT)),
  //                 color(random(COLOR_CODE_LIMIT), random(COLOR_CODE_LIMIT), random(COLOR_CODE_LIMIT)),
  //                 random(5, 10),
  //                 random(5, 10),
  //                 radius,
  //                 WEIGHT);
   balls.add(ball2);
}
                   
void draw() {
  
  background(color(255));
  if (ball1.collide(ball2)) {
    ball1.isStick = true;
    ball2.isStick = true;
    ball1.ballColor = lerpColor(color(0,255,0), color(0,0,0), 0.5);
    ball2.ballColor = lerpColor(color(0,255,0), color(0,0,0), 0.5);
    ball1.stick(ball2);
    ball2.stick(ball1);
    ball1.updateWIthOtherBall(ball2);
  } else {
    ball1.isStick = false;
    ball2.isStick = false;
    ball1.update();
    ball2.update();
  }
  ball1.render();
  ball2.render();
}

float setupPosition() {
  return 0;
}
