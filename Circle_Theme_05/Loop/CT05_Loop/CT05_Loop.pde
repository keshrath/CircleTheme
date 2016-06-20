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

int spacing = 50;

ArrayList<Circle> circles;
ArrayList<Point> points;

void setup() {
  size(1280, 720);

  circles = new ArrayList<Circle>();
  points = new ArrayList<Point>();

  strokeWeight(1.5);

  circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 1));
  circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 100));
  circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 200));
  circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 300));
  circles.add(new Circle(new PVector(width/2, height/2), dist(480/2, 480/2, 0, 0), 0, 400, 400));

  circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 1));
  circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 100));
  circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 200));
  circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 300));
  circles.add(new Circle(new PVector(width/2, height/2), 0, dist(480/2, 480/2, 0, 0), 400, 400));

  for (int i = width/2; i > 5; i -= spacing) {
    for (int j = height/2; j > 5; j -= spacing) {
      if (i == width/2 && j == height/2) {
        // TODO MITTE
      } else {
        points.add(new Point(i, j));
      }
    }
  }

  for (int i = width/2 - spacing; i > 5; i -= spacing) {
    for (int j = height/2 + spacing; j < (height - 5); j += spacing) {
      points.add(new Point(i, j));
    }
  }

  for (int i = width/2 + spacing; i < (width - 5); i += spacing) {
    for (int j = height/2 - spacing; j > 5; j -= spacing) {
      points.add(new Point(i, j));
    }
  }

  for (int i = width/2; i < (width - 5); i += spacing) {
    for (int j = height/2; j < (height - 5); j += spacing) {
      if (!(i == width/2 && j == height/2)) {
        points.add(new Point(i, j));
      }
    }
  }
}

void draw() {
  background(0);

  for (int a=0; a < circles.size(); a++) {
    circles.get(a).render();

    if (a ==0 && circles.get(a).etape== 1) {
      println("DONE");
      noLoop();
    }
  }

  saveFrame();
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
  void render() {
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

  void render() {
    point(p.x, p.y);
  }
}