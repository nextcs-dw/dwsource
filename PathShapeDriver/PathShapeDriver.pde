PathShape[] shapes;

void setup() {
  size(400, 400);
  shapes = new PathShape[4];
  makeShapes();
  drawShapes();
  //saveFrame("a00-pathgrid.png");
}//setup

 void draw() {
   background(255);
   drawShapes();
 }//draw


void makeShapes() {
  int shapeSize = 200;
  shapes[0] = new PathShape(10, 0, 0, shapeSize);
  shapes[1] = new PathShape(10, shapeSize, 0, shapeSize);
  shapes[2] = new PathShape(10, 0, shapeSize, shapeSize);
  shapes[3] = new PathShape(10, shapeSize, shapeSize, shapeSize);
}//makeShapes

void drawShapes() {
  for (int s=0; s < shapes.length; s++) {
    shapes[s].display();
  }
}//drawShapes

void keyPressed() {
  if (key == ' ') {
    makeShapes();
  }
}//keypressed
