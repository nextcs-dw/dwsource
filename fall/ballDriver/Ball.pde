class Ball {
  
  //instance variables
  int bx;
  int by;
  int xspeed;
  int yspeed;
  int bsize;
   
   //constructor
   Ball(int x, int y, int s) {
     bx = x;
     by = y;
     xspeed = 1;
     yspeed = 1;
     bsize = s;
   }
   
   //default constructor
   Ball() {
     bsize = 50;
     bx = int(random(width - bsize)) + bsize/2;
     by = int(random(height - bsize)) + bsize/2;
     xspeed = 1;
     yspeed = 1;
   }
   
  //visual behavior
  void display() {
    circle(bx, by, bsize);
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
