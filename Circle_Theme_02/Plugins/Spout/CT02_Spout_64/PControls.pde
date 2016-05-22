class PControls {

  private PApplet applet;
  private GWindow controlWindow;

  private Config config;
  private SketchDrawer drawer;

  private GLabel lRange;
  private GLabel lLowerRange;
  private GSlider sLowerRange;
  private GLabel lUpperRange;
  private GSlider sUpperRange;

  private GLabel lSettings;
  private GLabel lValeurMaxT;
  private GSlider sValeurMaxT;
  private GLabel lStrokeWeight;
  private GSlider sStrokeWeight;
  private GLabel lTime;
  private GSlider sTime;
  private GLabel lSwappingTime;
  private GSlider sSwappingTime;

  public PControls(PApplet applet, Config config, SketchDrawer drawer) {
    this.applet = applet;
    this.config = config;
    this.drawer = drawer;
  }

  public void openControlWindow() {
    controlWindow = GWindow.getWindow(applet, "PControls", (displayWidth/2) + 640 + 5, (displayHeight/2) - 380, 300, 520, JAVA2D);

    int heightCount = 10;

    lRange = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Range");
    lRange.setLocalColorScheme(GConstants.CYAN_SCHEME);
    lRange.setTextBold();

    heightCount += 15 + 10;

    lLowerRange = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Lower Range");
    lLowerRange.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sLowerRange = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sLowerRange.setLimits(config.getNLowerRange(), 2, 35);
    sLowerRange.setEasing(1);
    sLowerRange.setShowValue(true);
    sLowerRange.setShowTicks(true);
    sLowerRange.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lUpperRange = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Upper Range");
    lUpperRange.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sUpperRange = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sUpperRange.setLimits(config.getNUpperRange(), 2, 35);
    sUpperRange.setEasing(1);
    sUpperRange.setShowValue(true);
    sUpperRange.setShowTicks(true);
    sUpperRange.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lSettings = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Settings");
    lSettings.setLocalColorScheme(GConstants.CYAN_SCHEME);
    lSettings.setTextBold();

    heightCount += 15 + 10;

    lValeurMaxT = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Valeur Max T");
    lValeurMaxT.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sValeurMaxT = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sValeurMaxT.setLimits(config.getValeurMaxT(), 1, 1000);
    sValeurMaxT.setEasing(10);
    sValeurMaxT.setShowValue(true);
    sValeurMaxT.setShowTicks(true);
    sValeurMaxT.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lStrokeWeight = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Stroke Weight");
    lStrokeWeight.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sStrokeWeight = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sStrokeWeight.setLimits(config.getStrokeWeight(), 1, 30);
    sStrokeWeight.setEasing(1);
    sStrokeWeight.setShowValue(true);
    sStrokeWeight.setShowTicks(true);
    sStrokeWeight.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 50 + 5;

    lTime = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Time");
    lTime.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sTime = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sTime.setLimits(config.getTime(), 1, 1000);
    sTime.setEasing(10);
    sTime.setShowValue(true);
    sTime.setShowTicks(true);
    sTime.setLocalColorScheme(GConstants.CYAN_SCHEME);
    
    heightCount += 50 + 5;
    
    lSwappingTime = new GLabel(controlWindow, 10, heightCount, 300 - (2*10), 15, "Swapping Time");
    lSwappingTime.setLocalColorScheme(GConstants.CYAN_SCHEME);

    heightCount += 15 + 5;

    sSwappingTime = new GSlider(controlWindow, 10, heightCount, 300 - (2*10), 50, 12);
    sSwappingTime.setLimits(config.getSwappingTime(), 1, 25);
    sSwappingTime.setEasing(1);
    sSwappingTime.setShowValue(true);
    sSwappingTime.setShowTicks(true);
    sSwappingTime.setLocalColorScheme(GConstants.CYAN_SCHEME);

    controlWindow.setActionOnClose(G4P.CLOSE_WINDOW);

    controlWindow.addDrawHandler(applet, "drawController");
    controlWindow.addOnCloseHandler(applet, "closeController");
  }

  public void handleSliderEvents(GValueControl slider, GEvent event) { 
    if (slider == sLowerRange) {
      config.setNLowerRange((int) slider.getValueI());
    } else if (slider == sUpperRange) {
      config.setNUpperRange((int) slider.getValueF());
    } else if (slider == sValeurMaxT) {
      config.setValeurMaxT((int) slider.getValueF());
    } else if (slider == sStrokeWeight) {
      config.setStrokeWeight((int) slider.getValueI());
    } else if (slider == sTime) {
      config.setTime((int) slider.getValueF());
    } else if (slider == sSwappingTime) {
      config.setSwappingTime((int) slider.getValueF());
    }
  }

}