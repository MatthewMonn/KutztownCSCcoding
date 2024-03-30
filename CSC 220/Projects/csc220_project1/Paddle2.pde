//////////////////////////////////////////////////////////////////////////////
// Paddle2 concrete class

/**
 *  Paddle2 extends class Furniture into a mobile, rotating rectangle.
**/
class Paddle2 extends Furniture {
  // Call base class constructor to initialize its fields,
  // then initialize fields added by this class (none presently),
  // and let limits on off-screen excursions.
  protected int direction = 1;
  Paddle2(int avx, int avy, int w, int h, float rotatespeed, int c) {
    super(avx, avy, w, h, c);
    rotspeed = rotatespeed ;
    xlimitright = 2 * width ;
    ylimitbottom = 2 * height ;
    xlimitleft = - width ;    // one width or height off the display
    ylimittop = - height ;    // in either direction
  }
  void move() {
     myrot -= rotspeed;
   while (myrot <= 360) { //similar to paddle class, but rotates the other way.
      myrot += 360 ;
    } 
    while (myrot > 0) {
      myrot -= 360;
    }
    super.move(); // Do the base class move for those parts.
  }
}
