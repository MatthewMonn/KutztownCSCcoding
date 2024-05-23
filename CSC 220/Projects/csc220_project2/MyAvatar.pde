/**
 *  MyCloset is my Avatar-derived class that displays & moves a mobile
 *  MyAvatar. You must write your own Avatar-derived class. You can delete
 *  class MyAvatar or use it as a starting point for your re-named class.
 *  Document what your class adds or changes at the top of the class
 *  declaration like this.
 **/
 
class MyCloset extends CollisionDetector {
    /* The data fields store the state of the Avatar. */
    MyCloset(int avx, int avy, int avz, float spdx, float spdy, float spdz, float avscale) {
        super(avx,avy,avz,spdx,spdy,spdz,avscale,0,0,0);
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
        lights(); //adds default value for lights.
        //point light is directly in the middle of the seen shining in to make it brighter. External box darker.
        pointLight(255, 255, 255, 750, 500, -10); //creates a white shine light, bounces off VectorAvatar well. 
        lightFalloff(1.0, 0.0, 0.0); //creates a falloff of lights, some furniture is darker than others. 
        push(); // STUDENT *MUST* use push() & translate first in display().
        translate(myx, myy, myz);
        scale(myscale); //uses scale provided.
        strokeWeight(.5);
        fill(250,180,0); //changes color to a "yellow-orange tint".
        push(); //Makes the body of the closet.
        translate(0,20,0);
        box(30, 55, 20); 
        pop(); 
        
        push(); //makes line on the body of closet front to simulate two doors.
        translate(0, 10, 10);
        line(0, 37.5, 0, -17.5);
        pop();
        
        push(); //handle rectangle piece. 
        translate(6,15,10.5); 
        box(.5, .5, 1); 
        pop();
        
        push(); //2nd handle rectangle piece.
        translate(-6,15,10.5); 
        box(.5, .5, 1); 
        pop();
        
        push(); //handle knob. 
        translate(6,15, 11); 
        sphere(.5);
        pop();
        
        push(); //2nd handle knob
        translate(-6,15, 11); 
        sphere(.5);
        pop();
        
        push(); // footer for closet.
        translate(13,48, 8); 
        sphere(1);
        pop();
        
        push(); // 2nd footer for closet.
        translate(-13,48, 8); 
        sphere(1);
        pop();
        
        push(); // 3rd footer for closet.
        translate(13,48,-8); 
        sphere(1);
        pop();
        
        push(); // 4th footer for closet.
        translate(-13,48,-8); 
        sphere(1);
        pop();
        
        pop(); // STUDENT *MUST* use pop() last in display().
    }
    // The move() function updates the Avatar object's state.
    void move() {
        // get ready for movement in next frame.
        myx = round(myx + speedX) ;
        myy = round(myy + speedY) ;
        myz = round(myz + speedZ);
        detectCollisions();
    }
    int [] getBoundingBox() {
        int [] result = new int[6];
        result[0] = myx-round(15*myscale) ; //scaled bounding box closest to closet avatar.
        result[1] = myy - round(7.5*myscale); 
        result[2] = myz - round(10*myscale);  
        result[3] = myx + round(15* myscale); 
        result[4] = myy + round(49*myscale) ; 
        result[5] = myz + round(11.5*myscale); 
        return result ;
    }
}
