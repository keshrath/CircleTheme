class SketchDrawer {

  private Config config;

  public void init(Config config) {
    this.config = config;

    strokeWeight(config.getStrokeWeight());
  }

  public void update() {
    strokeWeight(config.getStrokeWeight());
  }

  public void render() {
    fill(0, 50);
    rect(-1, -1, width+1, height+1);
    
    translate(width/2, height/2);
    scale(config.getScale());
    
    for (int x = (-1) * config.getX(); x <= config.getX(); x+=10) {
      for (int y = (-1) * config.getY(); y <= config.getY(); y+=10) {
        float d = dist(x, y, 0, 0);
        float d2 = sin(radians(d))*d;
        
        stroke(config.getsColH(), config.getsColS(), config.getsColB(), 255 - d2 * 3);
   
        pushMatrix();
        translate(x * config.getmX1(), y * config.getmY1());
        rotate(radians(frameCount));
        line(x, y, 0, 0);
        popMatrix();
         
        pushMatrix();
        translate(x * config.getmX2(), y * config.getmY2());
        rotate(radians(-frameCount));
        line(x, y, 0, 0);
        popMatrix();
      }
    }
  }
 
}