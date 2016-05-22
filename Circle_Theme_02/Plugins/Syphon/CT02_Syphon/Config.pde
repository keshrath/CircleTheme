class Config {

  /**
   * Default settings.
   */

  private final int DEFAULT_N_LOWER_RANGE = 3;
  private final int DEFAULT_N_UPPER_RANGE = 8;

  private final int DEFAULT_VALEUR_MAX_T = 350;
  private final int DEFAULT_STROKE_WEIGHT = 3;
  private final int DEFAULT_TIME = 600;
  private final int DEFAULT_SWAPPING_TIME = 5;

  /**
   * Config variables.
   */

  private int nLowerRange;
  private int nUpperRange;

  private int valeurMaxT;
  private int strokeWeight;
  private int time;
  private int swappingTime;

  public Config() {
    this.nLowerRange = DEFAULT_N_LOWER_RANGE;
    this.nUpperRange = DEFAULT_N_UPPER_RANGE;

    this.valeurMaxT = DEFAULT_VALEUR_MAX_T;
    this.strokeWeight = DEFAULT_STROKE_WEIGHT;
    this.time = DEFAULT_TIME;
    this.swappingTime = DEFAULT_SWAPPING_TIME;
  }

  public int getNLowerRange() {
    return nLowerRange;
  }

  public void setNLowerRange(int nLowerRange) {
    this.nLowerRange = nLowerRange;
  }

  public int getNUpperRange() {
    return nUpperRange;
  }

  public void setNUpperRange(int nUpperRange) {
    this.nUpperRange = nUpperRange;
  }

  public int getValeurMaxT() {
    return valeurMaxT;
  }

  public void setValeurMaxT(int valeurMaxT) {
    this.valeurMaxT = valeurMaxT;
  }

  public int getStrokeWeight() {
    return strokeWeight;
  }

  public void setStrokeWeight(int strokeWeight) {
    this.strokeWeight = strokeWeight;
  }

  public int getTime() {
    return time;
  }

  public void setTime(int time) {
    this.time = time;
  }
  
    public int getSwappingTime() {
    return swappingTime;
  }

  public void setSwappingTime(int swappingTime) {
    this.swappingTime = swappingTime;
  }
  
}