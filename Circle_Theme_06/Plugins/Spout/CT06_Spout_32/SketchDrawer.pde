class SketchDrawer {

  private Config config;

  private int currentSpacing;
  private float currentSize;

  private int widthPadding;
  private int heightPadding;

  private int direction;

  public void init(Config config) {
    this.config = config;
    
    currentSpacing = config.getSpacing();

    setUp();
  }

  public void update() {
    strokeWeight(config.getStrokeWeight());

    boolean setUp = false;

    if (currentSpacing != config.getSpacing()) {
      setUp = true;
    }

    currentSpacing = config.getSpacing();

    if (setUp) {
      setUp();
    }
  }

  public void render() {
    fill(0, config.getBlur());
    rect(0, 0, width + 25, height + 25);

    for (int i = (currentSpacing/2) + widthPadding; i < width - widthPadding; i += currentSpacing) {
      for (int j = (currentSpacing/2) + heightPadding; j < height - heightPadding; j += currentSpacing) {
        stroke(255);

        noFill();
        ellipse(i, j, currentSize, currentSize);
      }
    }

    currentSize += direction;

    if (currentSize >= config.getMaxSize()) {
      direction = direction * -1;
      currentSize = config.getMaxSize();
    }
    if (currentSize <= config.getMinSize()) {
      direction = direction * -1;
      currentSize = config.getMinSize();
    }
  }

  private void setUp() {
    background(0);
    
    direction = 1;

    widthPadding = (int) (width - ((width / currentSpacing) * currentSpacing)) /2;
    heightPadding = (int) (height - ((height / currentSpacing) * currentSpacing)) /2;

    currentSize =  config.getMinSize();
  }
}