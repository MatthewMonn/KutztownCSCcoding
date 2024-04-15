// CSC220F19DemoA_SetupDraw Parson's csc120 recap
// modified by Schwesinger
int elx, ely;
int exspeed, eyspeed;
int ewidth = 75, eheight = 50;

int elx2, ely2;
int exspeed2, eyspeed2 ;
int ewidth2 = 75, eheight2 = 50;

void setup() {
  size(500, 500);
  frameRate(60);

  elx = width / 2 ;
  ely = height / 3 ;
  exspeed = 5 ;
  eyspeed = -3 ;

  elx2 = width / 3 ;
  ely2 = height / 2 ;
  exspeed2 = -5 ;
  eyspeed2 = 3 ;

  rectMode(CENTER);
  ellipseMode(CENTER);
}

void draw() {
  background(255, 255, 0);
  display();
  move();
}

void display() {
  stroke(0, 0, 255);
  fill(255, 128, 0);
  ellipse(elx, ely, ewidth, eheight);
  stroke(0);
  fill(255);
  rect(elx, ely, ewidth/2, eheight/2);

  stroke(0, 0, 255);
  fill(255, 128, 0);
  ellipse(elx2, ely2, ewidth2, eheight2);
  stroke(0);
  fill(255);
  rect(elx2, ely2, ewidth2/2, eheight2/2);
}

void move() {
  elx = elx + exspeed;
  ely += eyspeed;
  if (elx > width+ewidth || elx < 0-ewidth) {
    exspeed = - exspeed;
  }
  if (ely < 0-eheight || ely > height+eheight) {
    eyspeed = - eyspeed;
  }

  elx2 = elx2 + exspeed2;
  ely2 += eyspeed2;
  if (elx2 > width+ewidth2 || elx2 < 0-ewidth2) {
    exspeed2 = - exspeed2;
  }
  if (ely2 < 0-eheight2 || ely2 > height+eheight2) {
    eyspeed2 = - eyspeed2;
  }
}
