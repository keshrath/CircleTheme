class PControls {

  private PApplet applet;
  private GWindow controlWindow;

  private Config config;
  private SketchDrawer drawer;

  private GLabel lSetting;
  private GLabel lMode;
  private GSlider sMode;
  private GLabel lCircles;
  private GSlider sCircles;
  private GLabel lSpacing;
  private GSlider sSpacing;

  private GLabel lStrokeWeight;
  private GSlider sStrokeWeight;

  private GCheckbox cMiddle;
  private GCheckbox cPoints;

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

    lMode = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Mode");
    lMode.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sMode = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sMode.setLimits(config.getMode(), 0, 6);
    sMode.setEasing(1);
    sMode.setShowValue(true);
    sMode.setShowTicks(true);
    sMode.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lCircles = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Circles");
    lCircles.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sCircles = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sCircles.setLimits(config.getCircles(), 1, 17);
    sCircles.setEasing(1);
    sCircles.setShowValue(true);
    sCircles.setShowTicks(true);
    sCircles.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lSpacing = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Spacing");
    lSpacing.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sSpacing = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sSpacing.setLimits(config.getSpacing(), 10, 100);
    sSpacing.setEasing(1);
    sSpacing.setShowValue(true);
    sSpacing.setShowTicks(true);
    sSpacing.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lStrokeWeight = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Stroke Weight");
    lStrokeWeight.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sStrokeWeight = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sStrokeWeight.setLimits(config.getStrokeWeight(), 0.5, 10);
    sStrokeWeight.setEasing(0.1);
    sStrokeWeight.setShowValue(true);
    sStrokeWeight.setShowTicks(true);
    sStrokeWeight.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    cMiddle = new GCheckbox(controlWindow, 10, heightCount, 100, 50, "Middle Point");
    cMiddle.setSelected(config.isMiddle());
    cMiddle.setLocalColorScheme(GConstants.CYAN_SCHEME);

    cPoints = new GCheckbox(controlWindow, (300-10) - 100, heightCount, 100, 50, "Show Points");
    cPoints.setSelected(config.isPoints());
    cPoints.setLocalColorScheme(GConstants.CYAN_SCHEME);

    controlWindow.setActionOnClose(G4P.CLOSE_WINDOW);

    controlWindow.addDrawHandler(applet, "drawController");
    controlWindow.addOnCloseHandler(applet, "closeController");
  }

  public void handleSliderEvents(GValueControl slider, GEvent event) { 
    if (slider == sMode) {
      config.setMode((int) slider.getValueI());
    } else if (slider == sCircles) {
      config.setCircles((int) slider.getValueF());
    } else if (slider == sSpacing) {
      config.setSpacing((int) slider.getValueF());
    } else if (slider == sStrokeWeight) {
      config.setStrokeWeight(slider.getValueI());
    }
  }

  public void handleToggleControlEvents(GToggleControl option, GEvent event) {
    if (option == cMiddle) {
      config.setMiddle(cMiddle.isSelected());
    } else if (option == cPoints) {
      config.setPoints(cPoints.isSelected());
    }
  }
}