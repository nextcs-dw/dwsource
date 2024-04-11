int NODE_SIZE = 25;
int NUM_LEVELS = 6;
int Y_SPACE = 75;

Tree oak;
//just to ensure no repeat letters in tree creation
//for traversal demos
ArrayList<Character> LETTERS;

void setup() {
  size(800, 500);
  setLetters();

  oak = new Tree(width/2, NODE_SIZE + 10, NUM_LEVELS, true);
  oak.display();
  showStats();
}//setup

void draw() {
  background(255);
  oak.display();
  showStats();
}//draw

void showStats() {
  int padding = 5;
  int textsize = 20;
  fill(0);
  textSize(textsize);

  //if more than 20 nodes, traversals are too long
  if (oak.countNodes() <= 20) {
    textAlign(RIGHT, TOP);
    text("pre order: " + oak.preOrder(),width-padding, padding);
    text("in order: " + oak.inOrder(), width-padding, textsize + padding);
    text("post order: " + oak.postOrder(), width-padding, textsize * 2 + padding);
  }

  textAlign(LEFT, TOP);
  text("nodes: " + oak.countNodes(), padding, padding);
  text("height: " + oak.getHeight(), padding, textsize + padding);
}

void keyPressed() {
  if (key == 'r') {
    setLetters();
    oak.reset(false);
  }
  if (key == 'f') {
    setLetters();
    oak.reset(true);
  }
}//keyPressed


void setLetters() {
  LETTERS = new ArrayList<Character>();
  for (char c='A'; c <='Z'; c++) {
    LETTERS.add(c);
  }
  for (char c='0'; c <='9'; c++) {
    LETTERS.add(c);
  }
}//setLetters
