//Program made by Victor Permild (vbpe@itu.dk) for AIR Lab Workshop #1: Interactive Spaces with Kinect and Processing.

//Kinect setup. No need to change anything here :)
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myRemoteLocation;

//Global variables
float controllerX, controllerY, kinectX, kinectY, easingX, easingY;
float size;
boolean mouseControl = true, showBorder = true, easingOnController = false;

void setup() {
  /*
   I recommend using the size() function when prototyping with the mouse, and the fullscreen() function using the Kinect. 
   Comment the counterpart out, as these two function cannot run at the same time.
   */
   
  size(800, 500);
  //fullScreen();
  
  //Hide the mouse cursor as we open the sketch. Comment out/remove if needed
  noCursor();
  
  //Make sure the size of the of the controller (ellipse) is responsive to the size of the screen
  size = height/4;

  //Kinect setup
  startKinectOSC();
}

void draw() {
  background(0);
  
  //Display the controller
  fill(255);
  ellipse(controllerX, controllerY, size, size);

  //Keep this function at the bottom of draw()
  runFunctions();
}
