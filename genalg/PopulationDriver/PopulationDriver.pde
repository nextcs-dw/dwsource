//Gene sizes
int CHROMOSOME_LENGTH = 6;
int SIDES_GENE_LENGTH = 5;
int SIZE_GENE_LENGTH = 6;
int SPIN_GENE_LENGTH = 4;
int COLOR_GENE_LENGTH = 8;
//Gene indexes
int SIDES_IND = 0;
int SIZE_IND = 1;
int SPIN_IND = 2;
int RED_IND = 3;
int GREEN_IND = 4;
int BLUE_IND = 5;

//population values
int POP_COLS = 6;
int POP_ROWS = 5;
//provides a little space between individuals
int OFFSET = 1;
int POP_SIZE = POP_COLS * POP_ROWS;
//base the size for displaying on the max possible value from the gene
int MAX_SIZE = int(pow(2,  SIZE_GENE_LENGTH+1) - 1);

float DEFAULT_MUTATION_RATE = 0.05;

Population pop;
Individual target;
boolean faces;

//This allows you to set the size dynamically.
void settings() {
  size(POP_COLS*MAX_SIZE + (POP_COLS-1)*OFFSET,
       POP_ROWS*MAX_SIZE + (POP_ROWS-1)*OFFSET);
}//settings
void setup() {
  faces = false;
  reset();
}//setup

void draw() {
  background(255);
  pop.drawPopGrid(POP_COLS, POP_ROWS, MAX_SIZE, OFFSET, faces);
}//draw

void keyPressed() {
  if (key == ' ') {
    reset();
  }
  if (key == 's') {
    faces = !faces;
  }
}

void reset() {
  pop = new Population(POP_SIZE);
  target = pop.omitted;
  pop.setFitness(target);

  println("Best fitness: " + pop.getBestFitness());
  println("Average fitness: " + pop.getAvgFitness());
}
