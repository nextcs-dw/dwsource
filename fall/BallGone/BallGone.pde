color SAFE_COLOR = color(0, 255, 255);
color COLLISION_COLOR = color(255, 0, 255);

boolean moving;
Ball[] balls;

void setup() {
  size(400, 400);

  balls = new Ball[30];
  makeBalls(balls);
  moving = true;
}//setup

void draw() {
  background(0);
  if ( emptyArray(balls) ) {
    makeBalls(balls);
  }
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
    if (bs[i] != null) {
      bs[i].display();
    }
  }
}//showBalls

void moveBalls(Ball[] bs) {
  for (int i=0; i < bs.length; i++) {
    if (bs[i] != null) {
      bs[i].move();
    }
  }
}//moveBalls

void collisionCheck(Ball[] bs) {
  for (int i=0; i<bs.length - 1; i++) {
    for (int j=i+1; j<bs.length; j++) {

      if (bs[i] != null && bs[j] != null &&
           bs[i].collisionCheck(bs[j])) {
        bs[i] = null;
        bs[j] = null;
      }//check for collision
    }
  }
}//collisionCheck

boolean emptyArray(Ball[] bs) {
  for (int i=0; i<bs.length; i++) {
    if (bs[i] != null) {
      return false;
    }//found an object!
  }
  return true;
}//arrayCheck
