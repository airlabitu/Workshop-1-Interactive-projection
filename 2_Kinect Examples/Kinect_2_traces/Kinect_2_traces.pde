//Program made by Victor Permild (vbpe@itu.dk) for AIR Lab Workshop #1: Interactive Spaces with Kinect and Processing.

//Kinect setup. No need to change anything here :)
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myRemoteLocation;

//Define global variables below:
float controllerX, controllerY, previousX, previousY;
float size;

//Set the interval between each time the sketch wipes itself clean. Default is 15 seconds.
int cleanTimerInSeconds = 15;

void setup() {
  //Choose if you want to use size() or fullscreen(). 
  //Comment the counterpart out, as these two function cannot run at the same time.
  size(800, 500);
  //fullScreen();

  //Kinect setup
  startKinectOSC();

  //Uncomment function below to hide the mouse pointer
  //noCursor();

  //Set the background to black
  background(bgColor);
}

void draw() {
  //Create a blurring background effect
  noStroke();
  fill(bgColor, 1);
  rect(0, 0, width, height);

  //Change the controller's size depending on the volatility of its movement
  sizeChange = 0.2;
  if (controllerX != previousX || controllerY != previousY) {
    size += sizeChange;
  } else {
    size -= sizeChange;
  }

  //Make sure the controller does not disappear or become too large
  maxSize = height/8;
  minSize = maxSize/10;
  size = constrain(size, minSize, maxSize); 

  //Shows the actual position of the controller if toggled on (toggle with key '5')
  if (showTarget) {
    fill(0, 0, 255);
    ellipse(controllerX, controllerY, minSize*4, minSize*4);
  }

  //Display the controller
  fill(255, 0, 0);
  ellipse(easingX, easingY, size, size);

  //Keep this function at the bottom of draw()
  runFunctions();
}
