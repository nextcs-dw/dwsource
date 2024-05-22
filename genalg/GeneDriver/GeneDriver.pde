int CHROMOSOME_LENGTH = 5;

Gene[] chromosome;
Gene[] chromosome1;

void setup() {

  chromosome = new Gene[CHROMOSOME_LENGTH];
  for (int i=0; i<chromosome.length; i++) {
    int gsize = int(random(3, 8));
    chromosome[i] = new Gene(gsize);
  }//make random Genes.

  println("random constructor test:");
  printArray(chromosome);

  chromosome1 = new Gene[chromosome.length];
  for (int i=0; i<chromosome.length; i++) {
    chromosome1[i] = new Gene(chromosome[i]);
  }//mutate each gene

  println("\ncopy constructor test (should be same as the array above)");
  printArray(chromosome1);

  for (int i=0; i<chromosome.length; i++) {
    chromosome[i].mutate();
  }//mutate each gene

  println("\nmutate test (first array should be the same, second should be mutated):");
  printArray(chromosome1);
  println();
  printArray(chromosome);

}//setup
