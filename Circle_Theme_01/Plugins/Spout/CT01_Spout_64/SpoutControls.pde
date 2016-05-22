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

    spout.CreateSpoutControl("B. Hue", "float", 0, 360, config.getbColH());
    spout.CreateSpoutControl("B. Saturation", "float", 0, 100, config.getbColS());
    spout.CreateSpoutControl("B. Brightness", "float", 0, 100, config.getbColB());
    
    spout.CreateSpoutControl("F. Hue", "float", 0, 360, config.getfColH());
    spout.CreateSpoutControl("F. Saturation", "float", 0, 100, config.getfColS());
    spout.CreateSpoutControl("F. Brightness", "float", 0, 100, config.getfColB());
    
    spout.CreateSpoutControl("Stroke Weight", "float", 1, 50, config.getStrokeWeight());
    spout.CreateSpoutControl("Blocks", "float", 1, 200, config.getBlocks());
    spout.CreateSpoutControl("Blocksize", "float", 200, 800, config.getBlocksize());
  }

  public void updateControls() {
    int nControls = spout.CheckSpoutControls(controlName, controlType, controlValue, controlText);

    if (nControls > 0) {
      for (int i = 0; i < nControls; i++) {
        
        if (controlName[i].equals("B. Hue")) {
          config.setbColH(int(controlValue[i]));
        } else if (controlName[i].equals("B. Saturation")) {
          config.setbColS(int(controlValue[i]));
        } else if (controlName[i].equals("B. Brightness")) {
          config.setbColB(int(controlValue[i]));
        } else if (controlName[i].equals("F. Hue")) {
          config.setfColH(int(controlValue[i]));
        } else if (controlName[i].equals("F. Saturation")) {
          config.setfColS(int(controlValue[i]));
        } else if (controlName[i].equals("F. Brightness")) {
          config.setfColB(int(controlValue[i]));
        } else if (controlName[i].equals("Stroke Weight")) {
          config.setStrokeWeight(int(controlValue[i]));
        } else if (controlName[i].equals("Blocks")) {
          config.setBlocks(int(controlValue[i]));
        } else if (controlName[i].equals("Blocksize")) {
          config.setBlocksize(int(controlValue[i]));
        }

      }
    }
  }
  
}