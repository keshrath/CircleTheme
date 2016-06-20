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

    spout.CreateSpoutControl("Mode", "float", 0, 6, config.getMode());
    spout.CreateSpoutControl("Circles", "float", 1, 17, config.getCircles());
    spout.CreateSpoutControl("Spacing", "float", 10, 100, config.getSpacing());
    spout.CreateSpoutControl("Stroke Weight", "float", 0.5, 10, config.getStrokeWeight());
    spout.CreateSpoutControl("Middle Point", "bool", config.isMiddle() ? 1 : 0);
    spout.CreateSpoutControl("Show Points", "bool", config.isPoints() ? 1 : 0);
  }

  public void updateControls() {
    int nControls = spout.CheckSpoutControls(controlName, controlType, controlValue, controlText);

    if (nControls > 0) {
      for (int i = 0; i < nControls; i++) {

        if (controlName[i].equals("Mode")) {
          config.setMode(int(controlValue[i]));
        } else if (controlName[i].equals("Circles")) {
          config.setCircles(int(controlValue[i]));
        } else if (controlName[i].equals("Spacing")) {
          config.setSpacing(int(controlValue[i]));
        } else if (controlName[i].equals("Stroke Weight")) {
          config.setStrokeWeight(controlValue[i]);
        } else if (controlName[i].equals("Middle Point")) {
          config.setMiddle((boolean)(controlValue[i] == 1));
        } else if (controlName[i].equals("Show Points")) {
          config.setPoints((boolean)(controlValue[i] == 1));
        }
      }
    }
  }
}
           