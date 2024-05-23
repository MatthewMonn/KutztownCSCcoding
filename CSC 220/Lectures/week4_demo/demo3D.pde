/*
  CSC220FA2022DemoSome3D derived from ...
  CSC480FA2021DemoSome3D derived from ...
  CSC220F19DemoPShapeCylinder demos a cylinder supplied by a student solution
  for assignment 2, csc220 fall 2019.
  D. Parson, Fall 2019, CSC220.
  This sketch demos basic 3D shapes, camera() navigation, and PShape vector graphics.

  KEYBOARD COMMANDS:
  x or X rotate scene around X axis (upper case reverses direction)
  y or Y rotate scene around Y axis (upper case reverses direction)
  z or Z rotate scene around Z axis (upper case reverses direction)
  e w n s move camera to east west north south, upper case goes faster
  u d move camera up, down in z direction, upper case faster
  R resets to starting camera POV and no world rotation
  T textures the PShapes with a PImage
  t removes the PImage texture from the PShapes
  p sets display mode to perspective
  o sets display mode to orthogonal (useful for debugging X,Y,Z alignment)
  IF A KEY STICKS, HIT SPACE BAR TO UNSTICK IT.
*/

PShape demoCylinder = null, demoBox = null, demoSphere = null ;
PImage textureImage = null ;
boolean isPerspective = true ;
float xeye = 0, yeye = 0, zeye = 1000;
float worldxrotate = 0, worldyrotate = 0, worldzrotate = 0;
final float degree = radians(1);
final float around = radians(360);

// Parameters for the demo cylinder:
final int cradius = 80, cheight = 200, cdetail = 32 ;

void setup() {
  size(1500, 1000, P3D);
  frameRate(60);    // Must immediately follow size() or fullScreen() for newer macs.
  shapeMode(CENTER);
  rectMode(CENTER);
  shapeMode(CENTER);
  imageMode(CENTER);
  textAlign(LEFT);
  demoCylinder = makeCylinder(cradius, cheight, cdetail, 0, 255, 255);
  demoBox = createShape(BOX, 100, 150, 200);
  demoBox.translate(50, 75, 0); // appears to be a bug in shapeMode, offset 1/2 of box width & height
  demoSphere = createShape(SPHERE, 150);  // argument is radius, X 2 is diameter
  demoSphere.translate(150, 150, 0); // appears to be a bug in shapeMode, offset 1/2 of box width & height
  textureImage = loadImage("IceCrystals.jpg");
  background(255);
  xeye = width / 2 ;
  yeye = height / 2 ;
  zeye = 1000 ;   // place eye (camera point-of-view POV) above the display Z==0 plane
}

void draw() {
  // display 3D shapes
  if (isPerspective) {
    perspective();  // perspective projection dimihses towards vanishing point(s), reveals sides
  } else {
    ortho() ; // easier to see alignment of X,Y,Z boundaries
  }
  background(255);
  moveCameraRotateWorldKeys();
  push();
  translate(width/2, height/2, 0);
  // Draw a bounding box using lines around the cylinder to ensure correct center of it.
  line(-cradius, -height/2, -cradius, height/2);
  line(cradius, -height/2, cradius, height/2);
  line(-width/2, -cheight/2, width/2, -cheight/2);
  line(-width/2, cheight/2, width/2, cheight/2);
  stroke(0);
  demoCylinder.setFill(color(255, 255, 0)); // These override defaults for the PShape.
  demoCylinder.setStroke(color(0,255,255));
  demoCylinder.setStrokeWeight(2);
  push();
  translate(0, 0, 0);
  shape(demoCylinder, 0, 0);  // translate 0,0,0 point gives center of rotation
  pop();
  // POSITION A BOX
  push();
  translate(-width/4, 0, 0);   // We must use translate to position a box or sphere.
  fill(0, 255, 255);
  box(100, 150, 200);
  pop();
  // BOX COMPLETED
  // POSITION A SPHERE
  push();
  translate(0, -height/4-height/8, 0);   // We must use translate to position a box or sphere.
  scale(1, 1.5, 1);    // Must used scale to elongate / deform 1 or 2 sphere dimension
  // 3D has distinct rotateX(radians), rotateY(radians), and rotateZ(radians)
  fill(255, 0, 255);
  texture(textureImage);
  sphere(150);
  pop();
  // SPHERE COMPLETED
  // POSITION A PSHAPE BOX
  push();
  translate(width/4, 0, 0);   // We must use translate to position a box or sphere.
  demoBox.setFill(color(0, 255, 0));  // use color() to compress RGB into an int
  shape(demoBox, 0, 0);
  pop();
  // PSHAPE BOX COMPLETED
  // POSITION A PSHAPE SPHERE
  push();
  translate(0, height/4+height/8, 0);   // We must use translate to position a box or sphere.
  demoSphere.setFill(color(255, 255, 0));  // use color() to compress RGB into an int
  shape(demoSphere, 0, 0);
  pop();
  // PSHAPE SPHERE COMPLETED
  pop();
}

PShape makeCylinder(float radius, float height, int detail, int Red, int Green, int Blue) {
  textureMode(NORMAL);
  PShape cyl = createShape();
 
  cyl.beginShape(QUAD_STRIP);
 
  cyl.stroke(0);
  cyl.strokeWeight(1);
  cyl.fill(Red, Green, Blue);
  float angle = TWO_PI / detail;
  for (int i = 0; i <= detail; i++) {
    float x = sin(i * angle);
    float z = cos(i * angle);
    float u = float(i) / detail;
    cyl.normal(x, 0, z);
    cyl.vertex(x * radius, -height/2, z * radius, u, 0);
    cyl.vertex(x * radius, +height/2, z * radius, u, 1);
  }
  cyl.endShape();
  cyl.translate(radius, height/2, 0);  // Above code has it offset to LEFT and UP.
  return cyl;
}

void keyPressed() {
  if (key == 'R') {
    xeye = width / 2 ;
    yeye = height / 2 ;
    zeye = 1000 ;   // place eye (camera point-of-view POV) above the display Z==0 plane
    worldxrotate = worldyrotate = worldzrotate = 0 ;
  } else if (key == 'T' || key == 't') {
    PImage t = null ;
    if (key == 'T') {
      t = textureImage ;
    } else {
      t = null ;
    }
    demoCylinder.setTexture(t);
    demoBox.setTexture(t);
    demoSphere.setTexture(t);
  } else if (key == 'p') {
    isPerspective = true ;
  } else if (key == 'o') {
    isPerspective = false ;
  }
}

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
  //camera(xeye, yeye,  zeye, xeye, yeye,  zeye-signum(zeye-minimumZ)*maximumZ*2 , 0,1,0);
  camera(xeye, yeye,  zeye, xeye, yeye,  0,  // Look towards the Z=0 plane.
    0,1,0);
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
    // Do not use push()-pop() instead of the inverse translate,
    // because pop() would discard the rotations.
  }
}

    

