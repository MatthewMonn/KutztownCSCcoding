// TreeCurveStroke3DFall2022_020

// Variables for camera manipulation:
float xeye, yeye, zeye ;    // locations of the camera's eye in 3D space
// Next 3 variables rotate the world from the camera's point of view.
float worldxrotate = 0.0, worldyrotate = 0.0, worldzrotate = 0.0 ;
// Some basic symbolic constants.
final float degree = radians(1.0), around = radians(360.0);
int minimumZ, maximumZ ; // initialized in setup.

float windSpeed = 0, windSpeedChange = 1 ;
final float windSpeedLimit = 10.0 ;

void setup() {
  size(1500, 1000, P3D);
  frameRate(60);
  colorMode(HSB, 360, 100, 100, 100);
  background(200, 100, 75);
  maximumZ = height / 2 ;  // front of the scene
  minimumZ = - height / 2 ;  // back of the scene
  xeye = width / 2 ;
  yeye = height / 2 ;
  zeye = (height);
}

void draw() {
  moveCameraRotateWorldKeys();
  push();
  background(200, 100, 75);
  translate(width/2, height-10);
  drawTree(height/2, height/48, 10, 0);
  pop();
  moveWind();
}

void moveWind() {
  windSpeed += windSpeedChange ;
  if (windSpeed >= windSpeedLimit) {
    windSpeedChange = - abs(windSpeedChange);
  } else if (windSpeed <= - windSpeedLimit) {
    windSpeedChange = abs(windSpeedChange);
  }
}

void drawTree(int length, int limit, float sweight, int rotateSign) {
  push();
  strokeWeight(sweight);
  float angle = 40.0;
  if (length < limit) {
    // THIS IS THE BASE CASE, NO RECURSION
    stroke(95, 100, 30);  // dark green pine needles, was yellow buds
    push();
    rotateX(radians(windSpeed*rotateSign));
    line(0, 0, 0, -length);
    pop();
    push();
    rotateY(radians(windSpeed*rotateSign));
    line(0, 0, 0, -length);
    pop();
    rotateZ(radians(windSpeed*rotateSign));
  } else {
    stroke(47, 83, 25);   // brownish, i.e., off-orange
  }
  line(0, 0, 0, -length); // original tree trunk or current branch
  if (length >= limit) {
    push();
    translate(0, -length/2);
    rotate(radians(-(angle)));
    int newlen = length / 2 ;
    float newsw = sweight / 1.5 ;
    drawTree(newlen, limit, newsw, -1);
    rotate(radians((angle*2)));
    drawTree(newlen, limit, newsw, 1);
    // replace with a for loop:... This draws a subtree at the top.
    rotate(radians(-(angle)));  // in line with verical
    translate(0, -length/2);
    rotate(radians(-(angle)));
    drawTree(newlen, limit, newsw, -1);
    rotate(radians((angle*2)));
    drawTree(newlen, limit, newsw, 1);
    pop();
    
    push();
    translate(0, -length/2);
    rotateX(radians(-(angle)));
    drawTree(newlen, limit, newsw, -1);
    rotateX(radians((angle*2)));
    drawTree(newlen, limit, newsw, 1);
    // replace with a for loop:... This draws a subtree at the top.
    rotateX(radians(-(angle)));  // in line with verical
    translate(0, -length/2);
    rotateX(radians(-(angle)));
    drawTree(newlen, limit, newsw, -1);
    rotateX(radians((angle*2)));
    drawTree(newlen, limit, newsw, 1);
    pop();
  }
  pop();
}

// Added 9/15/2018 to move camera and rotate world when these keys are held down.
void moveCameraRotateWorldKeys() {
  if (keyPressed) {
    if (key == 'u') {
      zeye += 10 ;
      // println("DEBUG u " + zeye + ", minZ: " + minimumZ + ", maxZ: " + maximumZ);
    } else if (key == 'U') {
      zeye += 100 ;
      // println("DEBUG U " + zeye + ", minZ: " + minimumZ + ", maxZ: " + maximumZ);
    } else if (key == 'd') {
      zeye -= 10 ;
      // println("DEBUG d " + zeye + ", minZ: " + minimumZ + ", maxZ: " + maximumZ);
    } else if (key == 'D') {
      zeye -= 100 ;
      // println("DEBUG D " + zeye + ", minZ: " + minimumZ + ", maxZ: " + maximumZ);
    } else if (key == 'n') {
      yeye -= 1 ;
    } else if (key == 'N') {
      yeye -= 10 ;
    } else if (key == 's') {
      yeye += 1 ;
    } else if (key == 'S') {
      yeye += 10 ;
    } else if (key == 'w') {
      xeye -= 1 ;
    } else if (key == 'W') {
      xeye -= 10 ;
    } else if (key == 'e') {
      xeye += 1 ;
    } else if (key == 'E') {
      xeye += 10 ;
    } else if (key == 'x') {
      worldxrotate += degree ;
      if (worldxrotate >= around) {
        worldxrotate = 0 ;
      }
    } else if (key == 'X') {
      worldxrotate -= degree ;
      if (worldxrotate < -around) {
        worldxrotate = 0 ;
      }
    } else if (key == 'y') {
      worldyrotate += degree ;
      if (worldyrotate >= around) {
        worldyrotate = 0 ;
      }
    } else if (key == 'Y') {
      worldyrotate -= degree ;
      if (worldyrotate < -around) {
        worldyrotate = 0 ;
      }
    } else if (key == 'z') {
      worldzrotate += degree ;
      if (worldzrotate >= around) {
        worldzrotate = 0 ;
      }
    } else if (key == 'Z') {
      worldzrotate -= degree ;
      if (worldzrotate < -around) {
        worldzrotate = 0 ;
      }
    } else if (mousePressed && key == ' ') {
      xeye = mouseX ;
      yeye = mouseY ;
    }
  }
  // Make sure 6th parameter -- focus in the Z direction -- is far, far away
  // towards the horizon. Otherwise, ortho() does not work.
  camera(xeye, yeye,  zeye, xeye, yeye,  zeye-signum(zeye-minimumZ)*maximumZ*2 , 0,1,0);
  if (worldxrotate != 0 || worldyrotate != 0 || worldzrotate != 0) {
    translate(width/2, height/2, 0);  // rotate from the middle of the world
    if (worldxrotate != 0) {
      rotateX(worldxrotate);
    }
    if (worldyrotate != 0) {
      rotateY(worldyrotate);
    }
    if (worldzrotate != 0) {
      rotateZ(worldzrotate);
    }
    translate(-width/2, -height/2, 0); // Apply the inverse of the above translate.
    // Do not use pushMatrix()-popMatrix() instead of the inverse translate,
    // because popMatrix() would discard the rotations.
  }
}

/** Return 1 for non-negative num, -1 for negative. **/
int signum(float num) {
  return ((num >= 0) ? 1 : -1);
}

void keyPressed() {
  if (key == 'R') { // Reset POV to starting point.
    xeye = width / 2 ;
    yeye = height / 2 ;
    zeye = (height) /* / tan(PI*30.0 / 180.0) */ ;
    worldxrotate = worldyrotate = worldzrotate = 0.0 ;
  }
}
