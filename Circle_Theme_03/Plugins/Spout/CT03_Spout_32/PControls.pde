class PControls {

  private PApplet applet;
  private GWindow controlWindow;

  private Config config;
  private SketchDrawer drawer;

  private GLabel lBasic;
  private GLabel lX;
  private GSlider sX;
  private GLabel lY;
  private GSlider sY;

  private GLabel lColor;
  private GLabel lSColH;
  private GSlider sSColH;
  private GLabel lSColS;
  private GSlider sSColS;
  private GLabel lSColB;
  private GSlider sSColB;
  
  private GLabel lMultiplier;
  private GLabel lMultiplierX1;
  private GSlider sMultiplierX1;
  private GLabel lMultiplierY1;
  private GSlider sMultiplierY1;
  private GLabel lMultiplierX2;
  private GSlider sMultiplierX2;
  private GLabel lMultiplierY2;
  private GSlider sMultiplierY2;
  
  private GLabel lSettings;
  private GLabel lScale;
  private GSlider sScale;
  private GLabel lStrokeWeight;
  private GSlider sStrokeWeight;

  public PControls(PApplet applet, Config config, SketchDrawer drawer) {
    this.applet = applet;
    this.config = config;
    this.drawer = drawer;
  }

  public void openControlWindow() {
    controlWindow = GWindow.getWindow(applet, "PControls", (displayWidth/2) + 640 + 5, (displayHeight/2) - 500, 300, 950, JAVA2D);

    int heightCount = 10;

    lBasic = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Basic");
    lBasic.setLocalColorScheme(GConstants.CYAN_SCHEME);
    lBasic.setTextBold();

    heightCount += 15 + 10;

    lX = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "X Value");
    lX.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sX = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sX.setLimits(config.getX(), 20, 250);
    sX.setEasing(10);
    sX.setShowValue(true);
    sX.setShowTicks(true);
    sX.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lY = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Y Value");
    lY.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sY = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sY.setLimits(config.getY(), 20, 250);
    sY.setEasing(10);
    sY.setShowValue(true);
    sY.setShowTicks(true);
    sY.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lColor = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Color");
    lColor.setLocalColorScheme(GConstants.CYAN_SCHEME);
    lColor.setTextBold();

    heightCount += 15 + 10;
    
    lSColH = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Hue");
    lSColH.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sSColH = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sSColH.setLimits(config.getsColH(), 0, 360);
    sSColH.setEasing(1);
    sSColH.setShowValue(true);
    sSColH.setShowTicks(true);
    sSColH.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lSColS = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Saturation");
    lSColS.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sSColS = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sSColS.setLimits(config.getsColS(), 0, 100);
    sSColS.setEasing(1);
    sSColS.setShowValue(true);
    sSColS.setShowTicks(true);
    sSColS.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lSColB = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Brightness");
    lSColB.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sSColB = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sSColB.setLimits(config.getsColB(), 0, 100);
    sSColB.setEasing(1);
    sSColB.setShowValue(true);
    sSColB.setShowTicks(true);
    sSColB.setLocalColorScheme(GConstants.CYAN_SCHEME);
    
    heightCount += 50 + 5;
    
    lMultiplier = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Multiplier");
    lMultiplier.setLocalColorScheme(GConstants.CYAN_SCHEME);
    lMultiplier.setTextBold();

    heightCount += 15 + 10;

    lMultiplierX1 = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "X1 Multiplier");
    lMultiplierX1.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sMultiplierX1 = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sMultiplierX1.setLimits(config.getmX1(), 1, 10);
    sMultiplierX1.setEasing(0.5);
    sMultiplierX1.setShowValue(true);
    sMultiplierX1.setShowTicks(true);
    sMultiplierX1.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;
    
    lMultiplierY1 = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Y1 Multiplier");
    lMultiplierY1.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sMultiplierY1 = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sMultiplierY1.setLimits(config.getmY1(), 1, 10);
    sMultiplierY1.setEasing(0.5);
    sMultiplierY1.setShowValue(true);
    sMultiplierY1.setShowTicks(true);
    sMultiplierY1.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;
    
    lMultiplierX2 = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "X2 Multiplier");
    lMultiplierX2.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sMultiplierX2 = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sMultiplierX2.setLimits(config.getmX1(), 1, 10);
    sMultiplierX2.setEasing(0.5);
    sMultiplierX2.setShowValue(true);
    sMultiplierX2.setShowTicks(true);
    sMultiplierX2.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;
    
    lMultiplierY2 = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Y2 Multiplier");
    lMultiplierY2.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sMultiplierY2 = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sMultiplierY2.setLimits(config.getmY1(), 1, 10);
    sMultiplierY2.setEasing(0.5);
    sMultiplierY2.setShowValue(true);
    sMultiplierY2.setShowTicks(true);
    sMultiplierY2.setLocalColorScheme(GConstants.CYAN_SCHEME);
    
    heightCount += 50 + 5;
    
    lSettings = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Settings");
    lSettings.setLocalColorScheme(GConstants.CYAN_SCHEME);
    lSettings.setTextBold();

    heightCount += 15 + 10;

    lScale = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Scale");
    lScale.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sScale = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sScale.setLimits(config.getScale(), 0.1, 5);
    sScale.setEasing(0.1);
    sScale.setShowValue(true);
    sScale.setShowTicks(true);
    sScale.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lStrokeWeight = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Stroke Weight");
    lStrokeWeight.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sStrokeWeight = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sStrokeWeight.setLimits(config.getStrokeWeight(), 0.1, 5);
    sStrokeWeight.setEasing(0.1);
    sStrokeWeight.setShowValue(true);
    sStrokeWeight.setShowTicks(true);
    sStrokeWeight.setLocalColorScheme(GConstants.CYAN_SCHEME);

    controlWindow.setActionOnClose(G4P.CLOSE_WINDOW);

    controlWindow.addDrawHandler(applet, "drawController");
    controlWindow.addOnCloseHandler(applet, "closeController");
  }

  public void handleSliderEvents(GValueControl slider, GEvent event) { 
    if (slider == sX) {
      config.setX((int) slider.getValueI());
    } else if (slider == sY) {
      config.setY((int) slider.getValueF());
    } else if (slider == sSColH) {
      config.setsColH((int) slider.getValueF());
    } else if (slider == sSColS) {
      config.setsColS((int) slider.getValueI());
    } else if (slider == sSColB) {
      config.setsColB((int) slider.getValueF());
    } else if (slider == sMultiplierX1) {
      config.setmX1(slider.getValueF());
    } else if (slider == sMultiplierY1) {
      config.setmY1(slider.getValueF());
    } else if (slider == sMultiplierX2) {
      config.setmX2(slider.getValueF());
    } else if (slider == sMultiplierY2) {
      config.setmY2(slider.getValueF());
    } else if (slider == sScale) {
      config.setScale(slider.getValueF());
    } else if (slider == sStrokeWeight) {
      config.setStrokeWeight(slider.getValueF());
    }
  }
  
}