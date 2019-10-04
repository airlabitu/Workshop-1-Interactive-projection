int size = 100;
int x, y;

void setup() {
  // Put your setup code here, to run once:
  size(800, 500);
}

void draw() {
  // Put your main code here, to run repeatedly:
  
  background(0);
  
  //Connect the x and y values to the movement of the mouse
  x = mouseX;
  y = mouseY;
  
  //Draw the ellipse at our new X,Y coordinates
  ellipse(x, y, size, size);
 
}
