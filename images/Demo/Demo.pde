PImage art;

void setup() {
  size(800, 600);

  art = loadImage("art.jpg");

  art.loadPixels();

  image(art, 0, 0);
}

void draw() {
  background(0);
  //for (int p=0; p < art.pixels.length; p++) {
  for (int x=0; x < art.width; x++) {
    for (int y=0; y < art.height; y++) {
      
      int p = x + y*art.width;
      color c = art.pixels[p];
      if ( x >= art.width/2) {
        color newC = color( red(c), green(c), frameCount % 256 );
        art.pixels[p] = newC;
      }
    }
  }
  art.updatePixels();
  image(art, 0, 0);
}

void keyPressed() {
  if (key == ' ') {
    art.save("pic.png");
  }
}
