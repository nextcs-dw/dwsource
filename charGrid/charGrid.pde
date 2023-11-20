int NUM_ROWS = 6;
int NUM_COLS = 15;

char[][] grid;

void setup() {
  size(600, 300);

  grid = new char[NUM_ROWS][NUM_COLS];
  orderedChars(grid);
  printGrid(grid);

  drawGrid(grid);
  saveFrame("data/a17_charGrid.png");
}//setup

void draw() {
  background(0);
  drawGrid(grid);
}//draw

void keyPressed() {
  if (key == 'r') {
    randomLetters(grid);
  }//random letters
  if (key == 'o') {
    orderedChars(grid);
  }
  printGrid(grid);
}//keyPressed

void orderedChars(char[][] cd) {
  char d = 33;
  for (int r=0; r < cd.length; r++) {
    for (int c=0; c < cd[r].length; c++) {
      cd[r][c] = d;
      d++;
    }
  }
}//orderedChars

void randomLetters(char[][] cd) {
  for (int r=0; r < cd.length; r++) {
    for (int c=0; c < cd[r].length; c++) {
      cd[r][c] = char(int(random(26)) + 'A');
    }
  }
}//randomLetters

void printGrid(char[][] cd) {
  println("=======================");
  for (int r=0; r < cd.length; r++) {
    for (int c=0; c < cd[r].length; c++) {
      print(cd[r][c] + " ");
    }
    println();
  }
  println("=======================");
}//printGrid

void drawGrid(char[][] cd) {
  int charSize = width / NUM_COLS;
  textSize(charSize);
  textAlign(LEFT, TOP);
  for (int r=0; r < cd.length; r++) {
    for (int c=0; c < cd[r].length; c++) {
      text(cd[r][c], c * charSize, r * charSize);
    }
  }
}//drawGrid
