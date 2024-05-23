// CSC220F19DemoA_SetupDraw Parson's csc120 recap
// modified by Schwesinger
int SIZE = 10;
Avatar[] avatars = new Avatar[SIZE];

void setup() {
  size(500, 500);
  frameRate(60);

  for (int i = 0; i < SIZE; i++) {
      avatars[i] = new Avatar();
      avatars[i].x = (int)random(width);
      avatars[i].y = (int)random(width);
      avatars[i].xspeed = (int)random(-5, 5);
      avatars[i].yspeed = (int)random(-5, 5);
      avatars[i].w = 75;
      avatars[i].h = 50;
  }

  rectMode(CENTER);
  ellipseMode(CENTER);
}

void draw() {
  background(255, 255, 0);
  for (Avatar a : avatars) {
    a.display();
    a.move();
  }
}

class Avatar {
    // class attributes
    int x, y;
    int xspeed, yspeed;
    int w, h;

    void display() {
      stroke(0, 0, 255);
      fill(255, 128, 0);
      ellipse(x, y, w, h);
      stroke(0);
      fill(255);
      rect(x, y, w/2, h/2);
    }

    void move() {
      x += xspeed;
      y += yspeed;
      if (x > width+w || x < 0-w) {
        xspeed = - xspeed;
      }
      if (y < 0-h || y > height+h) {
        yspeed = - yspeed;
      }
    }
}
