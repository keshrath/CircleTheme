class SketchDrawer {

  private Config config;

  private ArrayList<Circle> circles;
  private ArrayList<Point> points;  

  private int currentMode;
  private int currentCircles;
  private int currentSpacing;
  private boolean currentMiddle;

  public void init(Config config) {
    this.config = config;

    strokeWeight(config.getStrokeWeight());

    currentMode = config.getMode();
    currentCircles = config.getCircles();
    currentSpacing = config.getSpacing();
    currentMiddle = config.isMiddle();

    setUp();
  }

  public void update() {
    strokeWeight(config.getStrokeWeight());

    boolean setUp = false;

    if (currentMode != config.getMode()) {
      setUp = true;
    }
    if (currentCircles != config.getCircles()) {
      setUp = true;
    }
    if (currentSpacing != config.getSpacing()) {
      setUp = true;
    }
    if (currentMiddle != config.isMiddle()) {
      setUp = true;
    }

    currentMode = config.getMode();
    currentCircles = config.getCircles();
    currentSpacing = config.getSpacing();
    currentMiddle = config.isMiddle();

    if (setUp) {
      setUp();
    }
  }

  public void render() {
    background(0);

    if (config.isPoints()) {
      for (int a = 0; a < points.size(); a++) {
        points.get(a).render();
      }
    }

    for (int a = 0; a < circles.size(); a++) {
      circles.get(a).render(points);
    }
  }

  private void setUp() {
    circles = new ArrayList<Circle>();
    points = new ArrayList<Point>();

    if (config.getMode() == 0) {
      int max = config.getCircles() > 5 ? 5 : config.getCircles();

      switch (max) {
        case 5:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 1));
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 1));
        case 4:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 100));
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 100));
        case 3:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 200));
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 200));
        case 2:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 300));
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 300));
        case 1:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 400));
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 400));
          break;
        default: 
          break;
      }
    } else if(config.getMode() == 1) {
      switch (config.getCircles()) {
        case 17:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 375));
        case 16:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 25));
        case 15:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 275));
        case 14:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 125));
        case 13:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 225));
        case 12:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 175));
        case 11:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 325));
        case 10:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 75));
        case 9:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 350));
        case 8:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 50));
        case 7:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 250));
        case 6:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 150));
        case 5:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 300));
        case 4:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 100));
        case 3:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 200));
        case 2:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 400));
        case 1:  
          circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 1));
          break;
        default: 
          break;
      }
    } else if(config.getMode() == 2) {
      for(int i = 0; i < config.getCircles(); i++) {
        if(i != 0) {
          circles.add(new Circle(new PVector(width/2, height/2), dist(510/2, 510/2, 0, 0), 0, 510, 1 + (i*30)));
        } else {
          circles.add(new Circle(new PVector(width/2, height/2), dist(510/2, 510/2, 0, 0), 0, 510, 1));
        }
      }
    } else if(config.getMode() == 3) {
      switch (config.getCircles()) {
        case 17:  
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 375));
        case 16:  
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 25));
        case 15:  
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 275));
        case 14:  
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 125));
        case 13:  
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 225));
        case 12:  
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 175));
        case 11:  
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 325));
        case 10:  
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 75));
        case 9:  
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 350));
        case 8:  
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 50));
        case 7:  
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 250));
        case 6:  
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 150));
        case 5:  
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 300));
        case 4:  
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 100));
        case 3:  
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 200));
        case 2:  
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 400));
        case 1:  
          circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 1));
          break;
        default: 
          break;
      }
    } else if(config.getMode() == 4) {
      for(int i = 0; i < config.getCircles(); i++) {
        if(i != 0) {
          circles.add(new Circle(new PVector(width/2, height/2), 0,  dist(510/2, 510/2, 0, 0), 510, 1 + (i*30)));
        } else {
          circles.add(new Circle(new PVector(width/2, height/2), 0,  dist(510/2, 510/2, 0, 0), 510, 1));
        }
      }
    } else if(config.getMode() == 5) {
      int max = config.getCircles() > 10 ? 10 : config.getCircles();
      
      for(int i = 0; i < max; i++) {
        if(i != 0) {
          circles.add(new Circle(new PVector(width/2, height/2), 0,  dist(300/2, 300/2, 0, 0), 300, 1 + (i*30)));
        } else {
          circles.add(new Circle(new PVector(width/2, height/2), 0,  dist(300/2, 300/2, 0, 0), 300, 1));
        }
      }
    } else if(config.getMode() == 6) {      
      for(int i = 0; i < config.getCircles(); i++) {
        if(i != 0) {
          circles.add(new Circle(new PVector(width/2, height/2), 0,  dist((width)/2, (height)/2, 0, 0), 600, 1 + (i*40)));
        } else {
          circles.add(new Circle(new PVector(width/2, height/2), 0,  dist((width)/2, (height)/2, 0, 0), 600, 1));
        }
      }
    }

    for (int i = width/2; i > 5; i -= config.getSpacing()) {
      for (int j = height/2; j > 5; j -= config.getSpacing()) {
        if (i == width/2 && j == height/2) {
          if (config.isMiddle()) {
            points.add(new Point(i, j));
          }
        } else {
          points.add(new Point(i, j));
        }
      }
    }

    for (int i = width/2 - config.getSpacing(); i > 5; i -= config.getSpacing()) {
      for (int j = height/2 + config.getSpacing(); j < (height - 5); j += config.getSpacing()) {
        points.add(new Point(i, j));
      }
    }

    for (int i = width/2 + config.getSpacing(); i < (width - 5); i += config.getSpacing()) {
      for (int j = height/2 - config.getSpacing(); j > 5; j -= config.getSpacing()) {
        points.add(new Point(i, j));
      }
    }

    for (int i = width/2; i < (width - 5); i += config.getSpacing()) {
      for (int j = height/2; j < (height - 5); j += config.getSpacing()) {
        if (!(i == width/2 && j == height/2)) {
          points.add(new Point(i, j));
        }
      }
    }
  }
}

class Circle {
  PVector origine;
  float angle, vangle;
  float tailleDepart, tailleFin;
  int etapes, etape;
  int n=120;

  Circle(PVector origine, float tailleDepart, float tailleFin, int etapes, int start) {
    this.origine = origine;
    this.tailleDepart = tailleDepart;
    this.tailleFin = tailleFin;
    this.etapes = etapes;

    etape = start;
    angle = 0;
    vangle = random(-0.1, 0.1);
  }

  public void render(ArrayList<Point> points) {
    float ray = tailleFin + ((tailleDepart - tailleFin) / etapes) * etape;

    etape--;

    if (etape == 0) {
      etape = etapes;
    }

    angle+=vangle;

    for (float a = 0; a < TWO_PI; a+= (TWO_PI/n)) {
      PVector p = new PVector(origine.x + cos(a+angle) * ray, origine.y + sin(a+angle) * ray);

      for (int i=0; i < points.size(); i++) {
        Point s = points.get(i);
        float d = dist(s.p.x, s.p.y, p.x, p.y);
        if (d<40) {
          stroke(255, map(d, 0, 40, 255, 0));
          line(s.p.x, s.p.y, p.x, p.y);
        }
      }
    }
  }
}

class Point {
  PVector p;

  Point(float x, float y) {
    p = new PVector(x, y);
  }

  public void render() {
    point(p.x, p.y);
  }
}