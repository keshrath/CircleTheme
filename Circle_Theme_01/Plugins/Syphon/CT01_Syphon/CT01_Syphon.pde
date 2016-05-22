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
 * This is a Processing sketch which has Syphon support and can be used as
 * a Syphon server. It provides controls to change the sketch settings.
 */

private static final String SYPHON_NAME = "CT01_Syphon";  

private Console console;
private boolean showConsole;

private Config config;
private SketchDrawer drawer;

private PControls pControls;
private boolean pControlsOpen;

private SyphonServer server;

public void settings() {
  size(1280, 720, P2D);
  
  PJOGL.profile=1;
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
  
  server = new SyphonServer(this, SYPHON_NAME);
}

public void draw() {
  pushMatrix();
  drawer.update();
  drawer.render();
  popMatrix();

  server.sendScreen();

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
  server.stop();
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