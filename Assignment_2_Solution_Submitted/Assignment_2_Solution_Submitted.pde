/**
* COMP570 Programming for Creativity 2022 S1
* Assignment - Colliding Objects
* This program draws two bouncing balls.
* Each ball has different random starting position, fill colour, 
* radius between 30 and 40, and velocity between -5 and 5.
* When two balls touches to each other, the balls turn into 50% green,
* the outline disappear, and move together as one.
* 
* @author Masaomi Goto, Student ID# 19075459
* version 1.0 - 22/4/2022: Created bouncing balls.
* version 1.1 - 28/3/2022: Create BallManager class so that it manages each ball.
* version 1.2 - 4/5/2022: Created StickedBalls class so that sticked balls move as one.
*/

final color WHITE = color(255);

BallManager balls; //the class holds and manages balls

//radius should be between 30 and 40
float minRadius = 30;
float maxRadius = 41;
//velocity should be between -5 and 5
float minVelosity = -5;
float maxVelosity = 6;
int ballNum = 2;
int weight = 3; //variable for thickness of the outline
int colorCodeLimit = 256; //constant variable for the limit of color code for random()

void setup() {
  //canvas size is 500x500
  size(500, 500, P2D);
  smooth();
  strokeWeight(weight);
  
  balls = new BallManager();
  
  //create balls
  for (int i = 0; i < ballNum; i++) {
    balls.addBall(
      new Ball(random(minRadius, maxRadius),
               weight,
               colorCodeLimit,
               random(minVelosity, maxVelosity),
               random(minVelosity, maxVelosity))
    );
  }
}
                   
void draw() {
  background(WHITE);
  //update and render all the balls
  balls.update();
  balls.render();
}
