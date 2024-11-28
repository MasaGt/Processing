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
* version 1.1 - 28/4/2022: Create BallManager class so that it manages each ball.
* version 1.2 - 2/5/2022: Created StickedBalls class so that sticked balls move as one.
* version 1.3 - 5/5/2022: Made the program simpler. Removed manager and StickedBalls classes. Make Ball class have a partner property.
*/

final color WHITE = color(255); //constant variable for the background color

//radius should be between 30 and 40
float minRadius = 30;
float maxRadius = 40;
//velocity should be between -5 and 5
float minVelosity = -5;
float maxVelosity = 5;

Ball ball1, ball2; //bouncing balls

void setup() {
  //canvas size is 500x500
  size(500, 500, P2D);
  smooth();
  //create the bouncing balls
  ball1 = new Ball(
                    random(minRadius, maxRadius), //radius
                    random(minVelosity, maxVelosity), //x velosity
                    random(minVelosity, maxVelosity) //y velosity
                 );
  ball2 = new Ball(
                    random(minRadius, maxRadius), //radius
                    random(minVelosity, maxVelosity), //x velosity
                    random(minVelosity, maxVelosity) //y velosity
                 );
}

void draw() {
  background(WHITE);
  
  //collision check
  if (ball1.collide(ball2)) {
    ball1.stickTo(ball2);
    ball1.setAverageVelosity();
  }
  
  //update the position of the balls
  if (ball1.partner == null) {
    ball1.move();
    ball2.move();
  } else {
    ball1.moveTogether(ball2);
  }
  
  //draw the balls
  ball1.render();
  ball2.render();
}
