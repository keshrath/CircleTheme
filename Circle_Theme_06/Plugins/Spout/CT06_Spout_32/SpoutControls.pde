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

    spout.CreateSpoutControl("Min Size", "float", 0, 400, config.getMinSize());
    spout.CreateSpoutControl("Max Size", "float", 1, 600, config.getMaxSize());
    spout.CreateSpoutControl("Spacing", "float", 1, 400, config.getSpacing());
    spout.CreateSpoutControl("Stroke Weight", "float", 0.5, 10, config.getStrokeWeight());
    spout.CreateSpoutControl("Blur", "float", 5, 255, config.getBlur());
  }

  public void updateControls() {
    int nControls = spout.CheckSpoutControls(controlName, controlType, controlValue, controlText);

    if (nControls > 0) {
      for (int i = 0; i < nControls; i++) {

        if (controlName[i].equals("Min Size")) {
          config.setMinSize(int(controlValue[i]));
        } else if (controlName[i].equals("Max Size")) {
          config.setMaxSize(int(controlValue[i]));
        } else if (controlName[i].equals("Spacing")) {
          config.setSpacing(int(controlValue[i]));
        } else if (controlName[i].equals("Stroke Weight")) {
          config.setStrokeWeight(controlValue[i]);
        } else if (controlName[i].equals("Blur")) {
          config.setBlur(int(controlValue[i]));
        }
      }
    }
  }
}
           