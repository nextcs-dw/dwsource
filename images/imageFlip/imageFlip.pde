PImage art;

void setup() {
  size(600, 800);
  art = loadImage("data/dylan.jpg");
  art.loadPixels();
}//setup

void draw() {
  image(art, 0, 0);
}//draw

void keyPressed() {
  if (key == 'r') {
    art = loadImage("data/dylan.jpg");
  }
  if (key == 'h') {
    art = horizontalFlip(art);
  }
  if (key == 'v') {
    art = verticalFlip(art);
  }
  if (key == 'm') {
    art = mirror(art);
  }
}//keyPressed

int getIndex(PImage img, int x, int y) {
  return y * img.width + x;
}//getIndex

PImage horizontalFlip(PImage pic) {
  PImage newPic = createImage(pic.width, pic.height, RGB);
  newPic.loadPixels();
  for (int x=0; x < pic.width; x++) {
    for(int y=0; y < pic.height; y++) {

      int picIndex = getIndex(pic, x, y);
      int newIndex = getIndex(pic, width-x-1, y);

      newPic.pixels[newIndex] = pic.pixels[picIndex];
    }//for y
  }//for x
  newPic.updatePixels();
  return newPic;
}//horizontalFlip

PImage verticalFlip(PImage pic) {
  PImage newPic = createImage(pic.width, pic.height, RGB);
  newPic.loadPixels();
  for (int x=0; x < pic.width; x++) {
    for(int y=0; y < pic.height; y++) {

      int picIndex = getIndex(pic, x, y);
      int newIndex = getIndex(pic, x, height-y-1);

      newPic.pixels[newIndex] = pic.pixels[picIndex];
    }//for y
  }//for x
  newPic.updatePixels();
  return newPic;
}//horizontalFlip

PImage mirror(PImage pic) {
  PImage newPic = createImage(pic.width, pic.height, RGB);
  newPic.loadPixels();
  for (int x=0; x < pic.width; x++) {
    for(int y=0; y < pic.height; y++) {

      int picIndex = getIndex(pic, x, y);
      int newIndex = getIndex(pic, width-x-1, y);

      if (x < pic.width/2) {
        newPic.pixels[picIndex] = pic.pixels[picIndex];
      }
      else {
        newPic.pixels[picIndex] = pic.pixels[newIndex];
      }
    }//for y
  }//for x
  newPic.updatePixels();
  return newPic;
}//horizontalFlip
