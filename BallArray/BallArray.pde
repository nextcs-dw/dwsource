color SAFE_COLOR = color(0, 255, 255);
color COLLISION_COLOR = color(255, 0, 255);

boolean moving;
Ball[] balls;

void setup() {
  size(400, 400);

  balls = new Ball[20];
  makeBalls(balls);
  moving = true;
}//setup

void draw() {
  background(0);
  showBalls(balls);
  if (moving) {
    moveBalls(balls);
    collisionCheck(balls);
    //saveFrame("data/" + nf(frameCount, 4) + ".png");
  }
}//draw

void keyPressed() {
  if (key == ' ') {
    moving = !moving;
  }
  if (key == 'r') {

  }
}//keyPressed

void makeBalls(Ball[] bs) {
  for (int i=0; i<bs.length; i++) {
    bs[i] = new Ball();
  }
}//makeBalls

void showBalls(Ball[] bs) {
  for (int i=0; i < bs.length; i++) {
    bs[i].display(i);
  }
}//showBalls

void moveBalls(Ball[] bs) {
  for (int i=0; i < bs.length; i++) {
    bs[i].move();
  }
}//moveBalls

void collisionCheck(Ball[] bs) {
  for (int i=0; i<bs.length; i++) {
    bs[i].setColor(SAFE_COLOR);
    for (int j=0; j<bs.length; j++) {
      if (bs[i].collisionCheck(bs[j])) {
        bs[i].setColor(COLLISION_COLOR);
      }//check for collision
    }
  }
}//collisionCheck
