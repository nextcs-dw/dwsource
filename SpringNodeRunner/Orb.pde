class Orb {
  PVector position;
  PVector velocity;
  PVector acceleration;

  int size;
  float mass;
  color c;

  Orb (int x, int y, int s, float m) {
    position = new PVector(x, y);
    size = s;
    mass = m;
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    c = color(0, 255, 255);
    color c1 = color(0);
    c = lerpColor(c, c1, (mass/size)/(MAX_MASS/MIN_SIZE));
  }//constructor

  Orb() {
    size = int(random(MIN_SIZE, MAX_SIZE));
    int x = int(random(size/2, width - size/2));
    int y = int(random(size/2, height - size/2));
    mass = random(MIN_MASS, MAX_MASS);
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    c = color (0, 255, 255);
    color c1 = color(0);
    c = lerpColor(c, c1, (mass/size)/(MAX_MASS/MIN_SIZE));
  }//default constructor

  void display() {
    fill(c);
    circle(position.x, position.y, size);
  }//display

  void applyForce(PVector force) {
    PVector scaleForce = force.copy().div(mass);
    acceleration.add(scaleForce);
  }//applyForce

  void run() {
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.mult(0);

    yBounce();
    xBounce();
  }//run


  //spring force between calling orb and other
  //spring force between calling orb and other
  PVector getSpring(Orb other, int springLength, float springK) {
    PVector direction = PVector.sub(other.position, this.position);
    direction.normalize();

    float displacement = this.position.dist(other.position) - springLength;
    float mag = springK * displacement;
    direction.mult(mag);

    return direction;
  }//getSpring

  //force of gravity other is exerting on calling object
  PVector getGravity(Orb other, float gConstant) {
    PVector g = new PVector(0, 0);
    if ( other != this ) {
      float d = this.position.dist(other.position);
      //d = max(5, d);
      d = constrain(d, 5, height);
      float mag = (gConstant * mass * other.mass) / (d * d);
      PVector direction = PVector.sub(other.position, this.position);
      direction.normalize();
      direction.mult(mag);
      return direction;
    }//do not find gravity of an Orb and itself
    return g;
  }//getGravity

  PVector getDragForce(float cd) {
    float dragMag = velocity.mag();
    dragMag = -0.5 * dragMag * dragMag * cd;
    PVector dragForce = velocity.copy();
    dragForce.normalize();
    dragForce.mult(dragMag);
    return dragForce;
  }//getDragForce


  void yBounce() {
    if (position.y < size/2) {
      position.y = size/2;
      velocity.y *= -0.99;
    }
    else if (position.y >= (height-size/2)) {
      position.y = height - size/2;
      velocity.y *= -0.99;
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
