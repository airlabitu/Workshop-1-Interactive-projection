void setup() {
  // Put your setup code here, to run once:
  
  //Set the size of the sketch to 800 x 500 pixels
  size(800, 500);
}

void draw() {
  // Put your main code here, to run repeatedly:
  
  //Set the background color to RGB Black
  background(0);
  
  //X and Y coordinates are drawn from the top left corner
  ellipse(100, 100, 100, 100);
  ellipse(400, 100, 50, 50);
  ellipse(100, 400, 50, 100);
  rect(400, 400, 100, 50);
}
