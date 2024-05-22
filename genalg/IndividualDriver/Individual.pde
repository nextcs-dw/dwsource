class Individual {


  RegularGon phenotype;
  Gene[] chromosome;
  float fitness;


  Individual(boolean random) {

  }//constructor

  void setPhenotype() {

  }

  Individual mate(Individual partner) {

    Individual child = new Individual(false);

    return child;
  }//mate


  void display(int x, int y, boolean showSmile) {

  }//display()

  String toString() {
    String s = "";
    return s;
  }//toString()

}//Individual
