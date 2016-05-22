class Config {

  /**
   * Default settings.
   */

  private final int DEFAULT_X = 100;
  private final int DEFAULT_Y = 100;

  private final int DEFAULT_SCOL_H = 0;
  private final int DEFAULT_SCOL_S = 0;
  private final int DEFAULT_SCOL_B = 100;

  private final float DEFAULT_MULTIPLIER_X1 = 2;
  private final float DEFAULT_MULTIPLIER_Y1 = 2;
  private final float DEFAULT_MULTIPLIER_X2 = 2;
  private final float DEFAULT_MULTIPLIER_Y2 = 2;

  private final float DEFAULT_SCALE = 1.5;
  private final float DEFAULT_STROKE_WEIGHT = 1.2;

  /**
   * Config variables.
   */

  private int x;
  private int y;

  private int sColH;
  private int sColS;
  private int sColB;

  private float mX1;
  private float mY1;
  private float mX2;
  private float mY2;

  private float scale;
  private float strokeWeight;

  public Config() {
    this.x = DEFAULT_X;
    this.y = DEFAULT_Y;

    this.sColH = DEFAULT_SCOL_H;
    this.sColS = DEFAULT_SCOL_S;
    this.sColB = DEFAULT_SCOL_B;

    this.mX1 = DEFAULT_MULTIPLIER_X1;
    this.mY1 = DEFAULT_MULTIPLIER_Y1;
    this.mX2 = DEFAULT_MULTIPLIER_X2;
    this.mY2 = DEFAULT_MULTIPLIER_Y2;

    this.scale = DEFAULT_SCALE;
    this.strokeWeight = DEFAULT_STROKE_WEIGHT;
  }

  public int getX() {
    return x;
  }

  public void setX(int x) {
    this.x = x;
  }

  public int getY() {
    return y;
  }

  public void setY(int y) {
    this.y = y;
  }

  public int getsColH() {
    return sColH;
  }

  public void setsColH(int sColH) {
    this.sColH = sColH;
  }

  public int getsColS() {
    return sColS;
  }

  public void setsColS(int sColS) {
    this.sColS = sColS;
  }

  public int getsColB() {
    return sColB;
  }

  public void setsColB(int sColB) {
    this.sColB = sColB;
  }

  public float getmX1() {
    return mX1;
  }

  public void setmX1(float mX1) {
    this.mX1 = mX1;
  }

  public float getmY1() {
    return mY1;
  }

  public void setmY1(float mY1) {
    this.mY1 = mY1;
  }

  public float getmX2() {
    return mX2;
  }

  public void setmX2(float mX2) {
    this.mX2 = mX2;
  }

  public float getmY2() {
    return mY2;
  }

  public void setmY2(float mY2) {
    this.mY2 = mY2;
  }

  public float getScale() {
    return scale;
  }

  public void setScale(float scale) {
    this.scale = scale;
  }

  public float getStrokeWeight() {
    return strokeWeight;
  }

  public void setStrokeWeight(float strokeWeight) {
    this.strokeWeight = strokeWeight;
  }
  
}