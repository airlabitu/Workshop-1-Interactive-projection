int size = 100;
int x, y;

void setup() {
  // Put your setup code here, to run once:
  size(800, 500);
}

void draw() {
  // Put your main code here, to run repeatedly:
  
  background(0);
  
  x = mouseX;
  y = mouseY;
  
  //If x (our mouse) is on the left half of the sketch, make the ellipse fill RGB Red
  if(x < width/2){
    fill(255,0,0);
  }
  //Else make the ellipse fill RGB Blue
  else{
    fill(0,0,255);
  }
  
  //Draw the ellipse
  ellipse(x, y, size, size);
 
}
