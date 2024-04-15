/** ConcentricCirclesIntervals - Updated 10/12/2021 to move initMIDI()
    call into first call to draw() to avoid timeout problem when calling it
    from setup().
    Updated 10/12/2020 to fix 2-note bugs
    (use separate ShortMessage objects for concurrent MIDI messages), and
    added some keyboard commands for Program Change & Control Change.
    Also moved the MIDI initialization code into table MIDI.
    Nesting example to get a 3D like look from 2D cicrles, D. Parson, Feb 24, 2017.
    You could stack up other shapes or PNG or SVG files.
    
    INTERACTION:
    keyPressed() function:
    Up arrow adds concentric circles
    Down reduces them.
    Right increments pN Patch N.
    Left decrements pN Patch N.
    Mouse position on screen determines offset of nested shapes,
    horizontal position for noteon pitch, vertical position for velocity.
    'pN' Patch N, where N is 0...127.
    'iN' Interval N, where N is 0...127.
    'cN' Controller (effect) N, where N is 0...127.
    'fN' Value for Controller, where N is 0...127.
    'F'  Cycle N of fN between 0, 64, and 127.
    keyPressed variable polling:
    WATCH OUT FOR THESE!!!!! MAKING A LOW VOLUME, CONTROLLER 7, can shut off the notes!!!!
    http://midi.teragonaudio.com/tech/midispec.htm
    'q' cycles pN Patch N upward.
    'r' cycles pN Patch N downward.
    'd' cycles cN Controller N upward.
    'e' cycles cN Controller N downward.
    'g' cycles fN Value for Controller N upward.
    'h' cycles fN Value for Controller N downward.
    
    Currently this appears to grow towards the viewer because smaller circles can go
    outside the edge of the original circle. If you plotted them from smallest to
    biggest, with the biggest plotted last, it might reverse this visual effect.
    
    This sketch speeds up the original ConcentricCircles by building a single
    PShape object containing the circles at the start of draw(), and then
    plotting that one object multiple times.
**/

//GRAPHICS VARIABLES
int nestCircles = 10 ;
final int limitNestCircles = 100 ;
int strokew8 = 4 ;
final int strokeLimit = 10 ;
final int numLocations = 10 ;
int frameCounter ;

void setup() {
  // GRAPHICS:
  // fullScreen(P2D); // P2D uses OpenGL renderer for speed; order of PShape geometric transforms is reversed.
  size(1920,1080,P2D);
  frameRate(10);
  ellipseMode(CENTER);
  rectMode(CENTER);
  background(255);
  stroke(0);
  noFill();
  ellipseMode(CENTER);
  rectMode(CENTER);
}

boolean MIDIready  = false ;
void draw() {
  if (! MIDIready) {
    initMIDI();
    MIDIready = true ;
  }
  background(255,0,0);
  fill(200,0,0);
  stroke(0);
  float horizontalOffset = (mouseX - width/2.0) / (width/2.0); // interval [-1.0,1.0]
  float veryticalOffset = (mouseY - height/2.0) / (height/2.0); // interval [-1.0,1.0]
  float diameter = width / (float) numLocations ; // used in fractional calculations
  int intdiameter = width / numLocations ; // used in integer increments
  // DOING THESE REPETITIVE CALCS IN THE LOOP WAS SLOWING THINGS DOWN, SO PRECOMPUTE THEM HERE.
  float horizo = horizontalOffset * diameter / (nestCircles * 2.0) ;
  float vertico = veryticalOffset * diameter / (nestCircles * 2.0);
  float floatCircles = nestCircles ;
  strokeWeight(strokew8);
  PShape bigShape = null ;
  bigShape = makeShape(diameter, floatCircles, horizo, vertico);
  for (int x = 0 ; x <= width ; x += intdiameter) {
    for (int y = 0 ; y <= height ; y += intdiameter) { // the height & width of a circle must be the same
      if (mousePressed && distance(x, y, mouseX, mouseY) <= diameter) {
        // bigShape.setFill(color(0,0,200));
        int r = 0, g = 128, b = 255 ;
        for (int c = 0 ; c < nestCircles ; c++) {
          try {
            //println("ABOUT TO GET");
            PShape littleShape = bigShape.getChild(c);
            littleShape.setFill(color(r,g,b));
            //println("COLORED");
            r = (r + x * 31) % 256 ;
            g = (g + y * 71 + r) % 256 ;
            b = (b + x * 103 + r + g) % 256 ;
          } catch (Exception xxx) {
            System.err.println("getChild ERROR: " + xxx.getClass().getName() + ": " + xxx.getMessage());
          }
        }
      } else {
        bigShape.setFill(color(200,0,0));
      }
      pushMatrix();  // nest circles at this location, pop for the next location
      translate(x,y);
      //println("ABOUT TO SHAPE");
      shape(bigShape);
      //println("SHAPED");
      popMatrix();
    }
  }
  
  sendMIDI(); // every 10th of a second is a lot!
  textMode(SHAPE);
  textAlign(LEFT);
  int points = 48 ;
  textSize(points);
  fill(255);
  text("Patch " + patch + ", interval " + interval + ", controller " + controller
    + ", controllerDegree " + controllerDegree, points, height - 2 * points);
  // WATCH OUT FOR pollKeys()!!!!! MAKING A LOW VOLUME, CONTROLLER 7, can shut off the notes!!!!
  // http://midi.teragonaudio.com/tech/midispec.htm
  pollKeys();
}

// See http://midi.teragonaudio.com/tech/midispec.htm
// and https://www.midi.org/specifications/item/gm-level-1-sound-set
// See Parson's code at http://faculty.kutztown.edu/parson/spring2017/MidiKBSpring2016Parson.txt
void sendMIDI() {
  if (! mousePressed) {
    if (lastnote != -1 && lastvelocity != -1) {
      sendMIDI(ShortMessage.NOTE_OFF, 0, lastnote, 0);
      sendMIDI(ShortMessage.NOTE_OFF, 1, (lastnote+interval)%128, 0);
      lastnote = lastvelocity = -1 ;
    }
    return ;
  }
  int note = constrain(127 * mouseX / width, 0, 127);
  int volume = constrain(127 - 127 * mouseY / height, 0, 127);
  if (lastnote != note || lastvelocity != volume) {
    if (lastnote != -1 && lastvelocity != -1) {
      sendMIDI(ShortMessage.NOTE_OFF, 0, lastnote, 0);
      sendMIDI(ShortMessage.NOTE_OFF, 1, (lastnote+interval)%128, 0);
    }
  }
  lastnote = note ;
  lastvelocity = volume ;
  sendMIDI(ShortMessage.NOTE_ON, 0, note, volume);
  sendMIDI(ShortMessage.NOTE_ON, 1, (note+interval) % 128, volume);
}

PShape makeShape(float diameter, float floatCircles, float horizo, float vertico) {
  boolean iscirc = ((patch & 1) == 1) ;
  PShape bigShape = createShape(GROUP);
  for (int c = 0 ; c < nestCircles ; c++) {
    PShape littleShape = null ;
    if (iscirc) {
      littleShape = createShape(ELLIPSE, 0,0,diameter,diameter);
    } else {
      littleShape = createShape(RECT, 0,0,diameter,diameter);
    }
    sendMIDI(ShortMessage.CONTROL_CHANGE, 0, controller, controllerDegree);
    sendMIDI(ShortMessage.CONTROL_CHANGE, 1, controller, controllerDegree);
    // littleShape.translate((c+1) * horizo, (c+1) * vertico); // Put here for non-P2D non-P3D
    littleShape.scale((nestCircles - c) / floatCircles); // next nested one is smaller by 1/nth
    littleShape.translate((c+1) * horizo, (c+1) * vertico); // Put here for P2D p#d opengl renderers
    // See https://github.com/processing/processing/issues/2783
    try {
      //println("ABOUT TO ADD");
      bigShape.addChild(littleShape/*,c*/);
      //println("ADDED");
    } catch (Exception xxx) {
      System.err.println("addChild ERROR: " + xxx.getClass().getName() + ": " + xxx.getMessage());
    }
  }
  return bigShape ;
}
 
// WATCH OUT FOR pollKeys()!!!!! MAKING A LOW VOLUME, CONTROLLER 7, can shut off the notes!!!!
// http://midi.teragonaudio.com/tech/midispec.htm
void pollKeys() {
  /*
  INTERACTION:
    keyPressed variable polling:
    'q' cycles pN Patch N upward.
    'r' cycles pN Patch N downward.
    'd' cycles cN Controller N upward.
    'e' cycles cN Controller N downward.
    'g' cycles fN Value for Controller N upward.
    'h' cycles fN Value for Controller N downward.
  */
  if (keyPressed) {
    // system variable that continuously polls keyboard
    switch(key) {
      // switch is an alernative to "if" for integer and char data type comparisons
      case 'q' :
      case 'r' :
        patch = ((key == 'q') ? (patch+1) : (patch-1+128)) % 128 ; // wrap back around 127 to 0
        if (lastnote != -1 && lastvelocity != -1) {
          sendMIDI(ShortMessage.NOTE_OFF, 0, lastnote, 0);
          sendMIDI(ShortMessage.NOTE_OFF, 1, (lastnote+interval)%128, 0);
          lastnote = lastvelocity = -1 ;
        }
        sendMIDI(ShortMessage.PROGRAM_CHANGE, 0, patch, 0); 
        sendMIDI(ShortMessage.PROGRAM_CHANGE, 1, patch, 0);
        break ;  // break jumps out of the switch statement
      case 'd' :
      case 'e' :
        controller = ((key == 'd') ? (controller+1) : (controller-1+128)) % 128 ; // wrap 127 to 0
        if (lastnote != -1 && lastvelocity != -1) {
          sendMIDI(ShortMessage.NOTE_OFF, 0, lastnote, 0);
          sendMIDI(ShortMessage.NOTE_OFF, 1, (lastnote+interval)%128, 0);
          lastnote = lastvelocity = -1 ;
        }
        sendMIDI(ShortMessage.CONTROL_CHANGE, 0, controller, controllerDegree);
        sendMIDI(ShortMessage.CONTROL_CHANGE, 1, controller, controllerDegree);
        break ;  // break jumps out of the switch statement
      case 'g' :
      case 'h' :
        controllerDegree = ((key == 'g') ? (controllerDegree+1) : (controllerDegree-1+128)) % 128 ; // wrap
        if (lastnote != -1 && lastvelocity != -1) {
          sendMIDI(ShortMessage.NOTE_OFF, 0, lastnote, 0);
          sendMIDI(ShortMessage.NOTE_OFF, 1, (lastnote+interval)%128, 0);
          lastnote = lastvelocity = -1 ;
        }
        sendMIDI(ShortMessage.CONTROL_CHANGE, 0, controller, controllerDegree);
        sendMIDI(ShortMessage.CONTROL_CHANGE, 1, controller, controllerDegree);
        break ;  // break jumps out of the switch statement
    }
  }
}

String command = "" ;  // empty command string, build it up.
void keyPressed() {
  /*
  INTERACTION:
    keyPressed() function:
    Up arrow adds concentric circles
    Down reduces them.
    Right increments pN Patch N.
    Left decrements pN Patch N.
    Mouse position on screen determines offset of nested shapes,
    horizontal position for noteon pitch, vertical position for velocity.
    'pN' Patch N, where N is 0...127.
    'iN' Interval N, where N is 0...127.
    'cN' Controller (effect) N, where N is 0...127.
    'fN' Value for Controller, where N is 0...127.
    'F'  Cycle N of fN between 0, 64, and 127.
  */
  if (key == CODED) {
    if (keyCode == UP) {
      if (nestCircles < limitNestCircles) {
        nestCircles++;
        // interval = (interval + 1) % 24 ;
      }
    } else if (keyCode == DOWN) {
      if (nestCircles > 1) {
        nestCircles--;
        // interval = (interval - 1 + 24) % 24 ;
      }
    } else if (keyCode == LEFT) {
      patch = (patch-1+128) % 128 ;
      if (lastnote != -1 && lastvelocity != -1) {
        sendMIDI(ShortMessage.NOTE_OFF, 0, lastnote, 0);
        sendMIDI(ShortMessage.NOTE_OFF, 1, (lastnote+interval)%128, 0);
        lastnote = lastvelocity = -1 ;
      }
      sendMIDI(ShortMessage.PROGRAM_CHANGE, 0, patch, 0); 
      sendMIDI(ShortMessage.PROGRAM_CHANGE, 1, patch, 0); 
    } else if (keyCode == RIGHT) {
      patch = (patch+1) % 128 ;
      if (lastnote != -1 && lastvelocity != -1) {
        sendMIDI(ShortMessage.NOTE_OFF, 0, lastnote, 0);
        sendMIDI(ShortMessage.NOTE_OFF, 1, (lastnote+interval)%128, 0);
        lastnote = lastvelocity = -1 ;
      }
      sendMIDI(ShortMessage.PROGRAM_CHANGE, 0, patch, 0);
      sendMIDI(ShortMessage.PROGRAM_CHANGE, 1, patch, 0);
    }
  } else {
    // Not a CODED key
    if (key == 'F') {
      if (controllerDegree < 64) {
        controllerDegree = 64 ;
      } else if (controllerDegree >= 64 && controllerDegree < 127) {
        controllerDegree = 127 ;
      } else {
        controllerDegree = 0 ;
      }
      sendMIDI(ShortMessage.CONTROL_CHANGE, 0, controller, controllerDegree);
      sendMIDI(ShortMessage.CONTROL_CHANGE, 1, controller, controllerDegree);
      command = "" ;  // clear the command buffer
    } else if (key == 'p' || key == 'i' || key == 'c' || key == 'f') {
      command = "" + key ;  // start new command message
    } else if ((key >= '0' && key <= '9') && command.length() > 0) {
      // Tack on another digit to N
      command = command + key ;
    } else if (key == '\n' && command.length() > 1) {
      try {
        int number = java.lang.Integer.parseInt(command.substring(1));
        number = constrain(number, 0, 127);  // keep it in valid MIDI range
        char c = command.charAt(0);
        command = "" ;  // reset
        if (c == 'p') {
          patch = number ;
          sendMIDI(ShortMessage.PROGRAM_CHANGE, 0, patch, 0); 
          sendMIDI(ShortMessage.PROGRAM_CHANGE, 1, patch, 0);
        } else if (c == 'i') {
          if (lastnote > -1 && lastvelocity > -1) {
            sendMIDI(ShortMessage.NOTE_OFF, 1, (lastnote+interval)%128, 0);
          }
          interval = number ;
          if (lastnote > -1 && lastvelocity > -1) {
            sendMIDI(ShortMessage.NOTE_ON, 1, (lastnote+interval)%128, lastvelocity);
          }
        } else if (c == 'c' || c == 'f') {
          if (controller > -1) {
            sendMIDI(ShortMessage.CONTROL_CHANGE, 0, controller, 0); // turn it off
            sendMIDI(ShortMessage.CONTROL_CHANGE, 1, controller, 0);
          }
          if (c == 'c') {
            controller = number ;
          } else {
            controllerDegree = number ;
          }
          sendMIDI(ShortMessage.CONTROL_CHANGE, 0, controller, controllerDegree);
          sendMIDI(ShortMessage.CONTROL_CHANGE, 1, controller, controllerDegree);
        } else {
          command = "" ;  // reset it
        }
      } catch (NumberFormatException nx) {
        println("ERROR, NumberFormatException: " + nx.getMessage());
        command = "" ;  // reset
      }
    }
  }
}

float distance(int x1, int y1, int x2, int y2) {
  float d = sqrt(sq(x1-x2) + sq(y1-y2));
  return d ;
}
