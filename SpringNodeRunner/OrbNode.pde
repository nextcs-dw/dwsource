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
      line(this.position.x, this.position.y, next.position.x, next.position.y);
    }
    super.display();
  }
  
}//OrbNode
