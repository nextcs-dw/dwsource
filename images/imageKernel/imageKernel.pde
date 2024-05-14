PImage art;
String IMAGE = "data/boats.jpg";
String mode = "normal";

float[][] edge = {
  {-1, -1, -1},
  {-1, 8, -1},
  {-1, -1, -1}
};
float[][] blur = {
  {0.111, 0.111, 0.111},
  {0.111, 0.111, 0.111},
  {0.111, 0.111, 0.111}
};


void setup() {
  size(800, 600);
  art = loadImage(IMAGE);
  art.resize(width, height);
  art.loadPixels();

  color[][] testNeighborhood = getNeighborColors(art, 0, 0);
  printNeighborhood(testNeighborhood);
}//setup

void draw() {
  image(art, 0, 0);

  textAlign(LEFT, TOP);
  fill(255);
  textSize(20);
  text(mode, 0, 0);
}//draw

void keyPressed() {
  if (key == 'r') {
    art = loadImage(IMAGE);
    art.resize(width, height);
    art.loadPixels();
    mode = "normal";
  }
  if (key == 'g') {
    art = grayscale(art);
    mode = "grayscale";
  }
  if (key == 'e') {
    art = applyKernel(edge, art);
    mode = "edge";
  }
  if (key == 'b') {
    art = applyKernel(blur, art);
    mode = "blur";
  }
}//keyPressed

int getIndex(PImage img, int x, int y) {
  return y * img.width + x;
}//getIndex

PImage grayscale(PImage img) {
  PImage newImg = createImage(img.width, img.height, RGB);
  newImg.loadPixels();
  for (int p=0; p<img.pixels.length; p++) {
    color c = img.pixels[p];
    int g = int((red(c) + green(c) + blue(c))/3);
    newImg.pixels[p] = color(g);
  }
  newImg.updatePixels();
  return newImg;
}//grayscale

void printNeighborhood(color[][] area) {
  for (int r=0; r<area.length; r++) {
    for (int c=0; c<area[r].length; c++) {
      print(" " + hex(area[r][c]) + " ");
    }
    println();
  }//array loop
}//printColorArray

color[][] getNeighborColors(PImage img, int x, int y) {
  color[][] neighborhood = new color[3][3];
  for (int nx=-1; nx < 2; nx++) {
    for (int ny=-1; ny < 2; ny++) {
      int ix = x + nx;
      int iy = y + ny;
      // use 0 for out-of-bounds
      if (ix < 0 || ix >= img.width ||
          iy < 0 || iy >= img.height) {
            neighborhood[ny+1][nx+1] = 0;
          }
      else {
        neighborhood[ny+1][nx+1] = img.pixels[getIndex(img, x+nx, y+ny)];
      }
    }//nx
  }//ny
  return neighborhood;
}//getNeighborColors

color processKernel(float[][] kernel, PImage img, int x, int y) {
  color[][] neighborhood = getNeighborColors(img, x, y);
  color nc = 0;

  return nc;
}//processKernel

PImage applyKernel(float[][] kernel, PImage img) {
  PImage newimg = createImage(img.width, img.height, RGB);
  newimg.loadPixels();



  newimg.updatePixels();
  return newimg;
}//applyKernel
