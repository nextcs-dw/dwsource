/* ===================================
PathShape
This is mostly the class we have been
working on with the following changes:

New methods:
  boolean isValidShape()
  void setColor()
  String toString

Modified methods:
  Full parameter constructor
  display()
=================================== */
class PathShape {

  ArrayList<PVector> points;
  int numPoints;
  PVector corner;
  int shapeSize;
  color inside;
  float area;
  PVector centroid;

  /* ===================================
  Full Parameter Constructor

  Set instance vairables appropriately.
  Call makeRandomShape() and any other
  methods needed to set up a shape.

  New:
    Call setColor()
  =================================== */
  PathShape(int np, int cx, int cy, int ss) {
    numPoints = np;
    corner = new PVector(cx, cy);
    shapeSize = ss;
    inside = color(255 );
    points = new ArrayList<PVector>();
    area = 0;
    makeRandomShape();
    setArea();
    setCentroid();
    setColor();
  }

  /* ===================================
  Numpoints Constructor (no changes)

  Create a shape that takes up the whole
  screen with the provided number of points.
  =================================== */
  PathShape(int np) {
    this(np, 0, 0, width);
  }//num points constructor

  /* ===================================
  Default Constructor (no changes)

  Create a shape that takes up the whole
  screen with a random number of points.
  =================================== */
  PathShape() {
    this(int(random(3, 20)));
  }//default constructor


  /* ===================================
  isValidShape (NEW)

  Retrun true if the centroid is with the bounds
  of the shape, false otherwise.
  =================================== */
  boolean isValidShape() {
    return (centroid.x >= corner.x && centroid.x < corner.x + shapeSize) &&
    (centroid.y >= corner.y && centroid.y < corner.y + shapeSize);
  }

  /* ===================================
  setColor (NEW)

  Set color to cyan (0, 255, 255) if the
  shape is valid or magenta (255, 0, 255)
  otherwise.
  =================================== */
  void setColor() {
    if (isValidShape()) {
      inside = color(0, 255, 255);
    }
    else {
      inside = color(255, 0, 255);
    }
  }//setColor

  /* ===================================
  String toString (NEW)

  return "Pathshape" and the number of
  points.
  =================================== */
  String toString() {
    return "PathShape: " + numPoints;
  }//toString

  /* ===================================
  display() (MODIFY)

  Draw the shape.

  New:
    Only draw the centroid if it is within
    the boundry of the shape object.

    Draw the result of toString at the top
    of the area that defines the shape.
    The string should be white and size 15.
  =================================== */
  void display() {
    fill(inside);
    // stroke(border);
    beginShape();
    for (int p=0; p < numPoints; p++) {
      vertex(points.get(p).x, points.get(p).y);
    }//loop over vertices
    endShape(CLOSE);

    if (centroid.x >= corner.x && centroid.x < corner.x+shapeSize &&
      centroid.y >= corner.y && centroid.y < corner.y+shapeSize) {
        fill(255, 255, 0);
        circle(centroid.x, centroid.y, 5);
    }//centroid in bounds
    textAlign(LEFT, TOP);
    fill(255);
    textSize(15);
    text(this.toString(), corner.x, corner.y);
  }//display


  /* ===================================
  makeRandomShape (no changes)

  Create a shape of numPoints random points.
  =================================== */
  void makeRandomShape() {
    for (int p=0; p < numPoints; p++) {
      points.add( makeRandomPoint() );
    }
  }//makePoints

  /* ===================================
  makeRandomPoint (no changes)

  Return a random valid point for this shape.
  =================================== */
  PVector makeRandomPoint() {
    PVector newPoint = new PVector();
    newPoint.x = int(random(shapeSize)) + corner.x;
    newPoint.y = int(random(shapeSize)) + corner.y;
    return newPoint;
  }//makeRandomPoint

  /* ===================================
  setArea (no changes)

  Set area to the signed area of the shape.
  =================================== */
  void setArea() {
    area = 0;
    for (int p=0; p < numPoints; p++) {
      PVector p0 = points.get(p);
      PVector p1;
      if (p < numPoints - 1) {
        p1 = points.get(p+1);
      }
      else {
        p1 = points.get(0);
      }
      area+= (p0.x * p1.y) - (p1.x * p0.y);
    }//loop over points
    area = area/2;
  }//setArea

  /* ===================================
  setCentroid (no changes)

  Set the centroid of the shape.
  =================================== */
  void setCentroid() {
    float sumX = 0;
    float sumY = 0;
    for (int i=0; i < numPoints; i++) {
      PVector p0 = points.get(i);
      PVector p1;
      //use point 0 if at the end of the list.
      if (i == numPoints - 1) {
        p1 = points.get(0);
      }
      else {
        p1 = points.get(i+1);
      }
      sumX += (p0.x + p1.x) * ((p0.x * p1.y) - (p1.x * p0.y));
      sumY += (p0.y + p1.y) * ((p0.x * p1.y) - (p1.x * p0.y));
    }
    centroid = new PVector(sumX / (6*area), sumY / (6*area));
  }//setCentroid


}//PathShape
