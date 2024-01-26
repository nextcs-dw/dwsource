int dotDiameter;

void setup() {
  size(600, 400);
  background(0);
  stroke(255);
  dotDiameter = 10;
}//setup

void draw() {
  background(0);
  //plotLine(frameCount, 1, 0, dotDiameter);
  //plotParabola(frameCount, 0.05, 0, 0, dotDiameter);
  circle(frameCount, 100*sin(radians(frameCount)) + height/2, dotDiameter);
}//draw


void plotLine(int x, float m, float b, int csize) {
  float y = m * x + b;
  circle(x, y, csize);
}//plotLine

void plotParabola(int x, float a, float b, float c, int csize) {
  float y = a*x*x + b*x + c;
  circle(x, y, csize);
}//plotParabola
