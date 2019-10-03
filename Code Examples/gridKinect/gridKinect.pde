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
boolean showIDs = true, showGrid = true, showHighlight = true;

//Set the amount of rows and columns for the grid
int rows = 4, cols = 4;
Area[][] areas = new Area[rows][cols];

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

  //Initialize the grid
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      float cellWidth = width/rows;
      float cellHeight = height/cols;
      if (i == 0 && j == 0) {
        //println("Cell width: " + cellWidth + ", " + "Cell height: " + cellHeight);
      }
      areas[i][j] = new Area(i+(j*rows), i*cellWidth, j*cellHeight, cellWidth, cellHeight);
    }
  }

  //Kinect setup
  startKinectOSC();
}

void draw() {
  background(0);

  //Draw the cells of the grid
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < cols; j++) {
      areas[i][j].run();
    }
  }

  //Display the controller
  noFill();
  stroke(255);
  ellipse(controllerX, controllerY, size, size);

  //Keep this function at the bottom of draw()
  runFunctions();
}
