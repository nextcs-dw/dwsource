class Ball {

  //instance variables
  int bx;
  int by;
  int xspeed;
  int yspeed;
  int bsize;
  color c;

   //constructor
   Ball(int x, int y, int s) {
     bx = x;
     by = y;
     xspeed = 1;
     yspeed = 1;
     bsize = s;
     c = SAFE_COLOR;
   }

   //default constructor
   Ball() {
     bsize = int(random(40)) + 20;
     bx = int(random(width - bsize)) + bsize/2;
     by = int(random(height - bsize)) + bsize/2;
     xspeed = int(pow(-1, int(random(2))));
     yspeed = int(pow(-1, int(random(2))));
     c = SAFE_COLOR;
   }

  boolean collisionCheck(Ball other) {
    return ( this != other &&
            dist(this.bx, this.by, other.bx, other.by)
              <= (this.bsize/2 + other.bsize/2) );
  }//collisionCheck

  void setColor(color newC) {
    c = newC;
  }//setColor

  //visual behavior
  void display() {
    fill(c);
    circle(bx, by, bsize);
  }//display

  //visual behavior
  void display(int i) {
    fill(c);
    circle(bx, by, bsize);
    fill(0);
    textAlign(CENTER, CENTER);
    text(i, bx, by);
  }//display

  //movement behavior
  void move() {
    if (bx >= width - bsize/2 ||
        bx <= bsize/2) {
        xspeed*= -1;
     }
     if (by >= height - bsize/2 ||
         by <= bsize/2) {
         yspeed*= -1;
      }
     bx+= xspeed;
     by+= yspeed;
  }//move

}//Ball
