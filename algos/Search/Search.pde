int dataSize;
int maxValue;
int[] haystack;
int needle; //value to find

//seraching variables
int searchPos; //current index to look for needle
boolean found; //ture if needle found in haystack
boolean liveSearch; //if true, automatically increment searchPos in draw
int start;
int end;
boolean sorted;
boolean continuous;

int countUntilFound;
int totalRuns;
float averageCount;

void setup() {
  size (600, 400);
  background(0);
  textSize(25);
  dataSize = 200;
  maxValue = 300;
  haystack = new int[dataSize];
  averageCount = 0;
  countUntilFound = 0;
  totalRuns = 0;
  randInts(haystack, 0, maxValue);
  searchPos = 0;
  start = 0;
  end = haystack.length - 1;
  found = false;
  liveSearch = false;
  continuous = false;
  sorted = false;
  //uncomment to gaurantee needle in haystack
  needle = haystack[int(random(dataSize))];
  drawBars(haystack, width/haystack.length);
}//setup

void draw() {
  background(0);
  if (sorted) {
    binarySearchPass();
  }
  else {
    linearSearchPass();
  }
}//draw


void binarySearchPass() {
  drawBars(haystack, width/haystack.length);
}


void linearSearchPass() {
  drawBars(haystack, width/haystack.length);
  if (searchPos < dataSize) {
    searchHighlight(haystack, searchPos, width/haystack.length);
    displayStats(false);
    if (haystack[searchPos] == needle) {
      found = true;
      if (continuous) {
        reset();
      }
    }//found!
    if (liveSearch && !found) {
      searchPos++;
      countUntilFound++;
    }//auto search
  }//within bound
  else {
    displayStats(true);
    if (continuous) {
      reset();
    }
  }//not found

} //linearSearch



void keyPressed() {
  if (key == 'r') {
    reset();
  }//reset
  if (key == 's') {
    haystack = sort(haystack);
    sorted = true;
  }
  if (keyCode == RIGHT && !found) {
    if (sorted) {

    }//binary search
    else {
      searchPos++;
    }//linear search
    countUntilFound++;
  }//search next value
  if (keyCode == ' ' && !continuous) {
    liveSearch = !liveSearch;
  }//toggle liveSearch

  if (key == 'c') {
    continuous = !continuous;
    if (continuous) {
      liveSearch = true;
    }
  }//enable continuous mode
}//keyPressed

void reset() {
  randInts(haystack, 0, maxValue);
  if (sorted) {
    haystack = sort(haystack);
  }
  start = 0;
  end = haystack.length - 1;
  searchPos = 0;
  found = false;
  if (!continuous) {
    liveSearch = false;
    continuous = false;
  }
  totalRuns++;
  averageCount = countUntilFound / (float)totalRuns;
}//reset for more sorting

void randInts(int[] data, int low, int high) {
  for (int i=0; i<data.length; i++) {
    data[i] = int(random(low, high));
  }//loop
}//randInts

void drawBars(int[] data, int barWidth) {
  int x = 0;
  for(int i=0; i<data.length; i++) {
    fill(255);
    rect(x, height, barWidth, -data[i]);
    x+= barWidth;
  }//loop through array
}//drawValues

void searchHighlight(int[] data, int pos, int barWidth) {
  fill(255, 0, 255);
  rect(barWidth*pos, height, barWidth, -data[pos]);
}//highlightBar


void displayStats(boolean end) {
  fill(255);
  textAlign(LEFT, TOP);
  text("looking for: " + needle, 0, 0);
  textAlign(RIGHT, TOP);
  if (end) {
    text("not found", width, 0);
  }
  else {
    text("search value: " + haystack[searchPos], width, 0);
  }
  textAlign(LEFT, TOP);
  text("Average count: " + averageCount, 0, 25);
  textAlign(RIGHT, TOP);
  text("Total runs: " + totalRuns, width, 25);
}//displayStats
