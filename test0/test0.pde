//globals
int py;
int speed;
int psize;

void setup() {
  size(400, 400);
  psize = 50;
  py = psize/2;
  speed = 1;
}//setup

void draw() {
  background(255);
  squareDiagonal(40);

  plus(width/2, py, psize);
  py+= speed;
  if (py + psize/2 > height ||
      py - psize/2 < 0 ) {
    speed*= -1;
  }//bounce
  if (py < height/2) {
    fill(0, 255, 0);
  }//top half fill
  else {
    fill(0, 0, 255);
  }//bottom half fill
}//draw


void plus(int x, int y, int ps) {
  int hs = ps / 2;
  line(x-hs, y, x+hs, y);
  line(x, y-hs, x, y+hs);
}//plus

void squareDiagonal(int sqsize) {
  int x = 0;
  int y = 0;
  while (x < width) {
    square(x, y, sqsize);
    x+= sqsize;
    y+= sqsize;
  }//while x is in the screen
}//squareDiagonal
