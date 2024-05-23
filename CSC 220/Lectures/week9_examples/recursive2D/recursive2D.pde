/************************************************************
/* Sketch: Recursive2020Parson, derived from Recursive2017Parson.
/* Author: Dr. Parson
/* Updated 2/4/2020 for spring 2020 csc480 demo of 2D recursion.
/* Creation Date: 4/19/2017
/* Due Date: Friday, 5/5/2017
/* Course: CSC220 Object Oriented Multimedia Programming
/* Professor Name: Dr. Parson
/* Assignment: 5.
/* Original Sketch name: Recursive2017Parson, Parson's solution.
/* Purpose: Demonstrate & accelerate a recursive graphical shape.
*************************************************************/

// keyPressed() WORKS AS FOLLOWS ('g'..'F' added 2/2020):
// UP increments recursionDepth with no limit.
// DOWN decrements recursionDepth, does not take it < 0.
// RIGHT increments rotationIncrement, wrapping from 359 to 0.
// LEFT decrements rotationIncrement, wrapping from 0 to 359.
// key between '0' and '9' sets eraseRate 0..9, use (key - '0') to get an int value 0..9.
// Upper case 'C' sets eraseRate to 100 ('C' for Clear).
// Upper case 'R' sets eraseRate to 100, rotation and rotationIncrement to 0 ('R' for Reset).
//    'R' also eliminates global rotation and shearing.
// Lower case 'a' to 'f' sets fRate and calls frameRate to value 10..60, just take
// (key - 'a') and multiply by 10 to get a new frameRate.
// 'g' toggles rotation or shearing of the whole space, default is false
// 'r' enters standard rotation, no shearing
// 'x' enters shearX, not shearY or standard rotation
// 'y' enters shearY, not shearX or standard rotation
// 'F' toggles freezing the display

int recursionDepth = 0 ; // How many function calls deep is the recursion, staring at 0 for no recursion. Increment on UP, decrement on DOWN, don't go negative.
float rotation = 0.0 ;   // How many degrees to rotate the shape degrees.
float rotationIncrement = 0 ; // How much to add to rotation as recursion depth increases, increment/decrement on RIGHT/LEFT, keep in range 0..360.
int eraseRate = 100 ; // 100 for full erasure, 0 for none, 1 to 9 for partial> Use key '0'..'9' to set to 0..9, upper case 'C' for 100.
int fRate = 10 ; // frame rate, use keys 'a'..'f' to set it in range 10..60 in increments of 10.
final int strokeSize = 20 ; // basis for strokeWeight()
boolean isSpaceRotating = false ;
enum RotationType {
  ROTATE, SHEARX, SHEARY
};
RotationType rottype = RotationType.ROTATE ;
// Only switch rottype when we approximate 0 degrees rotation
// to avoid a big discontinuity in the shape & space.
RotationType nextrottype = RotationType.ROTATE ;
boolean nextIsSpaceRotating = false ;
boolean isFrozen = false ;

void setup() {
  // fullScreen(P2D);
  size(1500, 1000, P2D);
  frameRate(fRate);
  colorMode(HSB, 360, 100, 100, 100);
  background(0, 100, 50);
  strokeWeight(strokeSize);
}

void draw() {
  if (isFrozen) {
    return ;
  }
  if (eraseRate >= 99) {
    background(0, 100, 50);
  } else if (eraseRate > 0) {
    // Use a translucent rectangle size of window for partial erase.
    fill(0,100,50,eraseRate);
    noStroke();
    rectMode(CORNER);
    rect(0,0,width, height);
  }
  pushMatrix();
  translate(width/2, height/2);  // 0,0 is at middle of the display
  drawRecursiveShape(0, recursionDepth, rotation) ;  // draw the shape
  rotation = (rotation + rotationIncrement) ;  // use this rotation next time in draw().
  // Since rotationIncrement may be negative, use while loop instead
  // of modulo operator to wrap around. Also, update any pending
  // rottype when rotation approaches 0 to avoid jumps in the shape.
  while (rotation < 0.0) {
    rotation += 360.0 ;
  }
  while (rotation >= 360.0) {
    rotation -= 360.0 ;
  }
  if (nextrottype != rottype && rotation <= abs(rotationIncrement)) {
    rottype = nextrottype ;
  }
  if (nextIsSpaceRotating != isSpaceRotating && rotation <= abs(rotationIncrement)) {
    isSpaceRotating = nextIsSpaceRotating ;
  }
  popMatrix();
  //println("frameRate " + frameRate);
}

void drawRecursiveShape(final int mydepth, final int recursionDepth, final float rotation) {
  if (mydepth >= recursionDepth) {
    pushMatrix();
    if (rotation != 0.0) { // rotate the shape just at the time of drawing it.
      // rotate(radians(rotation));
      float rads = radians(rotation) ;
      if (rottype == RotationType.SHEARX) {
        shearX(-rads);
      } else if (rottype == RotationType.SHEARY) {
        shearY(rads);
      } else {
        rotate(rads);
      }
    }
    drawShape(mydepth, rotation);
    popMatrix();
  } else {
    // Partition the entire window from coordinates -width/2,-height/2 TO width/2,height/2
    // into 4 regions in the left upper, left lower, right upper, right lower, then apply
    // drawRecursiveShape recursively. 
    for (int xdelta = -width/4 ; xdelta <= width/4+1 ; xdelta += width/2) {
      for (int ydelta = -height/4 ; ydelta <= height/4+1 ; ydelta += height/2) {
        pushMatrix();
        if (isSpaceRotating && rotation != 0.0) {
          float rads = radians(rotation) ;
          if (rottype == RotationType.SHEARX) {
            shearX(-rads);
          } else if (rottype == RotationType.SHEARY) {
            shearY(rads);
          } else {
            rotate(rads);
          }
        }
        strokeWeight(strokeSize/4);
        stroke(0,0,0);  // black line connector
        line(0,0,xdelta,ydelta); // draw line from center of outer region to center of nested region
        strokeWeight(strokeSize);
        translate(xdelta, ydelta); // 0,0 is now center of outer region to center of nested region
        scale(.5);  // scale to .5 because segmenting into 4 regions gives 1/2 the width and 1/2 the height
        /* THIS WOULD JUST ADD MORE ROTATION TO THE BASE-CASE CALLS TO drawShape.
        if (rotation != 0.0) {
          rotate(radians(rotation));
        }
        */
        drawRecursiveShape(mydepth+1, recursionDepth, rotation);
        popMatrix();
      }
    }
  }
}

void drawShape(int mydepth, final float rotation) {
  // Since HSB uses 0..359 degrees, just like rotation,
  // use rotation for HUE as well. I am adding 175 so
  // it comes out as cyan when there is no rotation.
  stroke((175+rotation)%360,100,100);
  fill((rotation)%360,100,100);
  // Each STUDENT creates their own shape.
  line(-width/4, -height/3, -width/4, height/3);
  line(width/4, -height/3, width/4, height/3);
  line(-width/3, 0, width/3, 0);
  ellipse(0,0,width/12, height/12);
}
 
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      recursionDepth++ ;
      println("recursionDepth " + recursionDepth);
    } else if (keyCode == DOWN) {
      recursionDepth = constrain(recursionDepth-1, 0, recursionDepth);
      println("recursionDepth " + recursionDepth);
    } else if (keyCode == RIGHT) {
      rotationIncrement = ((int)rotationIncrement+1) % 360 ;
      println("rotationIncrement " + rotationIncrement);
    } else if (keyCode == LEFT) {
      rotationIncrement = ((int)rotationIncrement-1+360) % 360 ;
      println("rotationIncrement " + rotationIncrement);
    }
  } else if (key >= '0' && key <= '9') {
    eraseRate = key - '0' ;
    println("eraseRate " + eraseRate);
  } else if (key == 'C') {
    eraseRate = 100 ;
    println("eraseRate " + eraseRate);
  } else if (key == 'R') {
    eraseRate = 100 ;
    rotation = 0 ;
    rotationIncrement = 0 ;
    isSpaceRotating = false ;
    nextIsSpaceRotating = false ;
    rottype = RotationType.ROTATE ;
    nextrottype = RotationType.ROTATE ;
  } else if (key >= 'a' && key <= 'f') {
    fRate = (key - 'a' + 1) * 10 ;
    frameRate(fRate);
    println("fRate " + fRate);
  } else if (key == 'g') {
    nextIsSpaceRotating = ! nextIsSpaceRotating ;
    println("next isSpaceRotating = " + nextIsSpaceRotating);
  } else if (key == 'r') {
    nextrottype = RotationType.ROTATE ;
    println("next rotation type is non-shearing rotate");
  } else if (key == 'x') {
    nextrottype = RotationType.SHEARX ;
    println("next rotation type is 'shearx'");
  } else if (key == 'y') {
    nextrottype = RotationType.SHEARY ;
    println(" nextrotation type is 'sheary'");
  } else if (key == 'F') {
    isFrozen = ! isFrozen ;
    println("isFrozen = " + isFrozen);
  }
}
