class RegularGon {

  //old RegularGon stuff
  ArrayList<PVector> points;
  int numPoints;
  int shapeSize;
  color inside;
  int radius;
  //new stuff
  float rotationSpeed;
  float displayAngle;

  RegularGon(int np, int ss, float rs, color c) {
    numPoints = np;
    shapeSize = ss;
    inside = c;
    points = new ArrayList<PVector>();
    rotationSpeed = rs;
    displayAngle = 0;
    makeShape();
  }//Polygon

  void makeShape() {
    
    for(int p=0; p < numPoints; p++) {
      float theta = radians((float(p)/numPoints) * 360);
      int x = int(shapeSize * cos(theta));
      int y = int(shapeSize * sin(theta));
      points.add(new PVector(x, y));
    }//generate points loop
  }//makeRandomShape

  String toString() {
    return "Regulargon: " + numPoints;
  }

  //coordinates for display are not inherent
  //to the shape. so provided here instead
  void display(int x, int y, boolean smiles) {
    fill(inside);

    pushMatrix();
    translate(x, y);
    displayAngle+= rotationSpeed;
    rotate(radians(displayAngle));

    beginShape();
    for (int p=0; p < numPoints; p++) {
      vertex(points.get(p).x, points.get(p).y);
    }//loop over vertices
    endShape(CLOSE);

    if (smiles) {
      //smiley!
      fill(255);
      stroke(0);
      circle(-20, -20, 20);
      circle(20, -20, 20);
      fill(0);
      circle(-20, -20, 5);
      circle(20, -20, 5);

      noFill();
      strokeWeight(4);
      arc(0, 20, 80, 24, 0, PI);
      strokeWeight(1);
    }

    popMatrix();

  }//display

}//RegularGon
