/*
  A Gene is designed to store "genetic" data for
  a single trait to be used in a genetic algorithm.

  The main part of the gene is the genotype, which
  is an array representation of a binary number. The
  length of the array will determine the number of digits
  and as a result, the maximum possible value of the Gene.
  So a Gene of legth 5 has a maximum value of
  11111 base 2, or 31.
*/

class Gene {

  int geneLength;
  int genotype[];
  //useful to have the value as an instance
  //variable so we don't have to repeatedly
  //convert the array to a number.
  int value;

  /*
    Generate a new gene of the given length.
    Initilize geneLength and the array accordingly.
    Randomly populate the gene with 1s or 0s.

    Call setValue() once the array has been populated.
  */
  Gene(int gl) {
      geneLength = gl;
      genotype = new int[geneLength];
      for (int i=0; i < geneLength; i++) {
        genotype[i] = int(random(2));
      }//random loop
      setValue();
  }//constructor

  /*
    Create a new Gene that is a copy of the
    parameter. Remember that arrays behave
    like objects, so you cant do this:
      genotype = g.genotype.
  */
  Gene(Gene g) {
    geneLength = g.geneLength;
    genotype = new int[geneLength];
    arrayCopy(g.genotype, genotype);
    setValue();
  }

  void setValue() {
    value = 0;
    for (int i=0; i < geneLength; i++) {
      int bit = genotype[i];
      value+= int( bit * pow(2, i));
    }//random loop
  }//setValue

  void mutate() {
    int r = (int)random(geneLength);
    genotype[r] = (genotype[r] + 1) % 2;
    setValue();
  }//mutate

  String toString() {
    String s = "";
    for (int i=0; i<geneLength; i++) {
      s+= genotype[i];
    }
    s+= " " + value;
    return s;
  }//toString

} //Gene
