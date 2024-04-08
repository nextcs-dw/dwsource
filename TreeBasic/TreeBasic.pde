Tree oak;

void setup() {
  size(800, 500);

  oak = new Tree(width/2, 50, 5);
  oak.display(oak.root);

}//setup
