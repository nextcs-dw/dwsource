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

  PVector getDragForce(float cd) {
    float dragMag = velocity.mag();
    dragMag = -0.5 * dragMag * dragMag * cd;
    PVector dragForce = velocity.copy();
    dragForce.normalize();
    dragForce.mult(dragMag);
    return dragForce;
  }//getDragForce

  //gravity as other "pulls" this
  PVector getGravity(Orb other, float gravConst) {
    if (this == other) {
      return new PVector(0, 0);
    }

    PVector g = other.position.copy();
    g.sub(this.position);
    g.normalize();

    float dist = this.position.dist(other.position);
    //dist = max(5, dist);
    //dist = min(height, dist);
    dist = constrain(dist, 5, height);
    float mag = (gravConst * this.mass * other.mass);
    mag = mag / (dist * dist);

    g.mult(mag);
    return g;
  }//getGravity

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

  String toString() {
    String s = "";
    s+= "pos: " + position;
    s+= " vel: " + velocity;
    s+= " acl: " + acceleration;
    return s;
  }

}//Orb
