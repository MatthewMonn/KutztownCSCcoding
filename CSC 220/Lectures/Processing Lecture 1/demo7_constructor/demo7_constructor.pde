// CSC220F19DemoA_SetupDraw Parson's csc120 recap
// modified by Schwesinger
int SIZE = 10;
Avatar[] avatars = new Avatar[SIZE];

void setup() {
  size(500, 500);
  frameRate(60);

  for (int i = 0; i < avatars.length; i++) {
      avatars[i] = new Avatar();
  }

  avatars[avatars.length-1] = new Avatar(width/2, height/2, 1, 1, 100, 100);

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

    Avatar() {
      x = (int)random(width);
      y = (int)random(width);
      xspeed = randomSpeed();
      yspeed = randomSpeed();
      w = 75;
      h = 50;
    }

    Avatar(int x, int y, int xspeed, int yspeed, int w, int h) {
      this.x = x;
      this.y = y;
      this.xspeed = xspeed;
      this.yspeed = yspeed;
      this.w = w;
      this.h = h;
    }

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

    int randomSpeed() {
        int result;
        do {
            result = (int)random(-5, 5);
        } while (result == 0);
        return result;
    }
}
