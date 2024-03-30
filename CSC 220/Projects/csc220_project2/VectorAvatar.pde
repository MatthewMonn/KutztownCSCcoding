/** VectorAvatar is my Avatar-derived class that displays & moves a custom
 * vector PShape. STUDENT must update getBoundingBox() to work with their
 * PShape.
 **/
class VectorAvatar extends CollisionDetector {
    /* The data fields store the state of the Avatar. */
    float rotXspeed = .04 ;
    float rotYspeed = .05 ;
    float myrotX = 0, myrotY = 0 ;
    PShape customPShape = null;
    VectorAvatar(int avx, int avy, int avz, float spdx, float spdy, float spdz, float avscale, PImage img) {
        super(avx,avy,avz,spdx,spdy,spdz,avscale,0,0,0);
        // Call the base class constructor to initialize its data fields,
        // then initialize this class' data fields.
        xlimitright = width ;
        ylimitbottom = height ; // limit off-screen motion to
        xlimitleft = 0 ;    // one width or height off the display
        ylimittop = 0 ;    // in either direction
        rotZspeed = .03 ;
        customPShape = makeCustomPShape(img);
    }
    void shuffle() {
        forceshuffle(); // always do it.
    }
    // The display() function simply draws the Avatar object.
    // The move() function updates the Avatar object's state.
    void display() {
        // Draw the avatar.
        push(); // STUDENT *MUST* use push() & translate first in display().
        translate(myx, myy, myz);
        scale(myscale);
        rotateX(myrotX);
        rotateY(myrotY);
        rotateZ(myrotZ);
        shape(customPShape, 0, 0);
        pop(); // STUDENT *MUST* use pop() last in display().
    }
    // The move() function updates the Avatar object's state.
    void move() {
        // get ready for movement in next frame.
        myx = round(myx + speedX) ;
        myy = round(myy + speedY) ;
        myz = round(myz + speedZ);
        myrotX += rotZspeed ;
        myrotY += rotYspeed ;
        myrotZ += rotZspeed ;
        detectCollisions();
    }
    int [] getBoundingBox() {
        // These limits do not account for rotation, but the
        // Pyramid PShape is -100 to +100 in all 3 dimensions.
        // You may have to adjust this to work with your PShape.
        int [] result = new int[6]; // customPShape.depth does not work.
        /*
           println("DEBUG customPShape width,height,depth: " + customPShape.width + ","
           + customPShape.height + "," + customPShape.depth);
           */
        result[0] = round(myx - 50 * myscale) ; //round(myx-myscale*customPShape.width/2.0);
        result[1] = round(myy - 76 * myscale) ; //round(myy-myscale*customPShape.height/2.0);
        result[2] = round(myz - 50 * myscale) ; //round(myz-myscale*customPShape.depth/2.0);
        result[3] = round(myx + 50 * myscale) ; //round(myx+myscale*customPShape.width/2.0);
        result[4] = round(myy + 75.5 * myscale) ; //round(myy-myscale*customPShape.width/2.0);
        result[5] = round(myz + 50 * myscale) ; // round(myz-myscale*customPShape.depth/2.0);
        return result ;
    }

    // D. Parson's makeCustomPShape vectors taken from Shape3DDemo
    /*
     *  Make and return a custom 3D PShape created using vertex() calls,
     *  for use in Avatar-derived class VectorAvatar. The textureimg
     *  parameter may be null; when it is non-null, use it to texture
     *  at least one of the planar sides of the returned PShape. If the
     *  STUDENT decides not to texture, remove the loadImage call at the
     *  top of the project2.pde, allowing textureimg to be null.
     */
    private PShape makeCustomPShape(PImage textureimg) {
        // STUDENT NOTE: Even though
        // https://processing.org/reference/vertex_.html
        // shows use of 3D coordinates combined with texture:
        // vertex(x, y, z, u, v), that did not work for my
        // 3D planar surfaces like the initial base that varies
        // the Z value. Intuitively, the limitation makes sense,
        // since texturing images are 2D, and varying the Z
        // coordinate can create a non-planar shape, even though
        // mine are all planar. I switched to vertex(x, y, u, v)
        // for the textured planar surface in the else clause below,
        // then used rotateX and translate to move it into position
        // within the GROUP PShape.
  PShape prism = createShape(GROUP);
  
  // creates bottom rectangle of box.
  PShape bottomRect = createShape(); //defines a new shape
  bottomRect.beginShape(); //begins recording vertices for a shape 
if (textureimg == null) { //if loading doesn't work. 
    bottomRect.vertex(-50, -50, -50);  //Define vertices without texture
    bottomRect.vertex(50, -50, -50);
    bottomRect.vertex(50, 50, -50);
    bottomRect.vertex(-50, 50, -50);
    bottomRect.endShape(CLOSE); // stops recording vertices for a shape.
    bottomRect.setFill(color(255, 0, 0));  // Set color if no texture
} else {
    int imgwidth = textureimg.width;  // Get texture image width
    int imgheight = textureimg.height; // Get texture image height
    bottomRect.texture(textureimg); // Apply texture
    bottomRect.vertex(-50, -50, -50, 0, imgheight);  // Define vertices with texture coordinates
    bottomRect.vertex(50, -50, -50, imgwidth, imgheight);
    bottomRect.vertex(50, 50, -50, imgwidth, 0);
    bottomRect.vertex(-50, 50, -50, 0, 0);
    bottomRect.endShape(CLOSE); // stops recording vertices for a shape.
}
//creates top of rectangle box. 
PShape topRect = createShape(); 
topRect.beginShape(); 
if (textureimg == null) {
    topRect.vertex(-50, -50, 50);  // Define vertices without texture
    topRect.vertex(50, -50, 50);
    topRect.vertex(50, 50, 50);
    topRect.vertex(-50, 50, 50);
    topRect.endShape(CLOSE);
    topRect.setFill(color(0, 255, 0));  // Set color if no texture
} else {
    int imgwidth = textureimg.width;  // Get texture image width
    int imgheight = textureimg.height; // Get texture image height
    topRect.texture(textureimg); // Apply texture
    topRect.vertex(-50, -50, 50, 0, imgheight);  // Define vertices with texture coordinates
    topRect.vertex(50, -50, 50, imgwidth, imgheight);
    topRect.vertex(50, 50, 50, imgwidth, 0);
    topRect.vertex(-50, 50, 50, 0, 0);
    topRect.endShape(CLOSE);
}
  
  // Create the side faces. goes through side 1-4 for side of box.
 PShape side1 = createShape();
side1.beginShape();
if (textureimg == null) {
    side1.vertex(-50, -50, -50);  // Define vertices without texture
    side1.vertex(50, -50, -50);
    side1.vertex(50, -50, 50);
    side1.vertex(-50, -50, 50);
    side1.endShape(CLOSE);
    side1.setFill(color(0,255,255));  // Set color if no texture
} else {
    int imgwidth = textureimg.width;  // Get texture image width
    int imgheight = textureimg.height; // Get texture image height
  side1.texture(textureimg); // Apply texture
  side1.vertex(-50, -50, -50, imgwidth, imgheight);  // Define vertices with texture coordinates
  side1.vertex(50, -50, -50, imgwidth, 0);
  side1.vertex(50, -50, 50, imgwidth, imgheight);
  side1.vertex(-50, -50, 50, 0, imgheight);
  side1.endShape(CLOSE);
}
  
  PShape side2 = createShape();
  side2.beginShape();
if (textureimg == null) {
    side2.vertex(50, -50, -50);  // Define vertices without texture
    side2.vertex(50, 50, -50);
    side2.vertex(50, 50, 50);
    side2.vertex(50, -50, 50);
    side2.endShape(CLOSE);
    side2.setFill(color(255, 0, 0));  // Set color if no texture
} else {
    int imgwidth = textureimg.width;  // Get texture image width
    int imgheight = textureimg.height; // Get texture image height
    side2.texture(textureimg); // Apply texture
    side2.vertex(50, -50, -50, imgwidth, imgheight);  // Define vertices with texture coordinates
    side2.vertex(50, 50, -50, imgwidth, 0);
    side2.vertex(50, 50, 50, 0, 0);
    side2.vertex(50, -50, 50, 0, imgheight);
    side2.endShape(CLOSE);
}
  
  PShape side3 = createShape();
side3.beginShape();
if (textureimg == null) {
    side3.vertex(50, 50, -50);  // Define vertices without texture
    side3.vertex(-50, 50, -50);
    side3.vertex(-50, 50, 50);
    side3.vertex(50, 50, 50);
    side3.endShape(CLOSE);
    side3.setFill(color(0, 0, 255));  // Set color if no texture
} else {
    int imgwidth = textureimg.width;  // Get texture image width
    int imgheight = textureimg.height; // Get texture image height
    side3.texture(textureimg); // Apply texture
    side3.vertex(50, 50, -50, imgwidth, imgheight);  // Define vertices with texture coordinates
    side3.vertex(-50, 50, -50, imgwidth, 0);
    side3.vertex(-50, 50, 50, 0, 0);
    side3.vertex(50, 50, 50, 0, imgheight);
    side3.endShape(CLOSE);
}
  
  
  PShape side4 = createShape();
side4.beginShape();
if (textureimg == null) {
    side4.vertex(-50, 50, -50);  // Define vertices without texture
    side4.vertex(-50, -50, -50);
    side4.vertex(-50, -50, 50);
    side4.vertex(-50, 50, 50);
    side4.endShape(CLOSE);
    side4.setFill(color(255, 255, 0));  // Set color if no texture
} else {
    int imgwidth = textureimg.width;  // Get texture image width
    int imgheight = textureimg.height; // Get texture image height
    side4.texture(textureimg); // Apply texture
    side4.vertex(-50, 50, -50, imgwidth, imgheight);  // Define vertices with texture coordinates
    side4.vertex(-50, -50, -50, imgwidth, 0);
    side4.vertex(-50, -50, 50, 0, 0);
    side4.vertex(-50, 50, 50, 0, imgheight);
    side4.endShape(CLOSE);
}
  
  // Create the roof triangles. 
  PShape roof1 = createShape();
  roof1.beginShape();
  roof1.vertex(-50, -50, 50);
  roof1.vertex(-50, -50, -50);
  roof1.vertex(0, -100, 50);  // Apex of the roof
  roof1.endShape(CLOSE);
  
  PShape roof2 = createShape();
  roof2.beginShape();
  roof2.vertex(50, -50, 50);
  roof2.vertex(50, -50, -50);
  roof2.vertex(0, -100, 50);  // Apex of the roof
  roof2.endShape(CLOSE);

  
  // Create the rectangles connecting the triangles on "roof". 
  PShape rect1 = createShape();
  rect1.beginShape();
  rect1.vertex(-50, -50, 50);
  rect1.vertex(-50, -50, -50);
  rect1.vertex(0, -100, 50);  
  rect1.vertex(0, -100, 50);  
  rect1.endShape(CLOSE);
  rect1.setFill(color(255,255,0)); //changes color to yellow. 
  
  PShape rect2 = createShape();
  rect2.beginShape();
  rect2.vertex(50, -50, 50);
  rect2.vertex(50, -50, -50);
  rect2.vertex(0, -100, 50);  
  rect2.vertex(0, -100, 50);  
  rect2.endShape(CLOSE);
  rect2.setFill(color(255,255,0)); //changes color to yellow. 
  
  // Add shapes to the group for pairing together.
  prism.addChild(bottomRect);
  prism.addChild(topRect);
  prism.addChild(side1);
  prism.addChild(side2);
  prism.addChild(side3);
  prism.addChild(side4);
  prism.addChild(roof1);
  prism.addChild(roof2);
  prism.addChild(rect1);
  prism.addChild(rect2);
  prism.translate(50,100,0); // trial-and-error, slide into centered position
  
  return prism;
}
}
