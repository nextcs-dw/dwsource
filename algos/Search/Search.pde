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


void setup() {
  size (600, 400);
  background(0);
  textSize(25);
  dataSize = 100;
  maxValue = 300;
  haystack = new int[dataSize];
  randInts(haystack, 0, maxValue);
  //needle = int(random(0, maxValue));
  needle = haystack[int(random(dataSize))];
  drawBars(haystack, width/haystack.length);
  searchPos = 0;
  found = false;
  liveSearch = false;
}//setup

void draw() {
  background(0);
  linearSearch();
}//draw


void linearSearch() {
  drawBars(haystack, width/haystack.length);
  if (searchPos < dataSize) {
    searchHighlight(haystack, searchPos, width/haystack.length);
    if (haystack[searchPos] == needle) {
      found = true;
    }//found!
    if (liveSearch && !found) {
      searchPos++;
    }//auto search
  }//within bound
  else {
    textAlign(LEFT, TOP);
    text("looking for: " + needle, 0, 0);
    textAlign(RIGHT, TOP);
    text("not found", width, 0);
  }//not found
} //linearSearch

void keyPressed() {
  if (key == 'r') {
    println("reset");
    randInts(haystack, 0, maxValue);
    searchPos = 0;
    found = false;
    liveSearch = false;
  }//reset
  if (keyCode == RIGHT && !found) {
    searchPos++;
  }//search enxt value
  if (keyCode == ' ') {
    liveSearch = !liveSearch;
  }//toggle liveSearch
}//keyPressed

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
  fill(255);
  textAlign(LEFT, TOP);
  text("looking for: " + needle, 0, 0);
  textAlign(RIGHT, TOP);
  text("search value: " + data[pos], width, 0);
}//highlightBar
