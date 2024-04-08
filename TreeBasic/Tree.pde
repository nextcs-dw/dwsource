class Tree {

  TreeNode root;
  int numLevels;

  Tree(int x, int y, int levels) {
    numLevels = levels;
    root = makeTree(x, y, numLevels);
  }//constructor

  TreeNode makeTree(int x, int y, int levels) {
    if (levels == 0) {
      return null;
    }//base case

    char c = char(int(random(26)) + 'A');
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

    tn.left = makeTree(xLeft, y, levels-1);
    tn.right = makeTree(xRight, y, levels-1);

    return tn;
  }//makeTree

  void display(TreeNode current) {
      if (current != null) {
        current.display();
        display(current.left);
        display(current.right);
      }//there's something to see!
  }//display

}//Tree
