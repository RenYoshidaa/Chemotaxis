Bacteria[] colony;
 
void setup() {
  size(800, 600);
  colony = new Bacteria[100];
  for (int i = 0; i < colony.length; i++) {
    colony[i] = new Bacteria(width / 2, height / 2);
  }
}

void draw() {
  background(0);
  for (int i = 0; i < colony.length; i++) {
    colony[i].move();
    colony[i].show();
  }
}

class Bacteria {
  int x;
  int y;
  color c;

  Bacteria(int startX, int startY) {
    x = startX;
    y = startY;
    c = color((int)(Math.random() * 255.0), (int)(Math.random() * 255.0), (int)(Math.random() * 255.0));
  }

  void move() {
    int dx = (int)(Math.random() * 3.0) - 1; 
    int dy = (int)(Math.random() * 3.0) - 1;

    double chance = Math.random();
    if (mouseX > x && chance < 0.5) {
      x = x + 1;
    } else if (mouseX < x && chance < 0.5) {
      x = x - 1;
    } else {
      x = x + dx;
    }

    chance = Math.random();
    if (mouseY > y && chance < 0.5) {
      y = y + 1;
    } else if (mouseY < y && chance < 0.5) {
      y = y - 1;
    } else {
      y = y + dy;
    }

    x = constrain(x, 0, width - 1);
    y = constrain(y, 0, height - 1);
  }

  void show() {
    noStroke();
    fill(c);
    ellipse(x, y, 8, 8);
  }
}
