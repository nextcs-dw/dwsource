class Node {

  Node left;
  Node right;
  
  char data;
  int size;
  color c;
  PVector position;
  
  Node(char d, int x, int y) {
    data = d;
    position = new PVector(x, y);
    size = 40;
    c = color(255, 0, 255);
  }
  
  void display() {
    fill(c);
    circle(position.x, position.y, size);
    if (left != null) {
      line(position.x, position.y, left.position.x, left.position.y);
    } 
    if (right != null) {
      line(position.x, position.y, right.position.x, right.position.y);
    } 
  }
}
