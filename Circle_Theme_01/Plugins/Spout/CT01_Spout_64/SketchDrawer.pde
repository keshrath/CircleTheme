class SketchDrawer {

  private float angle;

  private Config config;

  public void init(Config config) {
    angle = 0;
    this.config = config;
    
    strokeWeight(config.getStrokeWeight());
    stroke(config.getbColH(), config.getbColS(), config.getbColB());
    fill(config.getfColH(), config.getfColS(), config.getfColB());
  }

  public void update() {
    strokeWeight(config.getStrokeWeight());
    stroke(config.getbColH(), config.getbColS(), config.getbColB());
    fill(config.getfColH(), config.getfColS(), config.getfColB());
  }

  public void render() {
    rectMode(CENTER);
    background(config.getbColH(), config.getbColS(), config.getbColB());
    translate(width/2, height/2);

    for (int i=0; i < config.getBlocks(); i++) {
      rotate(angle);
      scale(0.95);
      rect(0, 0, config.getBlocksize(), config.getBlocksize());
    }
    
    angle += 0.001;
  }
  
}