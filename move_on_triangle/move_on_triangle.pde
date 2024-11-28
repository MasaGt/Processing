import ddf.minim.*;

Minim minim;
AudioSample crash;

float cX, rX, lX;
float cY, rY, lY;
float r = 25;
float eX, eY;
float dx, dy;
float dist;
final int TO_RIGHT = 0;
final int TO_LEFT = 1;
final int TO_CENTER = 2;
int cerrentDirection;

void setup() {
  size(500, 500, P2D);
  background(255);
  minim = new Minim(this);
  crash = minim.loadSample("crash.wav");
  //center x and y of triangle
  cX = 250;

  cY = 50;
  
  //right x and y of triangle
  rX = 450;
  rY = 250;
  
  //left x and y of triangle
  lX = 50;
  lY = 250;
  
  //x and y for a dot
  eX = lX;
  eY = lY;
  noFill();
  //rectMode(CENTER);
  
  //calc dx and dy of a dot
  cerrentDirection = TO_RIGHT;  
  //dist = dist(rX, rY, lX, lY);
  dx = calcDx();
  dy = calcDy();
}

void draw() {
  background(255);
  triangle(cX, cY, rX, rY, lX, lY);
  
  //move dot
  float fromX = 0;
  float fromY = 0;
  float toX = 0;
  float toY = 0;
  if (cerrentDirection == TO_RIGHT) {
    fromX = lX;
    fromY = lY;
    toX = rX;
    toY = rY;
  } else if (cerrentDirection == TO_CENTER) {
    fromX = rX;
    fromY = rY;
    toX = cX;
    toY = cY;
  } else if (cerrentDirection == TO_LEFT) {
    fromX = cX;
    fromY = cY;
    toX = lX;
    toY = lY;
  }
  if (isReached(eX, toX)) {
    crash.trigger();
  }
  
  eX += calcDx();
  eY += calcDx();
  ellipse(eX, eY, r*2, r*2);
}

float calcDx() {
  float _dx = 0;
  float _dist = 0;
  if (cerrentDirection == TO_RIGHT) {
    _dist = dist(rX, rY, lX, lY);
    _dx = ((rX - lX) / (dist/5));
  } else if (cerrentDirection == TO_CENTER) {
    _dist = dist(lX, lY, cX, cY);
    _dx = ((lX - cX) / (dist/5));
  } else if (cerrentDirection == TO_LEFT) {
    _dist = dist(cX, cY, rX, rY);
    _dx = ((cX - rX) / (dist/5));
  }
  return _dx;
}

float calcDy() {
  float _dy = 0;
  float _dist = 0;
  if (cerrentDirection == TO_RIGHT) {
    _dist = dist(rX, rY, lX, lY);
    _dy = ((lY - rY) / (dist/5));
  } else if (cerrentDirection == TO_CENTER) {
    _dist = dist(lX, lY, cX, cY);
    _dy = ((cY - lY) / (dist/5));
  } else if (cerrentDirection == TO_LEFT) {
    _dist = dist(cX, cY, rX, rY);
    _dy = ((lY - cY) / (dist/5));
  }
  return _dy;
}

//boolean isReached(float fromX, float toX) {
//  if (cerrentDirection == TO_RIGHT) {
//    if (fromX >= toX) {
//      cerrentDirection = TO_CENTER;
//      return true;
//    }
//  } else if (cerrentDirection == TO_CENTER) {
//    if (fromX <= toX) {
//      cerrentDirection = TO_LEFT;
//      return true;
//    }
//  } else if (cerrentDirection == TO_LEFT) {
//    if (fromX <= toX) {
//      cerrentDirection = TO_RIGHT;
//      return true;
//    }
//  }
  
//  return false;
//}


//boolean isReached(float fromX, float toX) {
//  if (cerrentDirection == TO_RIGHT) {
//    if (fromX >= toX) {
//      cerrentDirection = TO_CENTER;
//      return true;
//    } else {
//      return false;
//    }
//  } else if (cerrentDirection == TO_CENTER) {
//    if (fromX <= toX) {
//      cerrentDirection = TO_LEFT;
//      return true;
//    } else {
//      return false;
//    }
//  } else if (cerrentDirection == TO_LEFT) {
//    if (fromX <= toX) {
//      cerrentDirection = TO_RIGHT;
//      return true;
//    } else {
//      return false;
//    }
//  }
  
//  return false;
//}

boolean isReached(float fromX, float toX) {
  if (cerrentDirection == TO_RIGHT) {
    if (fromX >= toX) {
      cerrentDirection = TO_CENTER;
      return true;
    } else {
      return false;
    }
  } else if (cerrentDirection == TO_CENTER) {
    if (fromX <= toX) {
      cerrentDirection = TO_LEFT;
      return true;
    } else {
      return false;
    }
  } else if (cerrentDirection == TO_LEFT) {
    if (fromX <= toX) {
      cerrentDirection = TO_RIGHT;
      return true;
    } else {
      return false;
    }
  }
  
  return false;
}
