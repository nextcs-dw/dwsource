int BUBBLE = 0;

int dataSize;
int maxValue;
SortArray sorty;

boolean liveSort;

void setup() {
  size (600, 400);
  background(0);
  textSize(25);

  dataSize = 50;
  maxValue = max(300, dataSize);
  sorty = new SortArray(BUBBLE, dataSize, maxValue);
}//setup

void draw() {
  background(0);
  sorty.display();
  if (liveSort) {
    sorty.bubbleSortOnce();
  }

}//draw


void keyPressed() {
  if (key == 'r') {
    reset();
  }//reset
  if (key == ' ') {
    liveSort = !liveSort;
  }
  if (keyCode == RIGHT) {
    sorty.bubbleSortOnce();
  }
}//keyPressed

void reset() {
  sorty.randInts();
  sorty.resetSortVars();
}//reset for more sorting



//
// void displayStats(boolean end) {
//   fill(255);
//   textAlign(LEFT, TOP);
//   text("looking for: " + needle, 0, 0);
//   textAlign(RIGHT, TOP);
//   if (end) {
//     text("not found", width, 0);
//   }
//   else {
//     text("search value: " + haystack[searchPos], width, 0);
//   }
//   textAlign(LEFT, TOP);
//   text("Average count: " + averageCount, 0, 25);
//   textAlign(RIGHT, TOP);
//   text("Total runs: " + totalRuns, width, 25);
// }//displayStats
