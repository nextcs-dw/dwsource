class Orb {
  
  int size;
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  Orb() {
    size = int(random(10, 50));
    float x = random(size/2, width-size/2);
    float y = random(size/2, height-size/2);
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
  }
  
  void display() {
    fill(0, 255, 255);
    circle(position.x, position.y, size);
  }
  
  void move() {
    velocity.add(acceleration);
    position.add(velocity);
    
    yBounce();
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }//applyForce
  
  void yBounce() {
    if (position.y < size/2) {
      velocity.y*= -1;
      position.y = size/2;
    }
    if (position.y > height-size/2) {
      velocity.y*= -1;
      position.y = height - size/2;
    }
  }
}
