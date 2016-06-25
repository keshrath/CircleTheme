class PControls {

  private PApplet applet;
  private GWindow controlWindow;

  private Config config;
  private SketchDrawer drawer;

  private GLabel lSetting;
  private GLabel lMinSize;
  private GSlider sMinSize;
  private GLabel lMaxSize;
  private GSlider sMaxSize;
  private GLabel lSpacing;
  private GSlider sSpacing;

  private GLabel lStrokeFactor;
  private GSlider sStrokeFactor;

  private GLabel lBlur;
  private GSlider sBlur;

  public PControls(PApplet applet, Config config, SketchDrawer drawer) {
    this.applet = applet;
    this.config = config;
    this.drawer = drawer;
  }

  public void openControlWindow() {
    controlWindow = GWindow.getWindow(applet, "PControls", (displayWidth/2) + 640 + 5, (displayHeight/2) - 380, 300, 650, JAVA2D);

    int heightCount = 10;

    lSetting = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Settings");
    lSetting.setLocalColorScheme(GConstants.CYAN_SCHEME);
    lSetting.setTextBold();

    heightCount += 15 + 10;

    lMinSize = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Min Size");
    lMinSize.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sMinSize = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sMinSize.setLimits(config.getMinSize(), 0, 300);
    sMinSize.setEasing(1);
    sMinSize.setShowValue(true);
    sMinSize.setShowTicks(true);
    sMinSize.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lMaxSize = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Max Size");
    lMaxSize.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sMaxSize = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sMaxSize.setLimits(config.getMaxSize(), 1, 600);
    sMaxSize.setEasing(1);
    sMaxSize.setShowValue(true);
    sMaxSize.setShowTicks(true);
    sMaxSize.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lSpacing = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Spacing");
    lSpacing.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sSpacing = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sSpacing.setLimits(config.getSpacing(), 1, 400);
    sSpacing.setEasing(1);
    sSpacing.setShowValue(true);
    sSpacing.setShowTicks(true);
    sSpacing.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lStrokeFactor = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Stroke Weight");
    lStrokeFactor.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sStrokeFactor = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sStrokeFactor.setLimits(config.getStrokeWeight(), 0.5, 10);
    sStrokeFactor.setEasing(0.1);
    sStrokeFactor.setShowValue(true);
    sStrokeFactor.setShowTicks(true);
    sStrokeFactor.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lBlur = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Blur");
    lBlur.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sBlur = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sBlur.setLimits(config.getStrokeWeight(), 5, 255);
    sBlur.setEasing(1);
    sBlur.setShowValue(true);
    sBlur.setShowTicks(true);
    sBlur.setLocalColorScheme(GConstants.CYAN_SCHEME);

    controlWindow.setActionOnClose(G4P.CLOSE_WINDOW);

    controlWindow.addDrawHandler(applet, "drawController");
    controlWindow.addOnCloseHandler(applet, "closeController");
  }

  public void handleSliderEvents(GValueControl slider, GEvent event) { 
    if (slider == sMinSize) {
      config.setMinSize((int) slider.getValueI());
    } else if (slider == sMaxSize) {
      config.setMaxSize((int) slider.getValueF());
    } else if (slider == sSpacing) {
      config.setSpacing((int) slider.getValueF());
    } else if (slider == sStrokeFactor) {
      config.setStrokeWeight(slider.getValueI());
    } else if (slider == sBlur) {
      config.setBlur((int) slider.getValueI());
    }
  }
}