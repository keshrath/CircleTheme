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
 * a different resolution. Keep in mind that the sketch produces 9000 images. So you
 * might want to change the frame gap variable for a higher resolution, to generate
 * less images.
 */

float angle = 0;
int frameGap = 1;
int picSave = 1;

void setup() {
  size(1920, 1080);

  rectMode(CENTER);
  strokeWeight(23);
  stroke(0);
  fill(255);

  frameRate(60);
}

void draw() {
  background(0);
  translate(width/2, height/2);

  if (angle == 9000) {
    println("DONE!");
    noLoop();
  }

  scale(1.4);

  for (int i = 0; i < 80; i++) {
    rotate(radians(angle/100));
    scale(0.95);
    rect(0, 0, 550, 550);
  }

  angle += 1;

  if (frameCount % frameGap == 0) {
    saveFrame("Save_" + picSave + ".tif");
    picSave++;
  }
}