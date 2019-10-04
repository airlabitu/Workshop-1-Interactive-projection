float startSize = 100;
float size = startSize;
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

  //Set upper an lower limit variables for our random size variable
  float minimumSize = 60;
  float maximumSize = 140;


  //if mouse is on the left half of the sketch, make the size random;
  if (x < width/2) {
    size = random(minimumSize, maximumSize);
  }

  //Set a couple of variables for our lower and upper values for the fill colors
  float minColor = 50;
  float maxColor = 255;

  //If the current size is less than what it started out as, set the fill color to (semi)random grayscale colors
  if (size < startSize) {
    fill(random(minColor, minColor*3));
  }
  //Else fill the ellipse with pastel rainbow colors.
  else {
    fill(random(minColor*2, maxColor), random(minColor*2, maxColor), random(minColor*2, maxColor));
  }

  //Draw the ellipse
  noStroke();
  ellipse(x, y, size, size);
}

void keyReleased() {
  if (key == '1') {
    background(0);
  }
}
