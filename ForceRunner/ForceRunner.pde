int NUM_ORBS = 8;
int MIN_SIZE = 10;
int MAX_SIZE = 60;
float MIN_MASS = 10;
float MAX_MASS = 100;
float GRAVITY = 1;

Orb[] orbs;
PVector gravity;
PVector wind;
boolean moving;
FixedOrb earth;

void setup() {
  size(600, 400);
  orbs = new Orb[NUM_ORBS];
  makeOrbs(true);
  earth = new FixedOrb(width/2, height * 200, 1, 2000);

  moving = true;
  gravity = new PVector(0, 0.2);
  wind = new PVector(0, 0);
}//setup

void draw() {
  background(255);
  fill(0, 255, 255);
  //rect(0, 200, width, 200);
  for (int o=0; o<orbs.length; o++) {
    orbs[o].display();
  }
  if (moving) {
    //applyForces();
    applyGravity(false, true);
    for (int o=0; o<orbs.length; o++) {
      orbs[o].run();
    }
  }//moving
  //saveFrame("data/####-drag.png");
}//draw

void applyGravity(boolean orbG, boolean earthG) {
  for (int o0 = 0; o0 < orbs.length; o0++) {
    if (orbG) {
      for(int o1=0; o1<orbs.length; o1++) {
        PVector g = orbs[o0].getGravity(orbs[o1], GRAVITY);
        orbs[o0].applyForce(g);
      }
    }//apply orb-orb gravity
    if (earthG) {
      PVector eg = orbs[o0].getGravity(earth, GRAVITY);
      orbs[o0].applyForce(eg);
    }//apply earth gravity
  }
}//applyGravity


void applyForces() {
  for (int o=0; o<orbs.length; o++) {
    orbs[o].applyForce(gravity);
    orbs[o].applyForce(wind);
    if (orbs[o].position.y+orbs[o].size/2 > 200 ) {
      PVector drag = orbs[o].getDragForce(2);
      orbs[o].applyForce(drag);
    }//add drag
  }
}//applyForces


void keyPressed() {
  if (key == 'r'){
    makeOrbs(true);
  }
  if (key == ' ') {
    moving = !moving;
  }
}//keyPressed

void makeOrbs(boolean lineup) {
  int x = MAX_SIZE/2 + 10;
  int y = MAX_SIZE;
  for (int o=0;  o<orbs.length; o++) {
    if (lineup) {
      orbs[o] = new Orb(x, y, int(random(MIN_SIZE, MAX_SIZE)),
                        random(MIN_MASS, MAX_MASS));
      x+= MAX_SIZE + 10;
    }
    else {
      orbs[o] = new Orb();
    }
  }//makeOrbs
}
