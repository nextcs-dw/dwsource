class SortArray {

  int[] haystack;
  int maxValue;
  int algorithm;
  boolean sorted;

  //bubble sort vars
  int bsortStart;
  int bsortPos0;
  int bsortPos1;


  SortArray(int algo, int dsize, int mvalue) {
    maxValue = mvalue;
    haystack = new int[dsize];
    randInts();
    resetSortVars();
    algorithm = algo;
  }//constructor


  void bubbleSortOnce() {

  
  }//bubbleSortOnce






  /*
  Utility Functions, Leave Alone
  */
  void resetSortVars() {
    //bubble sort vars
    bsortPos0 = 0;
    bsortPos1 = 1;
    bsortStart = haystack.length;
  }//resetSortVars

  void swap(int p0, int p1) {
    int tmp = haystack[p0];
    haystack[p0] = haystack[p1];
    haystack[p1] = tmp;
  }//swap


  void randInts() {
    for (int i=0; i<haystack.length; i++) {
      haystack[i] = int(random(maxValue));
    }//loop
  }//randInts

  void display() {
    int x = 0;
    int barWidth = width/dataSize;
    for(int i=0; i<haystack.length; i++) {
      fill(255);
      if (algorithm == BUBBLE && i >= bsortStart) {
        fill(255, 0, 255);
      }//color sorted area
      rect(x, height, barWidth, -haystack[i]);
      x+= barWidth;
    }//loop through array
    if ( !sorted ) {
      sortHighLights();
    }
  }//drawValues

  void sortHighLights() {
    int barWidth = width/dataSize;

    if (algorithm == BUBBLE) {
      fill(255, 255, 0);
      rect(barWidth*bsortPos0, height, barWidth, -haystack[bsortPos0]);
      if (bsortPos1 < bsortStart) {
        rect(barWidth*bsortPos1, height, barWidth, -haystack[bsortPos1]);
      }
    }//bubble sort highlights

  }//sortHighLights

}//sortArray

//
// void searchHighlight(int[] data, int pos, int barWidth) {
//   fill(255, 0, 255);
//   rect(barWidth*pos, height, barWidth, -data[pos]);
// }//highlightBar
