//Program made by Victor Permild (vbpe@itu.dk) for AIR Lab Workshop #1: Interactive Spaces with Kinect and Processing.

//Kinect setup. No need to change anything here :)
import oscP5.*;
import netP5.*;
OscP5 oscP5;
NetAddress myRemoteLocation;

//Define global variables below:
float controllerX, controllerY;
float size = 100;

//Set the amount of rows and columns for the grid
int rows = 4, cols = 4;
Area[][] areas = new Area[rows][cols];

void setup() {
  //Choose if you want to use size() or fullscreen(). 
  //Comment the counterpart out, as these two function cannot run at the same time.
  size(800, 500);
  //fullScreen();

  //Kinect setup
  startKinectOSC();

  //Uncomment function below to hide the mouse pointer
  //noCursor();

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
