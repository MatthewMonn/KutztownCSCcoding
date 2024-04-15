// CSC220F19DemoA_SetupDraw Parson's csc120 recap
// modified by Schwesinger
int SIZE = 10;
int[] x = new int[SIZE];
int[] y = new int[SIZE];
int[] xspeed = new int[SIZE];
int[] yspeed = new int[SIZE];
int[] w = new int[SIZE];
int[] h = new int[SIZE];

void setup() {
  size(500, 500);
  frameRate(60);

  for (int i = 0; i < SIZE; i++) {
    x[i] = (int)random(width);
    y[i] = (int)random(height);
    xspeed[i] = (int)random(-5, 5);
    yspeed[i] = (int)random(-5, 5);
    w[i] = 75;
    h[i] = 50;
  }

  rectMode(CENTER);
  ellipseMode(CENTER);
}

void draw() {
  background(255, 255, 0);
  display();
  move();
}

void display() {
  for (int i = 0; i < SIZE; i++) {
      stroke(0, 0, 255);
      fill(255, 128, 0);
      ellipse(x[i], y[i], w[i], h[i]);
      stroke(0);
      fill(255);
      rect(x[i], y[i], w[i]/2, h[i]/2);
  }
}

void move() {
  for (int i = 0; i < SIZE; i++) {
      x[i] += xspeed[i];
      y[i] += yspeed[i];
      if (x[i] > width+w[i] || x[i] < 0-w[i]) {
        xspeed[i] = - xspeed[i];
      }
      if (y[i] < 0-h[i] || y[i] > height+h[i]) {
        yspeed[i] = - yspeed[i];
      }
  }
}
