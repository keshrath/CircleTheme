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

    spout.CreateSpoutControl("Lower Range", "float", 2, 35, config.getNLowerRange());
    spout.CreateSpoutControl("Upper Range", "float", 2, 35, config.getNUpperRange());
    
    spout.CreateSpoutControl("Valeur Max T", "float", 0, 1000, config.getValeurMaxT());
    spout.CreateSpoutControl("Stroke Weight", "float", 1, 30, config.getStrokeWeight());
    spout.CreateSpoutControl("Time", "float", 1, 1000, config.getTime());
    spout.CreateSpoutControl("Swapping Time", "float", 1, 25, config.getSwappingTime());
  }

  public void updateControls() {
    int nControls = spout.CheckSpoutControls(controlName, controlType, controlValue, controlText);

    if (nControls > 0) {
      for (int i = 0; i < nControls; i++) {
        
        if (controlName[i].equals("Lower Range")) {
          config.setNLowerRange(int(controlValue[i]));
        } else if (controlName[i].equals("Upper Range")) {
          config.setNUpperRange(int(controlValue[i]));
        } else if (controlName[i].equals("Valeur Max T")) {
          config.setValeurMaxT(int(controlValue[i]));
        } else if (controlName[i].equals("Stroke Weight")) {
          config.setStrokeWeight(int(controlValue[i]));
        } else if (controlName[i].equals("Time")) {
          config.setTime(int(controlValue[i]));
        } else if (controlName[i].equals("Swapping Time")) {
          config.setSwappingTime(int(controlValue[i]));
        }

      }
    }
  }
  
}