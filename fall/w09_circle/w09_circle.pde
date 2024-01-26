int xpos, ypos;
int csize;
int xspeed;
int yspeed;

void setup() {
  size(400, 500);
  csize = 40;
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
  circle(xpos, ypos, csize);
  if (frameCount % 30 == 0) {
    xpos+= xspeed;
  }//move once per second

  if (xpos + csize/2 > width) {
    xpos = width - csize/2;
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
