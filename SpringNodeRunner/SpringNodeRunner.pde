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


void setup() {
  size(600, 600);
  earth = new FixedOrb(width/2, height * 200, 1, 20000);

  moving = false;
  earthGravity = false;
}//setup

void draw() {
  background(255);
  displayMode();


  if (moving) {

    if (earthGravity) {

    }

  }//moving

}//draw



void keyPressed() {

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
