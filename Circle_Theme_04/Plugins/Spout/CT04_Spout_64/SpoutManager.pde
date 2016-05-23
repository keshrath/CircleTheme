import processing.opengl.*;

class SpoutManager {

  PGraphicsOpenGL pgl;
  int[] dim = new int[2];
  int memorymode;

  SpoutManager() {
    pgl = (PGraphicsOpenGL) g;
    dim[0] = 0;
    dim[1] = 0;
    memorymode = -1;
  }  

  public void initSender(String name, int Width, int Height) {
    memorymode = JSpout.InitSender(name, Width, Height, 0);
    if (memorymode == 0)
      print("Sender initialized texture sharing\n");
    else if (memorymode == 1)
      print("Sender texture sharing not supported - using memory sharing\n");
    else if (memorymode == -1)
      print("Sender sharing initialization failed\n");
  }

  public void sendTexture() {
    pgl.beginPGL();
    pgl.loadTexture();  
    Texture tex = pgl.getTexture();
    JSpout.WriteTexture(tex.glWidth, tex.glHeight, tex.glName, tex.glTarget, true);
    pgl.endPGL();
  }


  public void closeSender() {
    if (JSpout.ReleaseSender())
      print("Sender closed" + "\n");
    else
      print("No sender to close" + "\n");
  } 

  public void initReceiver(String name, PImage img) {
    dim[0] = img.width;
    dim[1] = img.height;

    if (memorymode > 0) {
      print("Receiver already initialized - teture sharing mode\n");
      return;
    }

    memorymode = JSpout.InitReceiver(name, dim, 0);

    if (memorymode == -1) {
      print("No sender running - start one and try again.\n");
      return;
    } else if (memorymode == 0)
      print("Receiver initialized texture sharing\n");
    else if (memorymode == 1)
      print("Receiver texture sharing not supported - using memory sharing\n");

    String newname = JSpout.GetSenderName();
    print("Receiver found sender : " + newname + " " + dim[0] + "x" + dim[1] + "\n");

    if (dim[0] != img.width || dim[1] != img.height && dim[0] > 0 && dim[1] > 0) {
      img.resize(dim[0], dim[1]);
      img.updatePixels();
    }
  }

  public PImage receiveTexture(PImage img) {
    boolean bRet = true;

    if (memorymode < 0) return img;

    dim[0] = img.width;
    dim[1] = img.height;

    img.loadPixels();
    if (JSpout.ReadTexture(dim, img.pixels)) {
      if (dim[0] != img.width || dim[1] != img.height && dim[0] > 0 && dim[1] > 0) {
        img.resize(dim[0], dim[1]);
      }
      img.updatePixels();
    }
    return img;
  }

  public void closeReceiver() {
    if (JSpout.ReleaseReceiver())
      print("Receiver closed" + "\n");
    else
      print("No receiver to close" + "\n");
  }

  boolean CreateSpoutControl(String name, String type) {
    return(JSpout.CreateControl(name, type, 0, 1, 1, ""));
  }

  boolean CreateSpoutControl(String name, String type, float value) {
    return(JSpout.CreateControl(name, type, 0, 1, value, ""));
  }

  boolean CreateSpoutControl(String name, String type, String text) {
    return(JSpout.CreateControl(name, type, 0, 1, 1, text));
  }

  boolean CreateSpoutControl(String name, String type, float minimum, float maximum, float value) {
    return(JSpout.CreateControl(name, type, minimum, maximum, value, ""));
  }

  boolean OpenSpoutControls(String name) {
    return(JSpout.OpenControls(name));
  }

  int CheckSpoutControls(String[] controlName, int[] controlType, float[] controlValue, String[] controlText ) {
    return JSpout.CheckControls(controlName, controlType, controlValue, controlText);
  }

  boolean CloseSpoutControls() {
    return(JSpout.CloseControls());
  }
}