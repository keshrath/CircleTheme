class SketchDrawer {

  private Config config;

  public void init(Config config) {
    this.config = config;

    noStroke();
    smooth();

    background(0);
  }

  public void update() {
  }

  public void render() {
    drawCircle(config.getRadius(), random(width), random(height));
  }

  private void drawCircle(float r, float x, float y) {
    fill(0, 50);
    drawEllipse(x + 5, y + 5, r);

    float rCalc = r;
    boolean cFill = random(100) < 50 ? true : false;

    while (rCalc > 10) {
      if (cFill) {
        fill(config.getbColH(), config.getbColS(), config.getbColB());
      } else {
       fill(config.getfColH(), config.getfColS(), config.getfColB());
      }
      cFill = !cFill;
      drawEllipse(x, y, rCalc);
      rCalc*=random(0.75, 0.96);
    }
  }

  private void drawEllipse(float x, float y, float r) {
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