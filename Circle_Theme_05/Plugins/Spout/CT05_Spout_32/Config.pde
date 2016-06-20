class Config {

  /**
   * Default settings.
   */

  private final int DEFAULT_MODE = 0;
  private final int DEFAULT_CIRCLES = 5;

  private final int DEFAULT_SPACING = 50;

  private final boolean DEFAULT_MIDDLE = false;
  private final boolean DEFAULT_POINTS = false;

  private final float DEFAULT_STROKE_WEIGHT = 1.5;

  /**
   * Config variables.
   */

  private int mode;
  private int circles;

  private int spacing;

  private boolean middle;
  private boolean points;

  private float strokeWeight;

  public Config() {
    this.mode = DEFAULT_MODE;
    this.circles = DEFAULT_CIRCLES;

    this.spacing = DEFAULT_SPACING;
    this.points = DEFAULT_POINTS;

    this.middle = DEFAULT_MIDDLE;

    this.strokeWeight = DEFAULT_STROKE_WEIGHT;
  }

  public int getMode() {
    return mode;
  }

  public void setMode(int mode) {
    this.mode = mode;
  }

  public int getCircles() {
    return circles;
  }

  public void setCircles(int circles) {
    this.circles = circles;
  }

  public int getSpacing() {
    return spacing;
  }

  public void setSpacing(int spacing) {
    this.spacing = spacing;
  }

  public boolean isMiddle() {
    return middle;
  }

  public void setMiddle(boolean middle) {
    this.middle = middle;
  }

  public boolean isPoints() {
    return points;
  }

  public void setPoints(boolean points) {
    this.points = points;
  }

  public float getStrokeWeight() {
    return strokeWeight;
  }

  public void setStrokeWeight(float strokeWeight) {
    this.strokeWeight = strokeWeight;
  }
}