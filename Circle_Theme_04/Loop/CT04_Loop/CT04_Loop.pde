private ArrayList<Circle> list = new ArrayList<Circle>();

int index = 0;

int picSave = 1;

void setup() {
  size(1280, 720);
  background(0);
  noStroke();
  smooth();

  for (int a=0; a < 1000; a++) {
    list.add((new Circle(120, random(width), random(height))));
  }

  for (Circle c : list) {
    c.drawCircle();
  }
}

void draw() {
  if (index < list.size()) {
    list.get(index).drawCircle();
    index++;
  }

  if (index >= list.size()) {
    index = 0;
    println("DONE");
    noLoop();
  }

  saveFrame("Save_" + picSave + ".tif");
  picSave++;
}

class Circle {

  private float rStart;
  private float x;
  private float y;

  private ArrayList<Float> radiusList;
  private ArrayList<Integer> colorList;

  public Circle(float r, float x, float y) {
    radiusList = new ArrayList<Float>();
    colorList = new ArrayList<Integer>();

    this.rStart = r;
    this.x = x;
    this.y = y;

    float rCalc = r;
    boolean cFill = random(100) < 50 ? true : false;

    while (rCalc > 10) {
      if (cFill) {
        colorList.add(255);
      } else {
        colorList.add(0);
      }
      cFill = !cFill;
      radiusList.add(rCalc); 
      rCalc*=random(0.75, 0.96);
    }
  }

  public void drawCircle() {
    fill(0, 50);
    drawEllipse(x + 5, y + 5, rStart);

    for (int i = 0; i < radiusList.size(); i++) {
      fill(colorList.get(i));
      drawEllipse(x, y, radiusList.get(i));
    }
  }

  public void drawEllipse(float x, float y, float r) {
    ellipse(x, y, r, r);

    if (x - r < 0 && y - r < 0) {
      ellipse(x, height + y, r, r);
      ellipse(width + x, y, r, r);
      ellipse(width + x, height + y, r, r);
    } else if (x - r < 0 && y + r > height) {
      ellipse(x, y - height, r, r);
      ellipse(width + x, y, r, r);
      ellipse(width + x, y - height, r, r);
    } else if (x + r > width && y - r < 0) {
      ellipse(x, height + y, r, r);
      ellipse(x - width, y, r, r);
      ellipse(x - width, height + y, r, r);
    } else if (x + r > width && y + r > height) {
      ellipse(x, y - height, r, r);
      ellipse(x - width, y, r, r);
      ellipse(x - width, y - height, r, r);
    } else if (x - r < 0) {
      ellipse(width + x, y, r, r);
    } else if (x + r > width) {
      ellipse(x - width, y, r, r);
    } else if (y - r < 0) {
      ellipse(x, height + y, r, r);
    } else if (y + r > height) {
      ellipse(x, y - height, r, r);
    }
  }
}