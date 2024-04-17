int NODE_SIZE = 35;
int NUM_LEVELS = 5;
int Y_SPACE = 75;

int VALUE = 0;
int ADDITION = 1;
int SUBTRACTION = 2;
int MULTIPLICATION = 3;
int DIVISION = 4;

ExpressionTree hal;

void setup() {
  size(800, 500);

  hal = new ExpressionTree(width/2, NODE_SIZE + 10, NUM_LEVELS, false);
  hal.display();
  println(hal.preOrder());
  println(hal.postOrder());
  println(hal.inOrder());
  println(hal.evaluate());
}//setup

void draw() {
  background(255);
  hal.display();
  showStats();
}//draw


void showStats() {
  int padding = 5;
  int textsize = 16;
  fill(0);
  textSize(textsize);

  //if more than 20 nodes, traversals are too long
  if (hal.countNodes() <= 15) {
    textAlign(RIGHT, TOP);
    text("pre order: " + hal.preOrder(),width-padding, padding);
    text("in order: " + hal.inOrder(), width-padding, textsize + padding);
    text("post order: " + hal.postOrder(), width-padding, textsize * 2 + padding);
  }

  textAlign(LEFT, TOP);
  text("nodes: " + hal.countNodes(), padding, padding);
  text("height: " + hal.getHeight(), padding, textsize + padding);
  text("result: " + hal.evaluate(), padding, (textsize + padding) * 2);
}

void keyPressed() {
  if (key == 'r') {
    hal.reset(false);
    hal.evaluate();
  }
  if (key == 'f') {
    hal.reset(true);
    hal.evaluate();
  }
}//keyPressed
