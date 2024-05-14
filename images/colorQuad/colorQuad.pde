PImage art;

void setup() {
  size(800, 600);
  art = loadImage("data/art.jpg");
  art.loadPixels();
}//setup

void draw() {
  image(art, 0, 0);
}//draw

void keyPressed() {
  if (key == 'r') {
    art = loadImage("data/art.jpg");
  }
  if (key == 'q') {
    colorQuad(art);
    art.updatePixels();
  }
}//keyPressed

int getIndex(PImage img, int x, int y) {
  return y * img.width + x;
}//getIndex


void colorQuad(PImage img) {
  for (int x=0; x < img.width; x++) {
    for (int y=0; y < img.height; y++) {
      int i = getIndex(img, x, y);
      color c = img.pixels[i];
      if (x < img.width/2 && y < img.height/2) {
        c = color(red(c), green(c), 0);
      }
      else if (x >= img.width / 2 && y < img.height/2) {
        c = color(red(c), 0, blue(c));
      }
      else if (x < img.width/2 && y >= img.height/2) {
        c = color(0, green(c), blue(c));
      }
      img.pixels[i] = c;
    }
  }
}//colorQuad
