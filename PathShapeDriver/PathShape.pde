class PathShape {

  ArrayList<PVector> points;
  int numPoints;
  PVector corner;
  int shapeSize;
  color inside;
  float area;

  PathShape(int np, int cx, int cy, int ss) {
    numPoints = np;
    corner = new PVector(cx, cy);
    shapeSize = ss;
    inside = color(255 );
    points = new ArrayList<PVector>();
    area = 0;
    makeRandomShape();
  }

  //makes a single PathShape with np points
  //that takes up the entire screen
  PathShape(int np) {
    this(np, 0, 0, width);
  }//num points constructor

  PathShape() {
    this(int(random(3, 20)));
  }//default constructor


  void makeRandomShape() {
    for (int p=0; p < numPoints; p++) {
      points.add( makeRandomPoint() );
    }
    setArea();
    if (area < (shapeSize ) ) {
      inside = color(255, 0, 255);
    }
    else {
      inside = color(0, 255, 255);
    }
  }//makePoints

  void display() {
    fill(inside);
    // stroke(border);
    beginShape();
    for (int p=0; p < numPoints; p++) {
      vertex(points.get(p).x, points.get(p).y);
    }//loop over vertices
    endShape(CLOSE);
  }//display

  PVector makeRandomPoint() {
    PVector newPoint = new PVector();
    newPoint.x = int(random(shapeSize)) + corner.x;
    newPoint.y = int(random(shapeSize)) + corner.y;
    return newPoint;
  }//makeRandomPoint

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
}//PathShape
