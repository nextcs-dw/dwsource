void setup() {
  size(600, 600);
  TreeNode n0 = new TreeNode('A', width/2, 50);
  TreeNode n1 = new TreeNode('B', width/4, 100);
  TreeNode n2 = new TreeNode('C', width/4 * 3, 100);
  TreeNode n3 = new TreeNode('D', width/8, 150);

  n0.left = n1;
  n0.right = n2;
  n1.left = n3;

  display(n0);
}

void display(TreeNode n) {
  if ( n != null ) {
    n.display();
    display(n.left);
    display(n.right);
  }
}
