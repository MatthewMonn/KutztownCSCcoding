//////////////////////////////////////////////////////////////////////////////
// PokeMMOLogo concrete class

/**
 *  PokeMMOLogo is my Avatar-derived class that displays & moves a mobile
 *  PokeMMOLogo. You must write your own Avatar-derived class. You can delete
 *  class Professor or use it to interact with your Avatar-derived class.
**/

class PokeMMOLogo extends CollisionDetector {
  /* The data fields store the state of the Avatar. */
  protected int legdist = 0 ; // You can initialize to a constant here.
  PokeMMOLogo(int avx, int avy, float spdx, float spdy, float avscale,float scalespeed, float rotation, float rotatespeed) {
    super(avx,avy,spdx,spdy,avscale,scalespeed, rotation, rotatespeed); //change constructor to call in rotatespeed. call rotate after translate. 
    // Call the base class constructor to initialize its data fields,
    // then initialize this class' data fields.
    xlimitright = width ;
    ylimitbottom = height ; // limit off-screen motion to
    xlimitleft = 0 ;    // one width or height off the display
    ylimittop = 0 ;    // in either direction
    
  }
  void shuffle() {
    forceshuffle(); // always do it.
  }
  // The display() function simply draws the Avatar object.
  // The move() function updates the Avatar object's state.
  void display() {
    // Draw the avatar.
    push(); // STUDENT *MUST* use push() & translate first in display().
    translate(myx, myy);
    if (myrot != 0.0) { //to rotate the avatar in association with move(). 
      rotate(radians(myrot));
    }
    if (myscale != 1.0) {
      scale(myscale);
    }
    strokeWeight(5);
    circle(0,0, 150); //0,0 reference point for the avatar. 
    noStroke();
    fill(0);
    ellipse(0, 0, 130, 130); //creates black background in circle to draw.
    fill(255);
    rect(0, 0, 130, 10); //creates the horizontal bar for the logo in the middle.  
    ellipse(0, 0, 60, 60); //creates arc shapes. 
    fill(0);
    ellipse(0, 0, 45, 45); //final black ellipse to put a black dot in middle.
    pop(); 
  }
  // The move() function updates the Avatar object's state.
  void move() {
    // get ready for movement in next frame.
    myx = round(myx + speedX) ; //updated speed of rotation of speed here. 
    myy = round(myy + speedY) ; //then call rotateBB to rotate the bounding box included. 
    myrot += rotspeed ; // while loops to update the rotation of avatar. 
    while (myrot >= 360) {
      myrot -= 360 ;
    } 
    while (myrot < 0) {
      myrot += 360;
    } 
    detectCollisions();
  }
  int [] getBoundingBox() {
    int [] result = new int[4]; //result returned for correct bounding box of avatar. 
    result[0] = myx-round(78*myscale) ; 
    result[1] = myy - round(78*myscale);
    result[2] = myx + round(78 * myscale);
    result[3] = myy + round(78*myscale) ; 
    return result ;
  }
}
