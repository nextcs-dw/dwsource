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
}//setup

void draw() {
  background(255);
  hal.display();
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
}

void keyPressed() {
  if (key == 'r') {
    hal.reset(false);
  }
  if (key == 'f') {
    hal.reset(true);
  }
}//keyPressed
