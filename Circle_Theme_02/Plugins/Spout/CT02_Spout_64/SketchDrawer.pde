class SketchDrawer {

  private int next;

  private float angle;
  private float offset;
  private int time;
  private int swappingTime;

  private int n;
  private int valeurMaxT;

  private Roue[] toutesLesRoues;

  private Config config;

  public void init(Config config) {
    this.config = config;

    n = calcN();
    next = millis() + config.getTime();
    valeurMaxT = config.getValeurMaxT();

    toutesLesRoues = new Roue[0];
    offset = 0;
    swappingTime = 0;

    angle = TWO_PI / n;

    strokeWeight(config.getStrokeWeight());
    stroke(0, 0, 100);
  }

  public void update() {
    strokeWeight(config.getStrokeWeight());
  }

  public void render() {
    background(0);
    translate(width/2, height/2);

    if (next < millis()) {
      if (swappingTime >= config.getSwappingTime()) {
        n = calcN();
        swappingTime = 0;
      } else {
        swappingTime++;
      }

      offset = offset + angle / 2;
      valeurMaxT = config.getValeurMaxT();
      angle = TWO_PI / n;

      if (toutesLesRoues.length > 0 && toutesLesRoues[0].maxt < 1) {
        toutesLesRoues[0].r = 0;
        toutesLesRoues[0].maxt = valeurMaxT;
        toutesLesRoues = (Roue[]) append(toutesLesRoues, new Roue(valeurMaxT, n, angle, offset));
        toutesLesRoues = (Roue[]) subset(toutesLesRoues, 1);
      } else {
        toutesLesRoues = (Roue[]) append(toutesLesRoues, new Roue(valeurMaxT, n, angle, offset));
      }

      next = millis() + config.getTime();
    }

    for (Roue r : toutesLesRoues) {
      r.dessine();
    }
  }

  private int calcN() {
    int outputN;

    if (n == 0) {
      outputN = config.getNLowerRange() <= config.getNUpperRange() ? config.getNLowerRange() : config.getNUpperRange();
    } else {
      if (config.getNLowerRange() < config.getNUpperRange()) {
        outputN = n + 1;
        if (outputN > config.getNUpperRange()) {
          outputN = config.getNLowerRange();
        }
      } else if (config.getNLowerRange() > config.getNUpperRange()) {
        outputN = n - 1;
        if (outputN < config.getNLowerRange()) {
          outputN = config.getNUpperRange();
        }
      } else {
        outputN = config.getNLowerRange();
      }
    }

    return outputN;
  }
}

class Roue {
  private Poin[] tousLesPoints;
  private Trait[] Traits;

  private float r;
  private int n;
  private float maxt;
  private float valeurMaxT;
  private float angle;
  private float offset;

  public Roue(int valeurMaxTValue, int nValue, float angleValue, float offsetValue) {
    tousLesPoints = new Poin[nValue];
    Traits = new Trait[0];

    r = 0;
    n = nValue;
    maxt = valeurMaxTValue;
    valeurMaxT = valeurMaxTValue;
    angle = angleValue;
    offset = offsetValue;

    for (int a = 0; a < n; a++) {
      tousLesPoints[a] = new Poin(offset + angle * a);
    }

    for (int a = 0; a < n; a++) {
      Traits = (Trait[]) append (Traits, new Trait(tousLesPoints[0], tousLesPoints[1], this));
      tousLesPoints = (Poin[]) append (tousLesPoints, tousLesPoints[0]);
      tousLesPoints = (Poin[]) subset (tousLesPoints, 1);
    }
  }

  public void dessine() {
    r += 0.5;
    r *= 1.01; 
    maxt = constrain(maxt - 0.5, 0, valeurMaxT); 
    maxt *= 0.99;

    for (Poin p : tousLesPoints) {
      p.calcule(r);
    }

    for (Trait t : Traits) {
      t.dessine();
    }
  }
}

class Poin {
  private float an;
  private float r;
  private float x; 
  private float y;

  public Poin(float anValue) {
    an = anValue;
    r = 0;
    x = 0;
    y = 0;
  }

  public void calcule(float r) {
    x = cos(an)*r;
    y = sin(an)*r;
  }
}

class Trait {
  private Roue parent;
  private Poin p1;
  private Poin p2;

  public Trait(Poin p1, Poin p2, Roue parent) {
    this.parent = parent;
    this.p1 = p1;
    this.p2 = p2;
  }

  public void dessine() {
    float d = dist(p1.x, p1.y, p2.x, p2.y);
    if (d < parent.maxt) {
      line(p1.x, p1.y, p2.x, p2.y);
    } else {
      line(p1.x, p1.y, p1.x + ((p2.x-p1.x) / (d/2)) * (parent.maxt/2), p1.y+((p2.y-p1.y) / (d/2)) * (parent.maxt/2));
      line(p2.x, p2.y, p2.x + ((p1.x-p2.x) / (d/2)) * (parent.maxt/2), p2.y+((p1.y-p2.y) / (d/2)) * (parent.maxt/2));
    }
  }
}