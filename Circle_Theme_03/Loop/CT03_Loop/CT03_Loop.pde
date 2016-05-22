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

float angle = 0;

boolean recorde = false;
int frameGap = 1;
int picSave = 1;

void setup() {
  size(1280, 720);
  
  background(0);
}

void draw() {
  fill(0, 50);
  rect(-1, -1, width+1, height+1);

  translate(width/2, height/2);

  scale(1.4);

  if (angle == 1800) {
    recorde = true;
  }

  if (angle == 5400) {
    println("DONE!");
    noLoop();
  }

  for (int x = -100; x <= 100; x+=10) {
    for (int y = -100; y <= 100; y+=10) {
      float d = dist(x, y, 0, 0);
      float d2 = sin(radians(d))*d;
      stroke(255, 255, 255, 255-d2*3);

      pushMatrix();
      translate(x*2, y*2);
      rotate(radians(angle/10));
      line(x, y, 0, 0);
      popMatrix();

      pushMatrix();
      translate(x*2, y*2);
      rotate(radians(-(angle/10)));
      line(x, y, 0, 0);
      popMatrix();
    }
  }

  angle += 1;

  if (recorde && frameCount % frameGap == 0) {
    saveFrame("Save_" + picSave + ".tif");
    picSave++;
  }
}