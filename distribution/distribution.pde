/* ===================
  This program, when completed, will populate 2 arrays randomly
  using different techniques and draw them as bar graphs as they
  change over time

  This assignment is broken up into 3 parts. The code you
  need to complete each part is clearly labeled. Do not
  move to a new part until you have completed the previous
  ones.

  PART 0: Add 1 to a radomly chosen index of an array in draw().

  PART 1: Display 1 array as a bar graph with a specified y-coordinte
          for the baseline of all the bars.

  PART 2: Randomly select an index from a second array using a
          different technique (described bellow).

  PART 3: Draw both arrays as bar graphs on the same screen,
          splitting the screen in half.

  PART 4: Write a method to calculate the average  of the
          elements in an array.

  PART 5: Using the average method you wrote, draw a line on each
          bar graph across the screen at the average value.
  =================== */


/* ===================
 Global variables & setup()

 LEAVE THESE ALONE
 =================== */
int[] values0;
int[] values1;
int dataSize;
int ySplit;
int v0scaleFactor;
int v1scaleFactor;

void setup() {
  size(600, 400);
  dataSize = 20;
  ySplit = height/2;
  values0 = new int[dataSize];
  values1 = new int[dataSize];

  v0scaleFactor = 1;
  v1scaleFactor = 1;
}//setup



void draw() {
  background(255);

  /* PART 0
    Pick a random int that is a valid index
    in the array values0.
    The value at that index will then increase by 1.
  */
  int randIndex = int(random(values0.length));
  values0[randIndex]++;

  /* PART 1
    Use drawBars to draw a bar graph representing values0.
    The bottom of each bar should be at ySplit (this is
    set in setup() )

    You will have to modify drawBars below
  */
  drawBars(values0, width/values0.length, ySplit, v0scaleFactor);

  /* PART 2
    Pick 2 random ints in the range [0, values1.length/2).
    The sum of those 2 ints will be used as an index, and
    we will add 1 to values1 at at that index.
  */
  int v0 = int(random(values1.length))/2;
  int v1 = int(random(values1.length))/2;
  values1[v0 + v1]++;

  /* PART 3
    Use drawBars to draw a bar graph representing values1.
    The bottom of each bar should be at the bottom of the screen.

    After this point, your program should be drawing 2 bar graphs.
  */
  drawBars(values1, width/values1.length, height, v1scaleFactor);

  /* PART 4
    Complete getAverage below. Store the averages of
    each array in different variables.
  */
  float avg0 = getAverage(values0);
  float avg1 = getAverage(values1);
  //println("values0 average: " + avg0 + "\tvalues1 average: " + avg1);


  /* PART 5
    Draw 2 horizontal lines going acress the screen.

    One line should represent the average value of the elements
    in values0.

    One line should represent the average value of the elements in
    values1.

    The lines shoudl be draw over the matching bar graphs at the
    correct y-corrdinate.
  */
  line(0, ySplit-(avg0/v0scaleFactor), width, ySplit-(avg0/v0scaleFactor));
  line(0, height-(avg1/v1scaleFactor), width, height-(avg1/v1scaleFactor));

  if (getMaxValue(values0)/v0scaleFactor >= ySplit) {
    v0scaleFactor++;
  }
  if (getMaxValue(values1)/v1scaleFactor >= ySplit) {
    v1scaleFactor++;
  }
  //saveFrame("data/" + nf(frameCount, 4) + ".png");
}//draw

/* PART 1
  Currently, this method will successfully draw a
  bar graph representing the values in an array of ints.

  The base of each bar is currently the height of the screen.

  Modify this method to use yBaseline as the base of each bar
  instead.
*/
void drawBars(int[] data, int barWidth, int yBaseline, int scaleFactor) {
  int x = 0;
  for(int i=0; i<data.length; i++) {
    fill(255);
    rect(x, yBaseline, barWidth, -(data[i]/scaleFactor));
    fill(0);
    textAlign(CENTER, BASELINE);
    text(i, x+(barWidth/2), yBaseline);
    x+= barWidth;
  }//loop through array
}//drawValues

/* PART 4
  Complete this method, which should return the average
  of all the elements within the parameter array.
*/
float getAverage(int[] data) {
  float sum = 0;
  for(int i=0; i<data.length; i++) {
    sum+= data[i];
  }
  return sum/data.length;
}//getAverage

int getMaxValue(int[] data) {
  int max = data[0];
  for(int i=1; i<data.length; i++) {
    if (max < data[i]) {
      max = data[i];
    }//new max
  }//
  return max;
}//getMaxValue
