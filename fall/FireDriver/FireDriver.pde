//State variable constants
int DIRT = 0;
int FIRE = 1;
int BURNT = 2;
int GRASS = 3;

//Helpful color values
color DIRT_COLOR = #81582F;
color FIRE_COLOR = #F20C0C;
color BURNT_COLOR = #810707;
color GRASS_COLOR = #49B90D;

//Driver variables
boolean burning = false;
int grassDensity = 75;
int numTracts = 20;
int tractLength = 20;
Land[][] grid;


void setup() {
  size(600, 600);
  frameRate(10);
  grid = new Land[numTracts][tractLength];
  setupLand(grid, grassDensity);
  showLand(grid);
}//setup

void draw() {
  showLand(grid);
  if (burning) {
    burn(grid);
  }//burning
}//draw


void setupLand(Land[][] field, float density) {

}//setupLand

void showLand(Land[][] field) {
}//showLand


void burn(Land[][] field) {

}//liveFire



void keyPressed() {
  if (key == ' ') {
    burning = !burning;
  }//start burning
  else if (key == 'r') {
    burning = false;
    setupLand(grid, grassDensity);
  }
}//keyPressed
