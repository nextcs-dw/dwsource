String s0 = "tcgcagctcgaaccactatg";
String s1 = "agcgtcgagcttggtgatac";
String s2 = "atcgtccagctatgtgatac";
String s3 = "caatcacctgagtatcgcga";

int NUC_SIZE = 30;

void setup() {
  size(800, 200);
  background(0);
  textAlign(CENTER, CENTER);

  strandCompare(s0, s1, 0, 0, NUC_SIZE);

  strandCompare(s0, s2, 0, NUC_SIZE*3, NUC_SIZE);

  //strandMatch tests
  println(strandMatch(s0, s1)); //correct match
  println(strandMatch(s0, s0)); //strand should not match itself
  println(strandMatch(s0, s2)); //mismatch
}//setup

void strandCompare(String strand0, String strand1, int x, int y, int sz) {
  //set strands to upper case to avoid any confusion
  strand0 = strand0.toUpperCase();
  strand1 = strand1.toUpperCase();

  //draw both strands
  drawStrand(strand0, x, y, sz);
  drawStrand(strand1, x, y+sz, sz);

  //draw any mismatch squares
  noFill();
  stroke(255, 0, 0);
  strokeWeight(2);
  for(int b=0; b < strand0.length(); b++) {
    if ( !basePairMatch(strand0.charAt(b), strand1.charAt(b)) ) {
      rect(x, y, sz, sz*2);
    }//base par mismtch
    x+= sz;
  }//loop through base pairs
}//strandCompare


boolean strandMatch(String strand0, String strand1) {
  //set strands to upper case to avoid any confusion
  strand0 = strand0.toUpperCase();
  strand1 = strand1.toUpperCase();
  if (strand0.length() != strand1.length()) {
    return false;
  }//size mismatch

  for(int b=0; b < strand0.length(); b++) {
    if ( !basePairMatch(strand0.charAt(b), strand1.charAt(b)) ) {
      return false;
    }//base par mismtch
  }//loop through base pairs
  return true;
}//strandMatch

boolean basePairMatch(char b0, char b1) {
  if ((b0 == 'A' && b1 == 'T') || (b0 == 'T' && b1 == 'A')) {
    return true;
  }//AT
  if ((b0 == 'C' && b1 == 'G') || (b0 == 'G' && b1 == 'C')) {
    return true;
  }//CG
  return false;
}//basePairMatch

void drawStrand(String dna, int x, int y, int sz) {
  dna = dna.toUpperCase();
  for (int i=0; i<dna.length(); i++) {
    drawBase(dna.charAt(i), x, y, sz);
    x+= sz;
  }//loop through chars
}//drawStrand

void drawBase(char base, int x, int y, int sz) {
  noStroke();
  fill(charToColor(base));
  square(x, y, sz);

  fill(255);
  textSize(sz);
  text(base, x+sz/2, y+sz/2);
}//drawBase


color charToColor(char c) {
  color col = color(0);
  if (c == 'A') {
    col = #fa3737;//#F5793A;
  }
  else if (c == 'T') {
    col = #7c0000;//#A95AA1;
  }
  else if (c == 'C') {
    col = #85C0F9;
  }
  else if (c == 'G') {
    col = #0F2080;
  }
  return col;
}//charTocolor
