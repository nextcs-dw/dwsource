class ExpressionTree {

  ExpressionTreeNode root;
  int numLevels;

  ExpressionTree(int x, int y, int levels, boolean full) {
    numLevels = levels;
    root = makeTree(x, y, numLevels, full);
  }//constructor

  void reset(boolean full) {
    root = makeTree(int(root.position.x), int(root.position.y), numLevels, full);
  }//reset

  ExpressionTreeNode makeTree(int x, int y, int levels, boolean full) {
    if (levels == 0) {
      return null;
    }//base case
    
    boolean operator = full || random(1) < float(levels)/numLevels;
    if (levels == 1) {
      operator = false;
    }//a leaf must be a valu

    ExpressionTreeNode tn = new ExpressionTreeNode(operator, x, y);

    int nextLevel = numLevels - levels + 1;
    float xspacing = width / pow(2, (nextLevel + 1));
    int xLeft = int(x - xspacing);
    int xRight = int(x + xspacing);
    y+= Y_SPACE;

    if (operator) {
      tn.left = makeTree(xLeft, y, levels-1, full);
      tn.right = makeTree(xRight, y, levels-1, full);
    }

    return tn;
  }//makeTree

  int countNodes() {
    return countNodes(root);
  }
  int countNodes(ExpressionTreeNode current) {
    if (current == null) {
      return 0;
    }
    return 1 + countNodes(current.left) + countNodes(current.right);
  }//countNodes

  int getHeight() {
    return getHeight(root);
  }
  int getHeight(ExpressionTreeNode current) {
    if (current == null) {
      return 0;
    }
    int left = getHeight(current.left);
    int right = getHeight(current.right);
    if (left > right) {
      return 1 + left;
    }
    else {
      return 1 + right;
    }
  }//getHeight

  void display() {
    display(root);
  }
  void display(ExpressionTreeNode current) {
      if (current != null) {
        current.display();
        display(current.left);
        display(current.right);
      }//there's something to see!
  }//display

  String preOrder() {
    return preOrder(root);
  }
  String preOrder(ExpressionTreeNode current) {
    if (current != null) {
      String s = "" + current;
      s+= preOrder(current.left);
      s+= preOrder(current.right);
      return s;
    }//there's something to see!
    else {
      return "";
    }
  }//preOrder

  String postOrder() {
    return postOrder(root);
  }
  String postOrder(ExpressionTreeNode current) {
    if (current != null) {
      String s = "";
      s+= postOrder(current.left);
      s+= postOrder(current.right);
      s+= current;
      return s;
    }//there's something to see!
    else {
      return "";
    }
  }//preOrder

  String inOrder() {
    return inOrder(root);
  }
  String inOrder(ExpressionTreeNode current) {
    if (current != null) {
      String s = "";
      s+= inOrder(current.left);
      s+= current;
      s+= inOrder(current.right);
      return s;
    }//there's something to see!
    else {
      return "";
    }
  }//preOrder


}//Tree
