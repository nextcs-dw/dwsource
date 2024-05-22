int CHROMOSOME_LENGTH = 6;
int SIDES_GENE_LENGTH = 5;
int SIZE_GENE_LENGTH = 6;
int SPIN_GENE_LENGTH = 4;
int COLOR_GENE_LENGTH = 8;

int SIDES_IND = 0;
int SIZE_IND = 1;
int SPIN_IND = 2;
int RED_IND = 3;
int GREEN_IND = 4;
int BLUE_IND = 5;


Individual mom, dad, kid;

void setup() {
  size (600, 600);
  mom = new Individual(true);
  dad = new Individual(true);
  kid = mom.mate(dad);
}//setup

void draw() {
  background(255);
  mom.display(200, 200, false);
  dad.display(400, 200, false);
  kid.display(300, 300, false);
}//draw

void keyPressed() {
  if (key == ' ') {
    reset();
  }
}

void reset() {
  mom = new Individual(true);
  dad = new Individual(true);
  kid = mom.mate(dad);
}
