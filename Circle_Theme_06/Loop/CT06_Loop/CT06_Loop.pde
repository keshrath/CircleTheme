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
 
 int picSave = 1;

int direction = 1;
int counter = 1;

int startSize = 100;
int minSize = 60;
int maxSize = 200;
int spacing = 70;

int strokeFactor = 70;

int widthPadding;
int heightPadding;
float currentSize;

void setup() {
  size(1280, 720);
  background(0);

  widthPadding = (int) (width - ((width / spacing) * spacing)) /2;
  heightPadding = (int) (height - ((height / spacing) * spacing)) /2;

  currentSize = startSize;
}

void draw() {
  fill(0, 30);
  rect(0, 0, width + 25, height + 25);

  for (int i = (spacing/2) + widthPadding; i < width - widthPadding; i += spacing) {
    for (int j = (spacing/2) + heightPadding; j < height - heightPadding; j += spacing) {
      stroke(255);
      
      noFill();
      ellipse(i, j, currentSize, currentSize);
    }
  }

  currentSize += direction;

  if (currentSize >= maxSize) {
    direction = direction * -1;
  }
  if (currentSize <= minSize) {
    direction = direction * -1;
  }

  if (currentSize == startSize) {
    counter++;
    if (counter == 7) {
      println("DONE");
      noLoop();
    }
  }

  if (counter >=5) {
    saveFrame("Save_" + picSave + ".tif");
    picSave++;
  }
}