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
    if (operation) {
      type = int(random(4)+1);
      value = 0;
    }//pick random operation
    else {
      type = VALUE;
      value = int(random(-99, 100));
    }//ranodm value
  }//random constructor

  String toString() {
    String s = "";
    if (type == VALUE) {
      s+= value;
    }
    if (type == ADDITION) {
      s+= "+";
    }
    else if (type == SUBTRACTION) {
      s+= "-";
    }
    else if (type == MULTIPLICATION) {
      s+= "*";
    }
    else if (type == DIVISION){
      s+= "/";
    }
    return s;
  }//toString

  String displayString() {
    String s = "";
    if (type == ADDITION) {
      s+= "+\n";
    }
    else if (type == SUBTRACTION) {
      s+= "-\n";
    }
    else if (type == MULTIPLICATION) {
      s+= "*\n";
    }
    else if (type == DIVISION){
      s+= "/\n";
    }
    s+= value;
    return s;
  }//toString

  void display() {
    fill(c);
    stroke(0);
    if (left != null) {
      line(position.x, position.y, left.position.x, left.position.y);
    }
    if (right != null) {
      line(position.x, position.y, right.position.x, right.position.y);
    }
    noStroke();
    circle(position.x, position.y, size);
    textAlign(CENTER, CENTER);
    textSize(size - 20);
    fill(0);

    text(displayString(), position.x, position.y);
  }//display

}//ExpressionTreeNode Class
