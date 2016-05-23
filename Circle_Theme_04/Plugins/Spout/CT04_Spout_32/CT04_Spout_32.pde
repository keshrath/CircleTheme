/** 
 * This code is copyright (c) Mathias Markl 2016
 * 
 * This program is free software: you can redistribute it and/or modify it under
 * the terms of the GNU General Public License as published by the Free Software
 * Foundation, either version 3 of the License, or (at your option) any later
 * version.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
 * details.
 * 
 * You should have received a copy of the GNU General Public License along with
 * this program. If not, see <http://www.gnu.org/licenses/>.
 */

import g4p_controls.*;

/**
 * This is a Processing sketch which has Spout support and can be used as a
 * FFGL plugin. It provides controls to change the sketch settings.
 */

private static final String SPOUT_NAME = "CT04_Spout_32";  

private Console console;
private boolean showConsole;

private Config config;
private SketchDrawer drawer;

private PControls pControls;
private boolean pControlsOpen;

private SpoutManager spout;
private SpoutControls spoutControls;  

public void settings() {
  size(1280, 720, P2D);
}  

public void setup() {
  colorMode(HSB, 360, 100, 100, 255);

  console = new Console(this);
  console.start();
  console.checkDuplicateAppender();
  showConsole = false;

  config = new Config();
  drawer = new SketchDrawer();

  drawer.init(config);

  pControls = new PControls(this, config, drawer);
  pControlsOpen = false;

  spout = new SpoutManager();
  spoutControls = new SpoutControls();

  spout.initSender(SPOUT_NAME, width, height);
  spoutControls.createControls(this, config, drawer, spout);
  spout.OpenSpoutControls(SPOUT_NAME);
}

public void draw() {
  spoutControls.updateControls();

  pushMatrix();
  drawer.update();
  drawer.render();
  popMatrix();

  spout.sendTexture();

  if (showConsole) {
    rectMode(CORNER);
    background(0);
    console.draw(0, 0, width, height);
  }
}

public void keyPressed() {
  switch(key) {
  case 'l':
    showConsole = toggleBoolean(showConsole);
    break;
  case 'p':
    console.print();
    break;
  case 'c':
    if (!pControlsOpen) {
      pControls.openControlWindow();
      pControlsOpen = true;
    }
    break;
  }
}

private boolean toggleBoolean(boolean value) {
  if (value) {
    return false;
  } else {
    return true;
  }
}

public void exit() {
  spout.CloseSpoutControls();
  spout.closeSender();
  console.stop();
  super.exit();
}


public void handleSliderEvents(GValueControl slider, GEvent event) { 
  pControls.handleSliderEvents(slider, event);
}

public void drawController(PApplet applet, GWinData data) {
  applet.background(200);
}

public void closeController(PApplet applet, GWinData data) {
  pControlsOpen = false;
}