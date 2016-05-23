class Config {

  /**
   * Default settings.
   */

  private final int DEFAULT_BCOL_H = 0;
  private final int DEFAULT_BCOL_S = 0;
  private final int DEFAULT_BCOL_B = 0;

  private final int DEFAULT_FCOL_H = 0;
  private final int DEFAULT_FCOL_S = 0;
  private final int DEFAULT_FCOL_B = 100;

  private final float DEFAULT_RADIUS = 120;

  /**
   * Config variables.
   */

  private int bColH;
  private int bColS;
  private int bColB;

  private int fColH;
  private int fColS;
  private int fColB;

  private float radius;

  public Config() {
    this.bColH = DEFAULT_BCOL_H;
    this.bColS = DEFAULT_BCOL_S;
    this.bColB = DEFAULT_BCOL_B;
    
    this.fColH = DEFAULT_FCOL_H;
    this.fColS = DEFAULT_FCOL_S;
    this.fColB = DEFAULT_FCOL_B;
    
    this.radius = DEFAULT_RADIUS;
  }

  public int getbColH() {
    return bColH;
  }

  public void setbColH(int bColH) {
    this.bColH = bColH;
  }

  public int getbColS() {
    return bColS;
  }

  public void setbColS(int bColS) {
    this.bColS = bColS;
  }

  public int getbColB() {
    return bColB;
  }

  public void setbColB(int bColB) {
    this.bColB = bColB;
  }

  public int getfColH() {
    return fColH;
  }

  public void setfColH(int fColH) {
    this.fColH = fColH;
  }

  public int getfColS() {
    return fColS;
  }

  public void setfColS(int fColS) {
    this.fColS = fColS;
  }

  public int getfColB() {
    return fColB;
  }

  public void setfColB(int fColB) {
    this.fColB = fColB;
  }

  public float getRadius() {
    return radius;
  }

  public void setRadius(float radius) {
    this.radius = radius;
  }
  
}