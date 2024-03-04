int NUM_ORBS = 8;
int MIN_SIZE = 10;
int MAX_SIZE = 60;

Orb[] orbs;
PVector gravity;
PVector wind;
boolean moving;

void setup() {
  size(600, 400);
  orbs = new Orb[NUM_ORBS];
  makeOrbs(true);

  moving = true;
  gravity = new PVector(0, 0.2);
  wind = new PVector(0, 0);
}//setup

void draw() {
  background(255);
  fill(0, 255, 255);
  rect(0, 200, width, 200);
  for (int o=0; o<orbs.length; o++) {
    orbs[o].display();
  }
  if (moving) {
    applyForces();
    for (int o=0; o<orbs.length; o++) {
      orbs[o].run();
    }
  }//moving
  fill(0);
  textAlign(LEFT, TOP);
  textSize(16);
  text("wind: " + wind, 0, 0);
  text("gravity: " + gravity, 0, 16);

  //saveFrame("data/####-drag.png");
}//draw

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
  if (keyCode == RIGHT) {
    wind.x+= 0.1;
  }
  if (keyCode == LEFT) {
    wind.x+= -0.1;
  }
  if (keyCode == DOWN) {
    gravity.y+= 0.1;
  }
  if (keyCode == UP) {
    gravity.y-= 0.1;
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
      orbs[o] = new Orb(x, y, int(random(MIN_SIZE, MAX_SIZE)));
      x+= MAX_SIZE + 10;
    }
    else {
      orbs[o] = new Orb();
    }
  }//makeOrbs
}
