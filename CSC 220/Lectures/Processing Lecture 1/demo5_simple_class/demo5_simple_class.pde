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
  display();
  move();
}

void display() {
  for (Avatar a : avatars) {
      stroke(0, 0, 255);
      fill(255, 128, 0);
      ellipse(a.x, a.y, a.w, a.h);
      stroke(0);
      fill(255);
      rect(a.x, a.y, a.w/2, a.h/2);
  }
}

void move() {
  for (Avatar a : avatars) {
      a.x += a.xspeed;
      a.y += a.yspeed;
      if (a.x > width+a.w || a.x < 0-a.w) {
        a.xspeed = - a.xspeed;
      }
      if (a.y < 0-a.h || a.y > height+a.h) {
        a.yspeed = - a.yspeed;
      }
  }
}

class Avatar {
    int x, y;
    int xspeed, yspeed;
    int w, h;
}
