class Orb {

  int size;
  PVector position;
  PVector velocity;
  PVector acceleration;
  color c;

  Orb (int x, int y, int s) {
    position = new PVector(x, y);
    size = s;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    c = color(0, 255, 255);
  }//constructor

  Orb() {
    this(0, 0, 0);
    int s = int(random(MIN_SIZE, MAX_SIZE));
    int x = int(random(s/2, width - s/2));
    int y = int(random(s/2, height - s/2));
    position.x = x;
    position.y = y;
    size = s;
  }//default constructor

  void display() {
    fill(c);
    circle(position.x, position.y, size);
  }//display

  void run() {
    velocity.add(acceleration);
    position.add(velocity);

    yBounce();
    xBounce();
  }//run

  void applyForce(PVector force) {
    acceleration.add(force);
  }//applyForce

  void yBounce() {
    if (position.y < size/2) {
      velocity.y*= -0.99;
      position.y = size/2;
    }
    if (position.y > height-size/2) {
      velocity.y*= -0.99;
      position.y = height - size/2;
    }
  }//yBounce

  void xBounce() {
    if (position.x < size/2) {
      position.x = size/2;
      velocity.x *= -0.99;
    }
    else if (position.x >= width - size/2) {
      position.x = width - size/2;
      velocity.x *= -0.99;
    }
  }//xBounce

}//Orb
