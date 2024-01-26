class Die {

  int dx;
  int dy;
  int value;
  int dsize;

  Die(int x, int y, int ds) {
    dx = x;
    dy = y;
    dsize = ds;
    value = 0;
  }//constructor

  void display() {
    fill(255);
    square(dx, dy, dsize);
    if (value != 0) {
      fill(0);
      textSize(dsize);
      textAlign(CENTER, CENTER);
      text(value, dx+dsize/2, dy+dsize/2);
    }//only show number once value is set
  }//display

  void reset() {
    value = 0;
  }//reset

  int roll() {
    value = int(random(6)) + 1;
    return value;
  }//roll

}//Die
