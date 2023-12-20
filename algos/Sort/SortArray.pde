class SortArray {

  int[] haystack;
  int maxValue;
  int algorithm;
  boolean sorted;

  //bubble sort vars
  int bsortEnd; //the last position to check when making a pass
  int bsortPos0; //the first position to compare each time
  int bsortPos1; //the second position to compare each time

  //Selection sort vars
  int ssortEnd; //the last position to check when making a pass
  int ssortPos; //the current position to check
  int ssortMaxPos; //the position of the largest value so far

  SortArray(int algo, int dsize, int mvalue) {
    maxValue = mvalue;
    haystack = new int[dsize];
    randInts();
    resetSortVars();
    algorithm = algo;
  }//constructor

  void resetSortVars() {
    sorted = false;
    //bubble sort vars
    bsortPos0 = 0;
    bsortPos1 = 1;
    bsortEnd = haystack.length;

    //selection sort vars
    ssortEnd = haystack.length;
    ssortPos = 1;
    ssortMaxPos = 0;
  }//resetSortVars

  void sortOnce() {
    if (algorithm == BUBBLE) {
      bubbleSortOnce();
    }
    else if (algorithm == SELECTION) {
      SelectionSortOnce();
    }
  }//sortOncec

  void bubbleSortOnce() {

    //if we haven't gotten to the front, we need to sort

      //if we haven't reached the sorted portion, keep going

        //if the test values are out of order, swap 'em

        //move test positions over

      //if we've reached the sorted portion
      //rest for the next pass

    //if we did reach the front, set sorted to true

  }//bubbleSortOnce


  void SelectionSortOnce() {

  }//selectionSortOnce



  /*
  Utility Functions, Leave Alone
  */
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

  void showStats() {
    fill(255);
    textAlign(LEFT, TOP);
    if (algorithm == BUBBLE) {
      text("Bubble Sort", 0, 0);
    }
    else if (algorithm == SELECTION) {
      text("Selection Sort", 0, 0);
    }
  }//showStats

  void display() {
    int x = 0;
    int barWidth = width/dataSize;
    for(int i=0; i<haystack.length; i++) {
      fill(255);
      if (algorithm == BUBBLE && i >= bsortEnd ||
          algorithm == SELECTION && i >= ssortEnd) {
        fill(255, 0, 255);
      }//color sorted area
      rect(x, height, barWidth, -haystack[i]);
      x+= barWidth;
    }//loop through array
    if ( !sorted ) {
      sortHighLights();
    }
    showStats();
  }//drawValues

  void sortHighLights() {
    int barWidth = width/dataSize;

    if (algorithm == BUBBLE) {
      fill(255, 255, 0);
      rect(barWidth*bsortPos0, height, barWidth, -haystack[bsortPos0]);
      rect(barWidth*bsortPos1, height, barWidth, -haystack[bsortPos1]);
    }//bubble sort highlights

    if (algorithm == SELECTION) {
      fill(255, 255, 0);
      rect(barWidth*ssortPos, height, barWidth, -haystack[ssortPos]);
      fill(0, 255, 255);
      rect(barWidth*ssortMaxPos, height, barWidth, -haystack[ssortMaxPos]);
    }//bubble sort highlights
  }//sortHighLights

}//sortArray
