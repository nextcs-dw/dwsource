class TreeNode {

  TreeNode left;
  TreeNode right;

  char data;
  int size;
  color c;
  PVector position;

  TreeNode(char d, int x, int y) {
    data = d;
    position = new PVector(x, y);
    size = 40;
    c = color(255, 0, 255);
  }//constructor

  void display() {
    fill(c);
    if (left != null) {
      line(position.x, position.y, left.position.x, left.position.y);
    }
    if (right != null) {
      line(position.x, position.y, right.position.x, right.position.y);
    }
    circle(position.x, position.y, size);
    textAlign(CENTER, CENTER);
    textSize(size - 5);
    fill(0);
    text(data, position.x, position.y);
  }//display
}//TreeNode Class
