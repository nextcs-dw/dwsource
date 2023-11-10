color SAFE_COLOR = color(0, 255, 255);
color COLLISION_COLOR = color(255, 0, 255);

boolean moving;
Ball b0, b1, b2;

void setup() {
  size(400, 400);

  b0 = new Ball();
  b1 = new Ball();
  moving = true;
}//setup

void draw() {
  background(0);
  b0.display();
  b1.display();
  b0.move();
  b1.move();
  if (b0.collisionCheck(b1)) {
    b0.setColor(COLLISION_COLOR);
    b1.setColor(COLLISION_COLOR);
  }
  else {
    b0.setColor(SAFE_COLOR);
    b1.setColor(SAFE_COLOR);
  }
  //saveFrame("data/" + nf(frameCount, 4) + ".png");
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
