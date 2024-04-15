class ExpressionTreeNode {

  ExpressionTreeNode left;
  ExpressionTreeNode right;

  int type;
  float value;
  int size;
  color c;
  PVector position;

  ExpressionTreeNode(int t, float v, int x, int y) {
    type = t;
    value = v;
    position = new PVector(x, y);
    size = NODE_SIZE;
    c = color(0, 255, 255);
  }//constructor

  ExpressionTreeNode(boolean operation, int x, int y) {
    this(0, 0, x, y);

  }//random constructor

  String toString() {
    String s = "";
    return s;
  }//toString

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
    textSize(size - 20);
    fill(0);

    text(toString(), position.x, position.y);
  }//display

}//ExpressionTreeNode Class
