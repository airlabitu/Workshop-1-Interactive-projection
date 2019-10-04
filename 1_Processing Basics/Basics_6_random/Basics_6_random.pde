float size = 100;
int x, y;

void setup() {
  // Put your setup code here, to run once:
  size(800, 500);

  //Set the background to RGB Black in setup, so the background does not refresh
  background(0);
}

void draw() {
  // Put your main code here, to run repeatedly:

  //background(0);

  x = mouseX;
  y = mouseY;

  if (x < width/2) {
    fill(255, 0, 0);
  } else {
    fill(0, 0, 255);
  }

  //Set upper an lower limit variables for our random size variable
  float minimumSize = 80;
  float maximumSize = 120;

  //Randomize the size of the ellipse within a given interval
  size = random(minimumSize, maximumSize);

  //Draw the ellipse
  ellipse(x, y, size, size);
}
