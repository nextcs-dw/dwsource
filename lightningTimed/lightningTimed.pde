void setup() {
  size (500, 500);
  background(#35388E);
  frameRate(30);
}//setup

void draw() {
  if (frameCount % 30 == 25) {
    background(255);
  }
  if (frameCount % 30 == 0) {
    background(#35388E);
    drawLightning(int(random(0, width)), 0, 40);
    println("strike: " + frameCount);
  }//if
}//draw


void drawLightning(int x, int y, int numParts) {

  stroke(255);
  strokeWeight(4);
  int count = 0;
  int nextx = x;
  int nexty = y;
  while (count < numParts) {
    nextx = int(random(x - 15, x + 15));
    nexty+= int(random(5, 20));
    line(x, y, nextx, nexty);
    x = nextx;
    y = nexty;
    count++;
  }//while
}//drawLightning
