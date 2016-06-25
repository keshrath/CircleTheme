class Config {

  /**
   * Default settings.
   */

  private final int DEFAULT_MIN_SIZE = 60;
  private final int DEFAULT_MAX_SIZE = 200;

  private final int DEFAULT_SPACING = 70;

  private final float DEFAULT_STROKE_WEIGHT = 1.5;

  private final int DEFAULT_BLUR = 30;

  /**
   * Config variables.
   */

  private int minSize;
  private int maxSize;

  private int spacing;

  private float strokeWeight;

  private int blur;

  public Config() {
    this.minSize = DEFAULT_MIN_SIZE;
    this.maxSize = DEFAULT_MAX_SIZE;

    this.spacing = DEFAULT_SPACING;
    this.strokeWeight = DEFAULT_STROKE_WEIGHT;

    this.blur = DEFAULT_BLUR;
  }

  public int getMinSize() {
    return minSize;
  }

  public void setMinSize(int minSize) {
    this.minSize = minSize;
  }

  public int getMaxSize() {
    return maxSize;
  }

  public void setMaxSize(int maxSize) {
    this.maxSize = maxSize;
  }

  public int getSpacing() {
    return spacing;
  }

  public void setSpacing(int spacing) {
    this.spacing = spacing;
  }

  public float getStrokeWeight() {
    return strokeWeight;
  }

  public void setStrokeWeight(float strokeWeight) {
    this.strokeWeight = strokeWeight;
  }

  public int getBlur() {
    return blur;
  }

  public void setBlur(int blur) {
    this.blur = blur;
  }
}