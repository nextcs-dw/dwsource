int MIN_SIZE = 10;
int MAX_SIZE = 60;

Orb o0, o1;
PVector gravity;

void setup() {
  size(600, 400);
  o0 = new Orb();
  o1 = new Orb();
  gravity = new PVector(0, 1);
}

void draw() {
  background(255);
  o0.display();
  o1.display();

  o0.applyForce(gravity);
  o1.applyForce(gravity);
  println(gravity);
  
  o0.run();
  o1.run();
  //println(o0);
}
