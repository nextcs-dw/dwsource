Die d0, d1;
int target;
int score;
boolean playing;

void setup() {
  size(200, 200);
  d0 = new Die(25, height/2 - 25, 50);
  d1 = new Die(125, height/2 - 25, 50);

  reset();
}//setup

void draw() {
  background(150);

  d0.display();
  d1.display();

  fill(0);
  textSize(50);
  textAlign(CENTER, TOP);
  if (playing) {
    if (target == 0) {
      text("no target", width/2, 0);
    }
    else {
      text("target: " + target, width/2, 0);
      text("score: " + score,  width/2, 150);
    }
  }//playing
  else {
    text("you lose",  width/2, 150);
  }//lost
}//draw


void keyPressed() {
  if (key == ' ' && playing) {
    int roll = 0;
    roll+= d0.roll();
    roll+= d1.roll();
    updateScore(roll);
  }//roll
  if (key == 'r') {
    reset();
  }
}//if keyPressed

void updateScore(int roll) {
  if (target == 0) {
    if (roll == 2) {
      playing = false;
    }//drat out
    if (roll != 7 && roll != 11) {
      target = roll;
    }//set the target
  }//target is not set
  else {
    if (roll == 7 || roll == 11) {
      playing = false;
    }//crap out
    else if (roll != target) {
      score+= roll;
    }//add to score
    else {
      target = 0;
    }//reset target
  }//target is set, play game
}//updateScore

void reset() {
  score = 0;
  target = 0;
  playing = true;
  d0.reset();
  d1.reset();
}//reset
