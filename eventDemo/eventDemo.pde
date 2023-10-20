int p, c, r;


void setup() {
  size(400, 400);
  textSize(20);
  p = 0;
  c = 0;
  r = 0;

}//setup

void draw() {
  background(0);
  String s = "(" + mouseX + " " + mouseY + ")";
  s+= "\n" + mouseButton;
  text(s, width/2, height/2);

  s = "presses: " + p + "\nreleases: " + r + "\nclicks: " + c;
  text(s, 0, height/2);


}//draw

void mousePressed() {
  p++;
}//mousePressed
void mouseClicked() {
  c++;
}//mouseClicked
void mouseReleased() {
  r++;
}//mouseReleased

void keyPressed() {
  if (key == 'r') {
    p = 0;
    c = 0;
    r = 0;
  }
}//keyPressed
