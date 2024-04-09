int NODE_SIZE = 25;
int NUM_LEVELS = 4;
int Y_SPACE = 75;

Tree oak;
//just to ensure no repeat letters in tree creation
//for traversal demos
ArrayList<Character> LETTERS;

void setup() {
  size(800, 500);
  setLetters();

  oak = new Tree(width/2, NODE_SIZE + 10, NUM_LEVELS, true);
  oak.display(oak.root);

}//setup

void draw() {
  background(255);
  oak.display(oak.root);

  fill(0);
  textAlign(RIGHT, TOP);
  textSize(20);
  text("pre order: " + oak.preOrder(oak.root),width-5, 5);
  text("in order: " + oak.inOrder(oak.root), width-5, 30);
  text("post order: " + oak.postOrder(oak.root), width-5, 55);

}//draw


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
