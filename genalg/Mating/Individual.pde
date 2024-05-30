class Individual {


  RegularGon phenotype;
  Gene[] chromosome;
  float fitness;


  Individual(boolean random) {

    chromosome = new Gene[CHROMOSOME_LENGTH];

    if (random) {
      chromosome[SIDES_IND] = new Gene(SIDES_GENE_LENGTH);
      chromosome[SIZE_IND] = new Gene(SIZE_GENE_LENGTH);
      chromosome[SPIN_IND] = new Gene(SPIN_GENE_LENGTH);
      chromosome[RED_IND] = new Gene(COLOR_GENE_LENGTH);
      chromosome[GREEN_IND] = new Gene(COLOR_GENE_LENGTH);
      chromosome[BLUE_IND] = new Gene(COLOR_GENE_LENGTH);

      setPhenotype();
    }
  }//constructor

  void mutate(float rate) {
    for (int g=0; g < CHROMOSOME_LENGTH; g++) {
      if (random(1) < rate) {
        chromosome[g].mutate();
        setPhenotype();
      }
    }
  }//mutate

  void setPhenotype() {
    int sides = chromosome[SIDES_IND].value;
    int siz = chromosome[SIZE_IND].value;
    float spin = chromosome[SPIN_IND].value - 7;
    color c = color(chromosome[RED_IND].value, chromosome[GREEN_IND].value, chromosome[BLUE_IND].value);
    phenotype = new RegularGon(sides, siz, spin, c);
  }

  Individual mate(Individual partner) {

    Individual child = new Individual(false);
    Individual parents[] = {this, partner};
    int currentParent = int(random(2));
    int crossoverPoint = int(random(CHROMOSOME_LENGTH));
    for (int g=0; g < CHROMOSOME_LENGTH; g++) {
      if (g == crossoverPoint) {
        currentParent = (currentParent+1)%2;
      }
      child.chromosome[g] = new Gene(parents[currentParent].chromosome[g]);
    }
    child.setPhenotype();
    return child;
  }//mate

  void setFitness(Individual other) {

  }//setFitness


  void display(int x, int y, boolean showSmile) {
    phenotype.display(x, y, showSmile);
    textSize(15);
    fill(0);
    textAlign(CENTER);
    text(fitness, x, y);
  }//display()

  String toString() {
    String s = "";
    for (int i=0; i<CHROMOSOME_LENGTH; i++) {
      s+= chromosome[i] + "\n";
    }
    return s;
  }//toString()

}//Individual
