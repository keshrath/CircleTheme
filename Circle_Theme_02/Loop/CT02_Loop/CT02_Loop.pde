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

/**
 * This sketch generates an image sequence. It can be used to render the loop for
 * a different resolution.
 */
 
int next;

float angle;
float offset;
int swappingTime;

int n;
int valeurMaxT;

Roue[] toutesLesRoues;

int picSave;
boolean recorde;

void setup() {
  size(1280, 720);

  colorMode(HSB, 360, 100, 100, 255);

  picSave = 1;
  recorde = false;

  n = 2;
  next = frameCount + 25;
  valeurMaxT = 350;

  toutesLesRoues = new Roue[0];
  offset = 0;
  swappingTime = 0;

  angle = TWO_PI / n;

  strokeWeight(5);
  stroke(0, 0, 100);
}

void draw() {
  background(0);
  translate(width/2, height/2);

  if (next < frameCount) { 
    angle = TWO_PI / n;
    offset = offset + angle / 2;

    if (swappingTime < 6) {
      if (toutesLesRoues.length > 0 && toutesLesRoues[0].maxt < 1) {
        toutesLesRoues[0].r = 0;
        toutesLesRoues[0].maxt = valeurMaxT;
        toutesLesRoues = (Roue[]) append(toutesLesRoues, new Roue(valeurMaxT, n, angle, offset));
        toutesLesRoues = (Roue[]) subset(toutesLesRoues, 1);
      } else {
        toutesLesRoues = (Roue[]) append(toutesLesRoues, new Roue(valeurMaxT, n, angle, offset));
      }

      swappingTime++;
      next = frameCount + 40;
    } else {
      swappingTime = 0;
      n++;
      offset = 0;

      if (n == 5) {
        n++;
      }

      if (n == 10) {
        n = 2;
        
        if (recorde) {
          println("DONE!");
          noLoop();
        } else {
          recorde = true;
        }
      }

      if (n == 3) {
        next = frameCount + 60;
      } else {
        next = frameCount + 30;
      }
    }
  }

  for (Roue r : toutesLesRoues) {
    r.dessine();
  }
  
   if (recorde) {
    saveFrame("Save_" + picSave + ".tif");
    picSave++;
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