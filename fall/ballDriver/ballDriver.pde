boolean moving;
Ball b0, b1, b2;

void setup() {
  size(600, 400);

  b0 = new Ball(width/2, height/2, 50);
  b1 = new Ball();
  moving = true;
}//setup

void draw() {
  background(0);
  b0.display();
  b1.display();
  b0.move();
  b1.move();
}//draw

void keyPressed() {
  if (key == ' ') {
    moving = !moving;
  }
  if (keyCode == UP) {
  }
  if (key == 'r') {

  }
}//keyPressed
