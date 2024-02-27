/* ===================================
Polygon
This is mostly the class we have been
working on with with the following changes.

A Polygon is considered "Valid" if the distance
between its centroid and its center is less than
or equal to 10 pixels (check out the PVector
documentation for a useful method).

When drawn, we should see a 5 pixel large green
circle at the Polygon's center.

toString should return "Poylgon" and the number
of points.

Override the approrpiate methods to make thses
changes. Only add necessary code (do not rewrite
anything that is provided for you)
=================================== */

class Polygon extends PathShape {

  PVector center;
  int radius;

  Polygon(int np, int cx, int cy, int ss) {
    super(np, cx, cy, ss);
  }//Polygon

  void makeRandomShape() {

    radius = shapeSize/2;
    center = new PVector(corner.x + radius, corner.y + radius);

    for(int p=0; p < numPoints; p++) {
      float theta = radians((float(p)/numPoints) * 360);
      int r = int(random(radius));
      int x = int(r * cos(theta) + center.x);
      int y = int(r * sin(theta) +  center.y);
      points.add(new PVector(x, y));
    }//generate points loop
  }//makeRandomShape

  boolean isValidShape() {
    return center.dist(centroid) < 10;
  }

  String toString() {
    return "Polygon: " + numPoints;
  }

  void display() {
    super.display();
    fill(0, 255, 0);
    circle(center.x, center.y, 5);
  }
}//Polygon
