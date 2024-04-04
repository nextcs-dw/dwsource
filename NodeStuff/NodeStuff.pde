void setup() {
  size(600, 600);
  Node n0 = new Node('A', width/2, 50);
  Node n1 = new Node('B', width/4, 100);
  Node n2 = new Node('C', width/4 * 3, 100);
  Node n3 = new Node('D', width/8, 150);
  
  n0.left = n1;
  n0.right = n2;
  n1.left = n3;
  
  display(n0);
}

void display(Node n) {
  if ( n != null ) {
    n.display();
    display(n.left);
    display(n.right);
  }
}
