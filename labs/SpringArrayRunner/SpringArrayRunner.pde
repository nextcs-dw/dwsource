/* ===================================
SpringArrayDriver (All Work Goes Here)

You will write a program that creates an array or orbs. When run, the simulation should show the orbs being connected by springs, which will push and pull the orbs according to the spring force.

Earth gravity will be a toggelable option. As well as whether the simulation is running movement or not.
=================================== */


int NUM_ORBS = 10;
int MIN_SIZE = 10;
int MAX_SIZE = 60;
float MIN_MASS = 10;
float MAX_MASS = 100;
float GRAVITY = 1;

int SPRING_LENGTH = 50;
float  SPRING_K = 0.005;

boolean moving;
boolean earthGravity;
FixedOrb earth;
Orb[] orbs;
int orbCount;

void setup() {
  size(600, 600);
  earth = new FixedOrb(width/2, height * 200, 1, 20000);
  moving = false;
  earthGravity = false;
  orbCount = NUM_ORBS;
  //Part 0: Write makeOrbs below
  makeOrbs(true);
}//setup

void draw() {
  background(255);
  displayMode();

  //draw the orbs and springs
  for (int o=0; o < orbCount; o++) {
    orbs[o].display();
    if (o != orbCount - 1) {
      drawSpring(orbs[o], orbs[o+1]);
    }
    //Part 1: write drawSpring below
    //Use drawspring correctly to draw springs
  }//draw orbs & springs

  if (moving) {
    //Part 2: write applySprings below
    applySprings();
    if (earthGravity) {
      //part 3: apply eath gravity to each orb
      for (int o=0; o < orbCount; o++) {
        PVector eg = orbs[o].getGravity(earth, GRAVITY);
        orbs[o].applyForce(eg);
      }
    }//earth
    for (int o=0; o < orbCount; o++) {
      orbs[o].run();
    }
  }//moving
  //saveFrame("data/####-mass.png");
}//draw

/* ===================================
  makeOrbs(boolean ordered)

  Initialize and create NUM_ORBS Orbs in orbs.
  All orbs should have random mass and size.
  If ordered is true:
    The orbs should be spaced SPRING_LENGTH distance
    apart along the middle of the screen.
  If ordered is false:
    The orbs should be positioned radomly.

  Each orb will be "connected" to its neighbors in the array.
=================================== */
void makeOrbs(boolean ordered) {
  orbs = new Orb[orbCount];
  int x = MAX_SIZE/2;
  int y = height/2;
  for (int o=0; o < orbs.length; o++) {
    orbs[o] = new Orb();
    if (ordered) {
      orbs[o].position.x = x;
      orbs[o].position.y = y;
      x+= SPRING_LENGTH;
    }
  }
}//makeOrbs


/* ===================================
  drawSpring(Orb o0, Orb o1)

  Draw a line between the two Orbs.
  Line color should change as follows:
    red: The spring is stretched.
    green: The spring is compressed.
    black: The spring is at its normal length
=================================== */
void drawSpring(Orb o0, Orb o1) {
  float d = o0.position.dist(o1.position);
  if (d < SPRING_LENGTH) {
    stroke(0, 255, 0);
  }
  else if (d > SPRING_LENGTH) {
    stroke(255, 0, 0);
  }
  else {
    stroke(0);
  }
  line(o0.position.x, o0.position.y, o1.position.x, o1.position.y);
}//drawSpring


/* ===================================
  applySprings()

  Go through the Orbs array and apply the spring
  force correctly for each orb. We will consider every
  orb as being "connected" via a spring to is
  neighboring orbs in the array.
=================================== */
void applySprings() {
  for (int o=0; o < orbCount; o++) {
    if (o != orbCount - 1) {
      PVector ab = orbs[o].getSpring(orbs[o+1], SPRING_LENGTH, SPRING_K);
      orbs[o].applyForce(ab);
    }
    if ( o!= 0) {
      PVector ba = orbs[o].getSpring(orbs[o-1], SPRING_LENGTH, SPRING_K);
      orbs[o].applyForce(ba);
    }
  }
}//applySprings




void keyPressed() {
  if (key == ' ') {
    moving = !moving;
  }
  if (key == 'g') {
    earthGravity = !earthGravity;
  }
  if (key == '1') {
    orbCount = NUM_ORBS;
    makeOrbs(true);
  }
  if (key == '2') {
    orbCount = NUM_ORBS;
    makeOrbs(false);
  }
  if (key == '-') {
    if (orbCount > 0) {
      orbCount--;
      orbs[orbCount] = null;
    }
  }
  if (key == '=' || key == '+') {
    addOrb();
    orbCount++;
  }
}//keyPressed

void addOrb() {
  if (orbCount < orbs.length) {
    orbs[orbCount] = new Orb();
  }
  else {
    Orb[] neworbs = new Orb[orbCount+1];
    arrayCopy(orbs, neworbs);
    neworbs[orbCount] = new Orb();
    orbs = neworbs;
  }
}//addOrb


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
