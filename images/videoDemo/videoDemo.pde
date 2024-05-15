//first, get access to the processing video library
import processing.video.*;

//Capture is the class used to interact with the camera
Capture cam;

void setup() {
  //this is the preferred resolution for working with the camera.
  size(640, 480);

  //first we need to find the correct camera
  //this returns a list of all the available cameras on your computer.
  String[] cameras = Capture.list();
  if (cameras.length == 0) {
    println("No available cameras");
    exit();//if there aren't any cameras, stop the program
  }
  //print out all the avialable cameras
  else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println("" + i + ": " + cameras[i]);
    }
  }
  //initialize the capture object
  //if ther camera is not at index 0, change that here.
  cam = new Capture(this, cameras[0]);

  //start reading camera data
  cam.start();
}//setup

void draw() {
  //lets us know if the camrea has a new frame avialable.
  if (cam.available() == true) {
    //store the new frame in the Capture object
    cam.read();
  }
  //Capture is a subclass of PImage, so all PImage stuff
  //works here.
  image(cam, 0, 0);
}//draw
