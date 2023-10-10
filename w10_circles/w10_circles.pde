int xpos, ypos;
int csize;
int xspeed;
int yspeed;
int circCount;

void setup() {
  size(400, 500);
  csize = 40;
  circCount = 4;
  xpos = csize/2;
  ypos = csize/2;
  xspeed = csize;
  yspeed = csize;
  frameRate(30);
  stroke(255);
}//setup

void draw() {
  background(0);
  drawGridLines(csize);
  circleRow(xpos, ypos, csize, circCount);
  if (frameCount % 30 == 0) {
    xpos+= xspeed;
  }//move once per second

  //entire row is length (csize*circCount) but
  //need to be offset by csize/2 to account for
  //the center of the circle on the edge.
  if (xpos + (circCount * csize) - csize/2 > width) {
    xpos = width - (circCount * csize) + csize/2;
    ypos+= yspeed;
    xspeed*= -1;
  }//hit right side, move down & reverse

  if (xpos - csize/2 < 0) {
    xpos = csize/2;
    ypos+= yspeed;
    xspeed*= -1;
  }//hit left side, move down & reverse
  //saveFrame("data/" + nf(frameCount, 4) + ".png");
}//draw

void circleRow(int x, int y, int d, int numCircles) {
  for (int c=0; c < numCircles; c++) {
    circle(x, y, d);
    x+= d;
  }//for circles
}//circleRow

void drawGridLines(int spacing) {
  int gx, gy;
  gx = spacing;
  gy = spacing;

  while (gx < width) {
    line(gx, 0, gx, height);
    gx+= spacing;
  }//vertical lines
  while (gy < height) {
    line(0, gy, width, gy);
    gy+= spacing;
  }//horizontal lines

}//drawGridLines
