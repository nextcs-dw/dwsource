class Population {

  Individual pop[];
  Individual omitted;
  int numIndividuals;
  float totalFitness;
  float mutationRate;

  Population(int popSize) {
    numIndividuals = popSize;
    pop = new Individual[numIndividuals];
    randomPop();
    omitted = pop[0];
    mutationRate = DEFAULT_MUTATION_RATE;
  }//constructor

  void randomPop() {
    for (int p=0; p < numIndividuals; p++) {
      pop[p] = new Individual(true);
    }
    omitted = null;
  }//randomPop


  Individual select() {
    return pop[0];
  }//select

  Population matingSeason(boolean keepBest) {
    Population nextGeneration = new Population( numIndividuals );
    
    return nextGeneration;
  }//matingSeason


  void drawPopGrid(int cols, int rows, int maxSize, int offset, boolean showSmile) {
    for (int p=0; p < numIndividuals; p++) {
      int x = (p % cols) * (maxSize + offset) + (maxSize + offset) / 2;
      int y = (p / cols) * (maxSize + offset) + (maxSize + offset) / 2;
      pop[p].display(x, y, showSmile);
    }
  }//drawPopGrid

  void setFitness(Individual target) {
    totalFitness = 0;
    omitted.fitness = 0;
    for (int p=0; p < numIndividuals; p++) {
      if (pop[p] != omitted) {
        pop[p].setFitness(target);
        totalFitness+= pop[p].fitness;
      }
    }
  }//setFitness

  int getBestIndex() {
    int best = 0;
    for (int p=1; p < numIndividuals; p++) {
      if (pop[p] != omitted) {
        if (pop[p].fitness > pop[best].fitness) {
          best = p;
        }
      }
    }
    return best;
  }//getBest

  float getBestFitness() {
    return pop[getBestIndex()].fitness;
  }//getBestFitness

  float getAvgFitness() {
    if (omitted == null)
      return totalFitness / numIndividuals;
    else
      return totalFitness / (numIndividuals-1);
  }

}//Population
