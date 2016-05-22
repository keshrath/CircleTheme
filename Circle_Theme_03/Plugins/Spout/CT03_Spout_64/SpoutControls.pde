class SpoutControls {

  private PApplet applet;
  private Config config;
  private SketchDrawer drawer;
  private SpoutManager spout;

  private String[] controlName;
  private int[] controlType;
  private float[] controlValue;
  private String[] controlText;

  public SpoutControls() {
    controlName = new String[20];
    controlType = new int[20];
    controlValue = new float[20];
    controlText = new String[20];
  }

  public void createControls(PApplet applet, Config config, SketchDrawer drawer, SpoutManager spout) {
    this.applet = applet;
    this.config = config;
    this.drawer = drawer;
    this.spout = spout;

    spout.CreateSpoutControl("XValue", "float", 20, 250, config.getX());
    spout.CreateSpoutControl("YValue", "float", 20, 250, config.getY());
    
    spout.CreateSpoutControl("S. Hue", "float", 0, 360, config.getsColH());
    spout.CreateSpoutControl("S. Saturation", "float", 0, 100, config.getsColS());
    spout.CreateSpoutControl("S. Brightness", "float", 0, 100, config.getsColB());
    
    spout.CreateSpoutControl("X1 Multiplier", "float", 0, 10, config.getmX1());
    spout.CreateSpoutControl("Y1 Multiplier", "float", 0, 10, config.getmY1());
    spout.CreateSpoutControl("X2 Multiplier", "float", 0, 10, config.getmX2());
    spout.CreateSpoutControl("Y2 Multiplier", "float", 0, 10, config.getmY2());
    
    spout.CreateSpoutControl("Scale", "float", 0.1, 5, config.getScale());
    spout.CreateSpoutControl("Stroke Weight", "float", 0.1, 5, config.getStrokeWeight());
  }

  public void updateControls() {
    int nControls = spout.CheckSpoutControls(controlName, controlType, controlValue, controlText);

    if (nControls > 0) {
      for (int i = 0; i < nControls; i++) {
        
        if (controlName[i].equals("XValue")) {
          config.setX(int(controlValue[i]));
        } else if (controlName[i].equals("YValue")) {
          config.setY(int(controlValue[i]));
        } else if (controlName[i].equals("S. Hue")) {
          config.setsColH(int(controlValue[i]));
        } else if (controlName[i].equals("S. Saturation")) {
          config.setsColS(int(controlValue[i]));
        } else if (controlName[i].equals("S. Brightness")) {
          config.setsColB(int(controlValue[i]));
        } else if (controlName[i].equals("X1 Multiplier")) {
          config.setmX1(controlValue[i]);
        } else if (controlName[i].equals("Y1 Multiplier")) {
          config.setmY1(controlValue[i]);
        } else if (controlName[i].equals("X2 Multiplier")) {
          config.setmX2(controlValue[i]);
        } else if (controlName[i].equals("Y2 Multiplier")) {
          config.setmY2(controlValue[i]);
        } else if (controlName[i].equals("Scale")) {
          config.setScale(controlValue[i]);
        } else if (controlName[i].equals("Stroke Weight")) {
          config.setStrokeWeight(controlValue[i]);
        }

      }
    }
  }
  
}