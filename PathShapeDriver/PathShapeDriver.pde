PathShape[] shapes;
PathShape demo;

void setup() {
  size(400, 400);
  shapes = new PathShape[4];
  makeShapes();
  drawShapes();
  //demo = new Polygon();
  //demo.display();
}//setup

 void draw() {
   background(255);
   drawShapes();
   //demo.display();
 }//draw


void makeShapes() {
  int shapeSize = 200;
  shapes[0] = new Polygon(10, 0, 0, shapeSize);
  //shapes[0] = new Polygon();
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
    //demo = new Polygon();
  }
}//keypressed
