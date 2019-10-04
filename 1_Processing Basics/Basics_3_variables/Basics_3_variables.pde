//Set the size variable to 100 pixels
int size = 100;

//Define x and y as empty variables for later use
int x, y;

void setup() {
  // Put your setup code here, to run once:
  
  //Set the size of the sketch to 800 x 500 pixels
  size(800, 500);
}

void draw() {
  // Put your main code here, to run repeatedly:
  
  //Set the background color to RGB Black
  background(0);
  
  //Set x and y variables values
  x = 200;
  y = 100;
  
  //X and Y coordinates are drawn starting from the top left corner
  ellipse(x, y, size, size);
  ellipse(x+300, y, size/2, size/2);
  ellipse(x, y+300, size/2, size);
  rect(x+300, y+300, size, size/2);
}
