class OrbNode extends Orb {

  OrbNode next;
  OrbNode previous;

  OrbNode() {
    super();
    next = null;
    previous = null;
  }

  void applySpring(int sl, float sk) {
    if (next != null) {
      PVector s = this.getSpring(next, sl, sk);
      applyForce(s);
    }
    if (previous != null) {
       PVector s = this.getSpring(previous, sl, sk);
      applyForce(s);
    }
  }

  void display() {
    if (next != null) {
      float d = this.position.dist(next.position);
      if (d < SPRING_LENGTH) {
        stroke(0, 255, 0);
      }
      else if (d > SPRING_LENGTH) {
        stroke(255, 0, 0);
      }
      else {
        stroke(0);
      }
      line(this.position.x, this.position.y, next.position.x, next.position.y);
    }
    super.display();
  }

}//OrbNode
