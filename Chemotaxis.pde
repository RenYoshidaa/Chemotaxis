 Bacteria[] colony;

void setup() {
  size(800, 600);
  colony = new Bacteria[100];
  for (int i = 0; i < colony.length; i++) {
    colony[i] = new Bacteria(width/2, height/2);
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
  int x, y;
  color c;
  
  Bacteria(int startX, int startY) {
    x = startX;
    y = startY;
    c = color((int)(Math.random()*255), (int)(Math.random()*255), (int)(Math.random()*255));
  }
  
  void move() {
    int dx = (int)(Math.random()*3) - 1; 
    int dy = (int)(Math.random()*3) - 1;
    
    if (mouseX > x) x += (Math.random() < 0.5) ? 1 : dx;
    else if (mouseX < x) x += (Math.random() < 0.5) ? -1 : dx;
    
    if (mouseY > y) y += (Math.random() < 0.5) ? 1 : dy;
    else if (mouseY < y) y += (Math.random() < 0.5) ? -1 : dy;
    
    x = constrain(x, 0, width-1);
    y = constrain(y, 0, height-1);
  }
  
  void show() {
    noStroke();
    fill(c);
    ellipse(x, y, 8, 8);
  }
}
