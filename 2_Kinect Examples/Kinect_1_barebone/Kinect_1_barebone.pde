//Program made by Victor Permild (vbpe@itu.dk) for AIR Lab Workshop #1: Interactive Spaces with Kinect and Processing.

//Kinect setup. No need to change anything here :)
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myRemoteLocation;

//Define global variables below:
float controllerX, controllerY;
float size = 100;

void setup() {
  //Choose if you want to use size() or fullscreen(). 
  //Comment the counterpart out, as these two function cannot run at the same time.
  size(800, 500);
  //fullScreen();

  //Kinect setup
  startKinectOSC();

  //Uncomment function below to hide the mouse pointer
  //noCursor();
}

void draw() {
  background(0);
  ellipse(controllerX, controllerY, size, size);

  //Keep this function at the bottom of draw()
  runFunctions();
}
