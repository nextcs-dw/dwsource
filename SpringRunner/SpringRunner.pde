int NUM_ORBS = 8;
int MIN_SIZE = 10;
int MAX_SIZE = 60;
float MIN_MASS = 10;
float MAX_MASS = 100;
float GRAVITY = 1;

int SPRING_LENGTH = 100;
float  SPRING_K = 0.005;

boolean moving;
boolean earthGravity;
FixedOrb earth;

FixedOrb point;
Orb o;

void setup() {
  size(600, 600);
  earth = new FixedOrb(width/2, height * 200, 1, 20000);

  point = new FixedOrb(width/2, height/2 - SPRING_LENGTH, 10, 1);
  o = new Orb(width/2, height/2, 25, 10);
  //o = new Orb();
  moving = true;
  earthGravity = false;
}//setup

void draw() {
  background(255);
  displayMode();

  point.display();
  o.display();

  if (moving) {
    PVector s = o.getSpring(point, SPRING_LENGTH, SPRING_K);
    o.applyForce(s);
    if (earthGravity) {
      PVector g = o.getGravity(earth, GRAVITY);
      o.applyForce(g);
    }
    o.run();
  }//moving

  //saveFrame("data/####-mass.png");
}//draw



void keyPressed() {
  if (keyCode == DOWN) {
    o.position.y+= 10;
  }
  if (key == ' ') {
    moving = !moving;
  }
  if (key == 'g') {
    earthGravity = !earthGravity;
  }
}//keyPressed

void displayMode() {
  //initial setup
  color c;
  textAlign(LEFT, TOP);
  textSize(15);
  noStroke();
  //red or green boxes
  c = moving ? color(0, 255, 0) : color(255, 0, 0);
  fill(c);
  rect(0, 0, 53, 20);
  c = earthGravity ? color(0, 255, 0) : color(255, 0, 0);
  fill(c);
  rect(60, 0, 101, 20);

  stroke(0);
  fill(0);
  text("MOVING", 1, 3);
  text("EARTH GRAVITY", 61, 3);

}//displayMode
