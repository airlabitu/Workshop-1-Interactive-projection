//Program made by Victor Permild (vbpe@itu.dk) for AIR Lab Workshop #1: Interactive Spaces with Kinect and Processing.

//Kinect setup. No need to change anything here :)
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myRemoteLocation;

//Global variables
float controllerX, controllerY, kinectX, kinectY, easingX, easingY, oldX, oldY;
float size, minSize, maxSize, sizeChange;
boolean mouseControl = true, showBorder = true, easingOnController = true, cleanSketch_auto = true, showTarget;

color bgColor = color(0);

//Set the interval between each time the sketch wipes itself clean
int cleanTimerInSeconds = 20;


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
  maxSize = height/8;
  minSize = maxSize/10;


  //Start the controller in the center of the sketch
  easingX = width/2;
  easingY = height/2;

  //Kinect setup
  startKinectOSC();

  background(bgColor);
}

void draw() {
  //Create a blurring background effect
  noStroke();
  fill(bgColor, 1);
  rect(0, 0, width, height);

  //Change the controller's size depending on the volatility of its movement
  sizeChange = 0.2;
  if (controllerX != oldX || controllerY != oldY) {
    size+=sizeChange;
  } else {
    size -= sizeChange/2;
  }

  //Make sure the controller does not disappear or become too large
  size = constrain(size, minSize, maxSize); 
  
  //Shows the actual position of the controller if toggled on (toggle with key '5')
   if (showTarget) {
    fill(0,0,255);
    ellipse(controllerX, controllerY, minSize*4, minSize*4);
  }
  
  //Display the controller
  fill(255, 0, 0);
  ellipse(easingX, easingY, size, size);

  //Keep this function at the bottom of draw()
  runFunctions();
}
