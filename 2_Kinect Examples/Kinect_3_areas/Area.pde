class Area {
  int id;
  float x, y, w, h, cx, cy;
  color c = color(0, 100, 255);

  Area(int _id, float _x, float _y, float _w, float _h) {
    id = _id;
    //println(id);
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    cx = x + w/2;
    cy = y + h/2;
  }

  void run() {
    strokeWeight(3);

    if (showGrid) {
      stroke(c);
    } else {
      noStroke();
    }

    if (showHighlight) {
      if (active()) {
        fill(c);
      } else {
        noFill();
      }
    } else {
      noFill();
    }

    rect(x, y, w, h);
    noStroke();

    if (showIDs) {
      fill(255);
      textSize(size/8);
      textAlign(CENTER);
      text(id, cx, cy);
    }
  }

  boolean active() {
    if (controllerX > x && controllerX <= x+w && controllerY > y && controllerY <= y+h) {
      return true;
    } else {
      return false;
    }
  }
}
