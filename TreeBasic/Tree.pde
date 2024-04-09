class Tree {

  TreeNode root;
  int numLevels;

  Tree(int x, int y, int levels, boolean full) {
    numLevels = levels;
    root = makeTree(x, y, numLevels, full);
  }//constructor

  void reset(boolean full) {
    root = makeTree(int(root.position.x), int(root.position.y), numLevels, full);
  }//reset

  TreeNode makeTree(int x, int y, int levels, boolean full) {
    if (levels == 0) {
      return null;
    }//base case

    char c = LETTERS.remove(int(random(LETTERS.size())));
    //char c = char(int(random(26)) + 'A');
    TreeNode tn = new TreeNode(c, x, y);

    //x position of each node is based on its level
    //root is at width/2
    //level 1 nodes are width/4 away from root
    //level 2 nodes are width/8 away from root ...
    //deviation form root is width/(2^(level+1))
    int nextLevel = numLevels - levels + 1;
    float xspacing = width / pow(2, (nextLevel + 1));
    int xLeft = int(x - xspacing);
    int xRight = int(x + xspacing);
    y+= 100;

    if (full || random(1) < float(levels)/numLevels) {
      tn.left = makeTree(xLeft, y, levels-1, full);
    }
    if (full || random(1) < float(levels)/numLevels) {
      tn.right = makeTree(xRight, y, levels-1, full);
    }
    return tn;
  }//makeTree

  void display(TreeNode current) {
      if (current != null) {
        current.display();
        display(current.left);
        display(current.right);
      }//there's something to see!
  }//display


  String preOrder(TreeNode current) {
    if (current != null) {
      String s = "" + current.data;
      s+= preOrder(current.left);
      s+= preOrder(current.right);
      return s;
    }//there's something to see!
    else {
      return "";
    }
  }//preOrder


  String postOrder(TreeNode current) {
    if (current != null) {
      String s = "";
      s+= postOrder(current.left);
      s+= postOrder(current.right);
      s+= current.data;
      return s;
    }//there's something to see!
    else {
      return "";
    }
  }//preOrder


  String inOrder(TreeNode current) {
    if (current != null) {
      String s = "";
      s+= inOrder(current.left);
      s+= current.data;
      s+= inOrder(current.right);
      return s;
    }//there's something to see!
    else {
      return "";
    }
  }//preOrder


}//Tree
