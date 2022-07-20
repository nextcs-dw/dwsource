import processing.sound.*;
int fq = 1;
SinOsc sinWave;

int arr[];
int pos;
int smallPos;
int testPos;

boolean stepwise = false;

void setup() {
  size(400, 400);
  background(0);
  sinWave = new SinOsc(this);

  arr = randomArray(100);
  frameRate(60);
  pos = 0;
  smallPos = pos;
  testPos = smallPos + 1;

  if (stepwise) {
    noLoop();
  }
  else {
    sinWave.play();
  }
}//setup

void draw() {
  background(0);
  //if pos == length - 1, then we're sorted! display
  if (pos == arr.length-1) {
    displayArray(arr, -1, -1, -1);
    sinWave.stop();
  }
  //else
  else {
    displayArray(arr, pos, testPos, smallPos);
    if (!stepwise) {
      fq = arr[testPos];
      sinWave.freq(fq);
    }
    //compare elements at testPos and smallPos
    if (arr[testPos] < arr[smallPos]) {
    //if testPos element < smallPos element, update smallPos
      smallPos = testPos;
    }
    //move testPos over 1
    testPos++;

    //if testPos == length of the array
    if (testPos == arr.length) {
      //swap(pos, smallPos)
      swap(arr, pos, smallPos);
      //move pos over by 1
      pos++;
      //set testPos to pos + 1
      testPos = pos+1;
      //set smallPos to pos
      smallPos = pos;
    }
  }
}


void swap(int[] arr, int i0, int i1) {
  int t = arr[i0];
  arr[i0] = arr[i1];
  arr[i1] = t;
}//swap

int[] randomArray(int num) {
  int[] values = new int[num];

  for (int i=0; i<values.length; i++) {
    values[i] = int(random(100, 400));
  }//random value loop
  return values;
}//randomArray

void displayArray(int[] arr, int p, int tp, int sp) {
  int barWidth = width / arr.length;
  int x = 0;
  int y = 0;
  noStroke();
  for (int i=0; i<arr.length; i++) {
    y = height - arr[i];
    if (i == p ) {
      fill(230, 0, 230);
    }
    else if (i == tp) {
      fill(0, 230, 230);
    }
    else if (i == sp) {
      fill(230, 230, 0);
    }
    else {
      fill(255);
    }
    rect(x, y, barWidth, arr[i]);
    x+= barWidth;
  }
}//displayArray


void keyPressed() {
  if (key == 's' && stepwise) {
    stepwise = false;
    sinWave.play();
    loop();
  }
  else if (key == 's' && !stepwise) {
    stepwise = true;
    sinWave.stop();
    noLoop();
  }
  else if (stepwise) {
    redraw();
  }
}
