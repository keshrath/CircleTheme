class PControls {

  private PApplet applet;
  private GWindow controlWindow;

  private Config config;
  private SketchDrawer drawer;

  private GLabel lBCol;
  private GLabel lBColH;
  private GSlider sBColH;
  private GLabel lBColS;
  private GSlider sBColS;
  private GLabel lBColB;
  private GSlider sBColB;

  private GLabel lFCol;
  private GLabel lFColH;
  private GSlider sFColH;
  private GLabel lFColS;
  private GSlider sFColS;
  private GLabel lFColB;
  private GSlider sFColB;

  private GLabel lStyle;
  private GLabel lRadius;
  private GSlider sRadius;

  public PControls(PApplet applet, Config config, SketchDrawer drawer) {
    this.applet = applet;
    this.config = config;
    this.drawer = drawer;
  }

  public void openControlWindow() {
    controlWindow = GWindow.getWindow(applet, "PControls", (displayWidth/2) + 640 + 5, (displayHeight/2) - 380, 300, 650, JAVA2D);

    int heightCount = 10;

    lBCol = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Circle Background Color");
    lBCol.setLocalColorScheme(GConstants.CYAN_SCHEME);
    lBCol.setTextBold();

    heightCount += 15 + 10;

    lBColH = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Hue");
    lBColH.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sBColH = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sBColH.setLimits(config.getbColH(), 0, 360);
    sBColH.setEasing(1);
    sBColH.setShowValue(true);
    sBColH.setShowTicks(true);
    sBColH.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lBColS = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Saturation");
    lBColS.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sBColS = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sBColS.setLimits(config.getbColS(), 0, 100);
    sBColS.setEasing(1);
    sBColS.setShowValue(true);
    sBColS.setShowTicks(true);
    sBColS.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lBColB = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Brightness");
    lBColB.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sBColB = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sBColB.setLimits(config.getbColS(), 0, 100);
    sBColB.setEasing(1);
    sBColB.setShowValue(true);
    sBColB.setShowTicks(true);
    sBColB.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lFCol = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Circle Fill Color");
    lFCol.setLocalColorScheme(GConstants.CYAN_SCHEME);
    lFCol.setTextBold();

    heightCount += 15 + 10;

    lFColH = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Hue");
    lFColH.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sFColH = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sFColH.setLimits(config.getfColH(), 0, 360);
    sFColH.setEasing(1);
    sFColH.setShowValue(true);
    sFColH.setShowTicks(true);
    sFColH.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lFColS = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Saturation");
    lFColS.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sFColS = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sFColS.setLimits(config.getfColS(), 0, 100);
    sFColS.setEasing(1);
    sFColS.setShowValue(true);
    sFColS.setShowTicks(true);
    sFColS.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lFColB = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Brightness");
    lFColB.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sFColB = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sFColB.setLimits(config.getfColB(), 0, 100);
    sFColB.setEasing(1);
    sFColB.setShowValue(true);
    sFColB.setShowTicks(true);
    sFColB.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lStyle = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Style");
    lStyle.setLocalColorScheme(GConstants.CYAN_SCHEME);
    lStyle.setTextBold();

    heightCount += 15 + 10;

    lRadius = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Radius");
    lRadius.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sRadius = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sRadius.setLimits(config.getRadius(), 25, 300);
    sRadius.setEasing(1);
    sRadius.setShowValue(true);
    sRadius.setShowTicks(true);
    sRadius.setLocalColorScheme(GConstants.CYAN_SCHEME);


    controlWindow.setActionOnClose(G4P.CLOSE_WINDOW);

    controlWindow.addDrawHandler(applet, "drawController");
    controlWindow.addOnCloseHandler(applet, "closeController");
  }

  public void handleSliderEvents(GValueControl slider, GEvent event) { 
    if (slider == sBColH) {
      config.setbColH((int) slider.getValueI());
    } else if (slider == sBColS) {
      config.setbColS((int) slider.getValueF());
    } else if (slider == sBColB) {
      config.setbColB((int) slider.getValueF());
    } else if (slider == sFColH) {
      config.setfColH((int) slider.getValueI());
    } else if (slider == sFColS) {
      config.setfColS((int) slider.getValueF());
    } else if (slider == sFColB) {
      config.setfColB((int) slider.getValueF());
    } else if (slider == sRadius) {
      config.setRadius(slider.getValueI());
    }
  }
}