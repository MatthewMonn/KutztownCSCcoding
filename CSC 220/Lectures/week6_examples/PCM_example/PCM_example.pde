/** SoundToWave3D
 INSTRUCTIONS FOR KEYBOARD CONTROLS (NO GUI YET):
  println("Use a|h|v|c|l|f|p|C|s|S|m|z|r|R|/, LEFT&RIGHT for thickness, UP&DOWN for magnitude.");

h means change amplification magnifier on time domain horizontal line, so weak signals spread out
v means change amplification magnifier on time domain vertical line, so weak signals spread out
c means change amplification magnifier on time domain circular plot, so weak signals spread out
l means change amplification magnifier on time domain Lissajous plt, so weak signals spread out
a means change amplification magnifier on all of the above time domain plots, so weak signals spread out
f means change amplification magnifier on frequency domain lines around the edges; increases tend to fill the space
ALL of the above use left-right arrows to change line thickness, up-down arrows for amplification

p means change phase difference on Lissajous, to vary thru (lines .. circles) continuum
C means advance the color scheme one increment (indexed color scheme) for all plot shapes; use arrows to advance
s means toggle between non-smear, smear, and erase sear mode
S toggles between smear & erase smear
m toggles between color and monochrome mode
z toggle between not-blanking & blanking 0-strength samples; zero them by taking down arrow all the way down
r uses left-right arrows to change rotation amount, up and down to change auto-rotation rate on horizaontal time domain
R uses left-right arrows to change rotation amount, up and down to change auto-rotation rate on vertical time domain
/ uses left-right arrows to change rotation amount, up and down to change auto-rotation rate on Lissajous patterns
**/

//import net.beadsproject.beads.core.*;
//import net.beadsproject.beads.core.io.*;
//import net.beadsproject.beads.ugens.*;
//import net.beadsproject.beads.data.*;
//import net.beadsproject.beads.analysis.segmenters.*;
//import net.beadsproject.beads.events.*;
//import net.beadsproject.beads.analysis.*;
//import net.beadsproject.beads.data.audiofile.*;
//import net.beadsproject.beads.data.buffers.*;
//import net.beadsproject.beads.analysis.featureextractors.*;
import beads.* ;


// import beads.*;
import java.util.* ;

//
//

// SoundToWave3D updated May/June 2015 in Processing 2.x for
// June 2015 Kutztown University Computer Music & Visualization Conference.
// Above INSTRUCTIONS ADDED THEN. D. Parson.
//
// SoundToWaveforms is a prototype demo program that translates audio
// samples from an incoming microphone or WAV file into colored pixels
// on the display window. It is a starting point for a CSC354WI audio
// visualization project in Spring 2013. It uses yellow and green lines to
// plot the time-domain signal (yellow is a horizontal wave form and green
// is vertical; they plot the same waveform). It uses green and cyan to plot
// stereo left versus right in the center of the screen; again, green & cyan
// are the same signals plotted in different direction; also, it phase shifts
// the right channel by phaseShift samples (variable lineWidth[PHASE] below) to avoid always
// plotting a diagonal line. It uses red to plot four mirror images of the
// frequency domain data. We will discuss improvements to this program in
// team discussions.
// NOTE: Set variable *useMic* to true to use the microphone / audio input;
// set it to false to use the WAV file named in variable sourceFile.
// D. Parson, 1/28/2013

// Feb. 17, 2013 added some helper functions to reduce the amount of grunt work
// and increase the amount of interesting work for the CSC354WI visualization
// effort.

boolean useMic = false ; // set to true for mic, false for audio file
String sourceFile = "polarized_shuffle.mp3"; // use only if useMic is false
// String sourceFile = "DParsonNYE201213TheCheeseStandsAlone.wav"; // use only if useMic is false

// import beads.*; // import the beads library

AudioContext ac; // declare the parent AudioContext
PowerSpectrum ps = null ;
int [] clippingMask = null ; // index-length pairs for Arrays.fill to pixels[]
final int framerater = 30 ;
final int maxLineWidth = 51 ;
final int HORIZONTAL = 0 ;
final int VERTICAL = 1 ;
final int CIRCULAR = 2 ;
final int LISSAJOUS = 3 ;
final int FREQUENCY = 4 ;
final int PHASE = 5 ;
final int ROTHAMT = 6 ;
final int ROTHRATE = 7 ;
final int ROTVAMT = 8 ;
final int ROTVRATE = 9 ;
final int ROTL1AMT = 10 ;
final int ROTL1RATE = 11 ;
final color REVSMEAR = color(0); // smearing black over existing paint
final color WHITEM = color(255,255,255); // white for monochrome mode
// KEYSTROKE-ADJUSTED PARAMETERS DURING DISPLAY TIME:
int [] lineWidth = {3, 3, 3, 3, 3, 10, 0, 0, 0, 0,0,0};// FREQUENCY ignored, PHASE is phase shift between channels
float [] lineScale = {1.0, 1.0, 1.0, 1.0, 50.0, 10.0, 0,0, 0,0, 0,0/*, 0.0,0.0,0.0*/}; // PHASE IS lineWidth[PHASE]
final float [] increments = {1.0, 1.0, 1.0, 1.0, 10.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0};
final float [] limits = {20.0, 20.0, 20.0, 20.0, 100.0, 100.0, 359.0, 30.0, 359.0, 30.0, 359.0, 30.0};
String [] paramName = { "HORIZONTAL", "VERTICAL", "CIRCULAR", "LISSAJOUS",
  "FREQUENCY", "PHASE", "ROTHAMT", "ROTHRATE", "ROTVAMT", "ROTVRATE",
  "ROTL1AMT", "ROTL1RATE" };
color [] theColor = new color [ PHASE+1+6 ] ; // populate in setup, leave some black
int colorOffset = 0 ;
int smearMode = 0 ; // 0 off, 1 on, 2 reverse color
boolean isMonochrome = false ; // true plots all white
boolean isZeroOff = false ;
int rotateHAmount = 0 ; // -359..359 in 1 degree steps
int rotateHDelta = 0 ; // -1 or 1 when auto-rotate
int rotateHRate = 0 ; // delay this many frames before rotating rotateHAmount, 0 is no speed
int rotateHToGo = 0 ; // counter for rotateHRate
int rotateVAmount = 0 ; // -359..359 in 1 degree steps
int rotateVDelta = 0 ; // -1 or 1 when auto-rotate
int rotateVRate = 0 ; // delay this many frames before rotating rotateVAmount, 0 is no speed
int rotateVToGo = 0 ; // counter for rotateVRate
int rotateL1Amount = 0 ; // -359..359 in 1 degree steps
int rotateL1Delta = 0 ; // -1 or 1 when auto-rotate
int rotateL1Rate = 0 ; // delay this many frames before rotating rotateL1Amount, 0 is no speed
int rotateL1ToGo = 0 ; // counter for rotateL1Rate
final String [] smearName = {"off", "on", "rev" };
int paramIX = 0 ;


/*
boolean sketchFullScreen() {
  return true;
  // Also from Preferences "Run sketches on display 2" for dome.
}
*/

void setup() {
    //size(750,750,P2D);
    fullScreen(P2D);
    background(0);
    createClippingMask();
    frameRate(framerater);
    // int mycolor = color(0,0,0,255);
    // println("COLOR BLACK WITH ALPHA 255 = " + Integer.toHexString(mycolor));
    
    theColor[HORIZONTAL] = color(255,255,0); // yellow
    theColor[VERTICAL] = color(0,255,0); // green
    theColor[CIRCULAR] = color(255,255,255); // white
    theColor[LISSAJOUS] = color(0,255,255); // cyan
    theColor[FREQUENCY] = color(255,0,0); // red
    theColor[PHASE] = color(255,0,255); // MAGENTA
    
    ac = new AudioContext(); // initialize the AudioContext
    Gain g = null ;
    
    // get an AudioInput UGen from the AudioContext
    // this will setup an input from whatever input is your default audio input (usually the microphone in)
    // changing audio inputs in beads is a little bit janky (as of this writing)
    // so it's best to change your default input temporarily, if you want to use a different input
    if (useMic) {
      UGen microphoneIn = ac.getAudioInput();
  
      // set up our usual master gain object
       g = new Gain(ac, 1, 0.5);
       g.addInput(microphoneIn);
    } else {
      SamplePlayer player = null;
        try {
      // load the audio file which will be used in granulation - notice the use of the sketchPath function
          player = new SamplePlayer(ac, new Sample(sketchPath("") + sourceFile));
        } catch(Exception e) {
          println("Exception while attempting to load sample!");
          e.printStackTrace();
          exit();
        }
        g = new Gain(ac, 2, 0.3);
        g.addInput(player);
    }
    ac.out.addInput(g);
    // In this block of code, we build an analysis chain
    // the ShortFrameSegmenter breaks the audio into short,
    // discrete chunks.
    ShortFrameSegmenter sfs = new ShortFrameSegmenter(ac);
    sfs.addInput(ac.out);
    FFT fft = new FFT();
    // connect the FFT object to the ShortFrameSegmenter
    sfs.addListener(fft);
    // PowerSpectrum pulls the Amplitude information from
    // the FFT calculation
    ps = new PowerSpectrum();
    // connect the PowerSpectrum to the FFT
    fft.addListener(ps);
    // list the frame segmenter as a dependent, so that the
    // AudioContext knows when to update it.
    ac.out.addDependent(sfs);
    // start processing audio 
    ac.start(); // begin working with audio
    println("SETUP DEBUG WIDTH = " + width + ", HEIGHT = " + height);
    println("Use a|h|v|c|l|f|p|C|s|S|m|z|r|R|/, LEFT&RIGHT for thickness, UP&DOWN for magnitude.");
}

// draw the input waveform on screen
// this code is based on code from the Beads tutorials
void draw()
{
    loadPixels();
    //set the background
    color hider = color(0);
    if (smearMode == 0) {
      Arrays.fill(pixels, hider); // start out all black
    }
    
    if (rotateHRate != 0 && rotateHDelta != 0) {
      rotateHToGo-- ;
      if (rotateHToGo <= 0) {
        rotateHToGo = rotateHRate ;
        rotateHAmount += rotateHDelta ;
        if (rotateHAmount == 0) {
          rotateHAmount = rotateHDelta ;
        } else if (rotateHAmount <= -360) {
          rotateHAmount += 360 ;
        } else if (rotateHAmount >= 360) {
          rotateHAmount -= 360 ;
        }
      }
      //println("DEBUG rotateHAmount update = " + rotateHAmount);
    }
    if (rotateVRate != 0 && rotateVDelta != 0) {
      rotateVToGo-- ;
      if (rotateVToGo <= 0) {
        rotateVToGo = rotateVRate ;
        rotateVAmount += rotateVDelta ;
        if (rotateVAmount == 0) {
          rotateVAmount = rotateVDelta ;
        } else if (rotateVAmount <= -360) {
          rotateVAmount += 360 ;
        } else if (rotateVAmount >= 360) {
          rotateVAmount -= 360 ;
        }
      }
      //println("DEBUG rotateVAmount update = " + rotateVAmount);
    }
    if (rotateL1Rate != 0 && rotateL1Delta != 0) {
      rotateL1ToGo-- ;
      if (rotateL1ToGo <= 0) {
        rotateL1ToGo = rotateL1Rate ;
        rotateL1Amount += rotateL1Delta ;
        if (rotateL1Amount == 0) {
          rotateL1Amount = rotateL1Delta ;
        } else if (rotateL1Amount <= -360) {
          rotateL1Amount += 360 ;
        } else if (rotateL1Amount >= 360) {
          rotateL1Amount -= 360 ;
        }
      }
      //println("DEBUG rotateL1Amount update = " + rotateHAmount);
    }
   
    // FFT - I put this first even though it's the most complicated, so that
    // the other 2 (time domain and Lissajous) will draw on top of it.
    plotFrequencyDomain(ac, pixels);
    plotTimeDomain(ac, pixels);
    plotTimeDomainPolar(ac, pixels);
    // Add Lissajous over top of time domain plot. Ideally we should blend
    // the colors when the plot intersect, but for now we just over-write
    // in a different color. Parson
    plotLissajous(ac, pixels);
    for (int i = 0 ; i < clippingMask.length ; i += 2) {
      //println("DEBUG i " + i + ": " + clippingMask[i] + "," + clippingMask[i+1]);
      Arrays.fill(pixels, clippingMask[i], clippingMask[i+1], hider);
    }
    updatePixels(); // paint the new pixel array to the screen
  
}

int keywhen = 0 ;
void keyPressed() {

   if (key == CODED) {
    if (keyCode == UP) {
      if (paramIX == ROTHAMT) {
        // UP means adjust the rate
        rotateHRate = (rotateHRate + 1) % 30 ;
        rotateHToGo = rotateHRate ;
        // rotateHDelta = (rotateHAmount == 0) ? 0 : -1 ;
      } else if (paramIX == ROTVAMT) {
        rotateVRate = (rotateVRate + 1) % 30 ;
        rotateVToGo = rotateVRate ;
        // rotateVDelta = (rotateHAmount == 0) ? 0 : -1 ;
      } else if (paramIX == ROTL1AMT) {
        // UP means adjust the rate
        rotateL1Rate = (rotateL1Rate + 1) % 30 ;
        rotateL1ToGo = rotateL1Rate ;
        // rotateHDelta = (rotateHAmount == 0) ? 0 : -1 ;
      } else if (paramIX == PHASE) {
        if ((lineWidth[paramIX] + increments[paramIX]) <= limits[paramIX]) {
            lineWidth[paramIX] = (int)(lineWidth[paramIX] + increments[paramIX]);
        }
      } else if (paramIX > -1 && paramIX < paramName.length) {
        if ((lineScale[paramIX] + increments[paramIX]) <= limits[paramIX]) {
            lineScale[paramIX] = lineScale[paramIX] + increments[paramIX];
        }
        println(paramName[paramIX] + " = " + lineWidth[paramIX] + "," + lineScale[paramIX]);
      } else if (paramIX == -1) {
        for (int j = 0 ; j < paramName.length ; j++) {
          if ((lineScale[j] + increments[j]) <= limits[j]) {
            lineScale[j] = lineScale[j] + increments[j];
          }
          println(paramName[j] + " = " + lineWidth[j] + "," + lineScale[j]);
        }
      } else if (paramIX == -2) {  
        colorOffset = (colorOffset+1+theColor.length) % theColor.length ;
      }
    } else if (keyCode == DOWN) {
      if (paramIX == ROTHAMT) {
        // UP means adjust the rate
        rotateHRate = (rotateHRate + 29) % 30 ;
        rotateHToGo = rotateHRate ;
        // rotateHDelta = (rotateHAmount == 0) ? 0 : -1 ;
      } else if (paramIX == ROTVAMT) {
        rotateVRate = (rotateVRate + 29) % 30 ;
        rotateVToGo = rotateVRate ;
        // rotateVDelta = (rotateVAmount == 0) ? 0 : -1 ;
      } else if (paramIX == ROTL1AMT) {
        // UP means adjust the rate
        rotateL1Rate = (rotateL1Rate + 29) % 30 ;
        rotateL1ToGo = rotateL1Rate ;
        // rotateHDelta = (rotateHAmount == 0) ? 0 : -1 ;
      } else if (paramIX == PHASE) {
        if ((lineWidth[paramIX] - increments[paramIX]) >= 0) {
            lineWidth[paramIX] = (int)(lineWidth[paramIX] - increments[paramIX]);
        }
      } else if (paramIX > -1 && paramIX < paramName.length) {
        if ((lineScale[paramIX] - increments[paramIX]) >= 0) {
            lineScale[paramIX] = lineScale[paramIX] - increments[paramIX];
        }
        println(paramName[paramIX] + " = " + lineWidth[paramIX] + "," + lineScale[paramIX]);
      } else if (paramIX == -1) {
        for (int j = 0 ; j < paramName.length ; j++) {
          if ((lineScale[j] - increments[j]) >= 0) {
            lineScale[j] = lineScale[j] - increments[j];
          }
          println(paramName[j] + " = " + lineWidth[j] + "," + lineScale[j]);
        }
      } else if (paramIX == -2) {  
        colorOffset = (colorOffset-1+theColor.length) % theColor.length ;
      }
    } else if (keyCode == LEFT) {
      if (paramIX == ROTHAMT) {
        // UP means adjust the rate
        rotateHAmount = (rotateHAmount + 359) % 360 ;
        rotateHDelta =  -1 ;
      } else if (paramIX == ROTVAMT) {
        rotateVAmount = (rotateVAmount + 359) % 360 ;
        rotateVDelta = -1 ;
      } else if (paramIX == ROTL1AMT) {
        // UP means adjust the rate
        rotateL1Amount = (rotateL1Amount + 359) % 360 ;
        rotateL1Delta =  -1 ;
      } else if (paramIX == PHASE) {
        if ((lineWidth[paramIX] - increments[paramIX]) >= 0) {
            lineWidth[paramIX] = (int)(lineWidth[paramIX] - increments[paramIX]);
        }
      } else if (paramIX > -1 && paramIX < paramName.length) {
        if ((lineWidth[paramIX] - 1) >= 0) {
            lineWidth[paramIX] = lineWidth[paramIX] - 1;
        }
        println(paramName[paramIX] + " = " + lineWidth[paramIX] + "," + lineScale[paramIX]);
      } else if (paramIX == -1) {
        for (int j = 0 ; j < paramName.length ; j++) {
          if ((lineWidth[j] - 1) >= 0) {
            lineWidth[j] = lineWidth[j] - 1;
          }
          println(paramName[j] + " = " + lineWidth[j] + "," + lineScale[j]);
        }
    } else if (paramIX == -2) {  
      colorOffset = (colorOffset-1+theColor.length) % theColor.length ;
    }
    } else if (keyCode == RIGHT) {
      if (paramIX == ROTHAMT) {
        // UP means adjust the rate
        rotateHAmount = (rotateHAmount + 1) % 360 ;
        rotateHDelta =  1 ;
      } else if (paramIX == ROTVAMT) {
        rotateVAmount = (rotateVAmount + 1) % 360 ;
        rotateVDelta = 1 ;
      } else if (paramIX == ROTL1AMT) {
        // UP means adjust the rate
        rotateL1Amount = (rotateL1Amount + 1) % 360 ;
        rotateL1Delta =  1 ;
      } else if (paramIX == PHASE) {
        if ((lineWidth[paramIX] + increments[paramIX]) <= limits[paramIX]) {
            lineWidth[paramIX] = (int)(lineWidth[paramIX] + increments[paramIX]);
        }
      } else if (paramIX > -1 && paramIX < paramName.length) {
        if ((lineWidth[paramIX] + 1) < maxLineWidth) {
            lineWidth[paramIX] = lineWidth[paramIX] + 1;
        }
        println(paramName[paramIX] + " = " + lineWidth[paramIX] + "," + lineScale[paramIX]);
      } else if (paramIX == -1) {
        for (int j = 0 ; j < paramName.length ; j++) {
          if ((lineWidth[j] + 1) < maxLineWidth) {
            lineWidth[j] = lineWidth[j] + 1;
          }
          println(paramName[j] + " = " + lineWidth[j] + "," + lineScale[j]);
        } 
      } else if (paramIX == -2) {  
          colorOffset = (colorOffset+1+theColor.length) % theColor.length ;
        }
    } else {
      println("Use LEFT&RIGHT for thickness, UP&DOWN for magnitude.");
      return ;
    }
   } else if (key == 'a') {
     println("a is for ALL");
     paramIX = -1 ;
   } else if (key == 'h') {
     println("h is for HORIZONTAL");
     paramIX = 0;
   } else if (key == 'v') {
     println("v is for VERTICAL");
     paramIX = 1;
   } else if (key == 'c') {
     println("c is for CIRCULAR");
     paramIX = 2 ;
   } else if (key == 'l') {
     println("l is for LISSAJOUS");
     paramIX = 3 ;
   } else if (key == 'f') {
     println("f is for FREQUENCY");
     paramIX = 4 ;
   } else if (key == 'p') {
     println("p is for PHASE");
     paramIX = 5 ;
    } else if (key == 'C') {
     println("C is for CHANGE COLOR");
     paramIX = -2 ;
    } else if (key == 's') {
      smearMode = (smearMode + 1) % smearName.length ;
      println("Setting smear mode to " + smearName[smearMode]);
    } else if (key == 'm') {
      isMonochrome = ! isMonochrome ;
    } else if (key == 'z') {
      isZeroOff = ! isZeroOff ;
    } else if (key == 'S') {
      if (smearMode == 0 || smearMode == 2) {
        smearMode = 1 ;
      } else {
        smearMode = 2 ;
      }
    } else if (key == 'r') {
      paramIX = ROTHAMT ;
      println("r is for rotate horizontal line");
    } else if (key == 'R') {
      paramIX = ROTVAMT ;
      println("R is for rotate vertical line");
    } else if (key == '/') {
      paramIX = ROTL1AMT ;
      println("/ is for rotate / Lissajous line");
    }
   
   for (int i = 0 ; i < ROTHAMT /* paramName.length */ ; i++) {
     print(paramName[i] + " = " + lineWidth[i] + "," + lineScale[i] + "   ");
   }
   println();
   print("ROTHAMT = " + rotateHAmount + ", ROTHRATE = " + rotateHRate + ", ROTHDDT = " + rotateHDelta);
   print(", ROTVAMT = " + rotateVAmount +", ROTVRATE = " + rotateVRate + ", ROTVDT = " + rotateVDelta);
   println("ROTL1AMT = " + rotateL1Amount + ", ROTL1RATE = " + rotateL1Rate + ", ROTL1DDT = " + rotateL1Delta);
   println("r coloroffset = " + colorOffset + ", smear mode = " + smearName[smearMode] + ", monoc = " + isMonochrome + ", zoff = " + isZeroOff);
   println("Use a|h|v|c|l|f|p|C|s|S|m|z|r|R|/, LEFT&RIGHT for thickness, UP&DOWN for magnitude.");
 
}

/**
 *  cartesianToPhysical maps a location in the Cartesian coordinate
 *  space -1.0, -1.0 through 1.0, 1.0 to the physical space
 *  0, 0 through width-1, height-1. If either input coordinate
 *  lies outside of the -1.0..1.0 range, cartesianToPhysical returns
 *  a pair of coordinates -1, -1 that signify clipping; the calling
 *  code must test for this return value and not attempt to plot it.
**/
double sumx = 0.0 ;
double sumy = 0.0 ;
double countsum = 0.0 ;
double minx = 0.0, maxx = 0.0 ;
int [] cartesianToPhysical(float cartesianX, float cartesianY) {
  int [] result = new int[2];
  int mywidth = width ;  // locate centered rectangle for clipping
  int myheight = height ;
  int xoffset = 0, yoffset = 0 ;
  if (cartesianX < -1.0 || cartesianX > 1.0 || cartesianY < -1.0
      || cartesianY > 1.0) {
    result[0] = result[1] = -1 ;
    return result ;
  }
  // Update summer 2015 cartesian is in the centered square in a rectangular display.
  if (mywidth > myheight) {
      // normally this is the case
    xoffset = (mywidth - myheight) / 2 ;
    mywidth = myheight ;
  } else {
    yoffset = (myheight - mywidth) / 2 ;
    myheight = mywidth ;
  }
  result[0] = (int)(Math.round(((cartesianX + 1.0) / 2.0) * mywidth + xoffset));
  if (result[0] == (mywidth + xoffset)) {
    result[0] -= 1 ;
  }
  result[1] = myheight - (int)(Math.round(((cartesianY + 1.0) / 2.0) * myheight + yoffset));
  // Physical requires Y == 0 to be at the top.
  if (result[1] == myheight + yoffset) {
    result[1] -= 1 ;
  }
  //sumx = sumx + result[0]; sumy = sumy + result[1] ; countsum = countsum + 1.0 ;println("DEBUG cartesianToPhysical 1, " + width + "," +height + "     " + minx + "," + maxx + "     " + result[0] + "," + result[1]);
  return result ;
}

/**
 *  physicalToCartesian maps a location in the physical display coordinate
 *  space 0, 0 through width-1, height-1 to the Cartesian space
 *  -1.0, -1.0 through 1.0, 1.0. If either input coordinate
 *  lies outside of the 0, 0 through width-1, height-1 range, cartesianToPhysical returns
 *  a pair of coordinates -2.0, -2.0 that signify clipping; the calling
 *  code must test for this return value and not attempt to plot it.
**/
float [] physicalToCartesian(int physX, int physY) {
  // Update summer 2015 cartesian is in the centered square in a rectangular display.
  float [] result = new float[2];
  int mywidth = width ;  // locate centered rectangle for clipping
  int myheight = height ;
  int xoffset = 0, yoffset = 0 ;
  if (mywidth > myheight) {
      // normally this is the case
    xoffset = (mywidth - myheight) / 2 ;
    mywidth = myheight ;
  } else {
    yoffset = (myheight - mywidth) / 2 ;
    myheight = mywidth ;
  }
  physX -= xoffset ; // summer 2015
  physY -= yoffset ; // summer 2015
  if (physX == mywidth) {
    physX = mywidth - 1 ;  // same as cartesian 1.0
  }
  if (physY == myheight) {
    physY = myheight - 1 ;  // same as cartesian 1.0
  }
  if (physX < 0 || physX >= mywidth || physY < 0
      || physY >= myheight) {
    result[0] = result[1] = -2.0 ;
    return result ;
  }
  result[0] = ((float)(physX) / (float) mywidth * 2.0) - 1.0 ;
  result[1] = ((float)(physY) / (float) myheight * 2.0) - 1.0 ;
  return result ;
}

/**
 *  cartesianToPolar maps a location in the Cartesian coordinate
 *  space -1.0, -1.0 through 1.0, 1.0 to the unit circle centered
 *  at 0,0 with a radius of 1.0. The return value stores the
 *  polar radius in [0] and the angle in radians in [1].
 *  If either input coordinate
 *  lies outside of the -1.0..1.0 range, cartesianToPolar returns
 *  the corresponding results, and the calling code must check to
 *  determine whether the returned radius exceeds 1.0, requiring
 *  clipping.
**/
float [] cartesianToPolar(float cartesianX, float cartesianY) {
  float [] result = new float[2];
  float radius = (float) Math.sqrt(cartesianX * cartesianX + cartesianY * cartesianY);
  float angleInRadians = (float) Math.atan2(cartesianY, cartesianX);
  result[0] = radius ;
  result[1] = angleInRadians ;
  return result ;
}

/**
 *  cartesianToPolar maps a location in the polar coordinate unit
 *  circle 0.0, angle=0.0 upto 1.0, angle=2 * PI to the Cartesian
 *  coordinates cenetered at 0.0,0.0. The returned result, with
 *  Cartesian X in [0] and Y in [1], may lie outside the range
 *  of -1.0, -1.0 through 1.0, 1.0. The caller must verify that
 *  the return values are not outside the clipping boundary.
**/
float [] polarToCartesian(float radius, float angleInRadians) {
  float [] result = new float[2];
  result[0] = (float)(radius * Math.cos(angleInRadians));
  result[1] = (float)(radius * Math.sin(angleInRadians));
  return result ;
}

void plotTimeDomain(AudioContext ac, int [] pixels) {
  int sampleSize = ac.getBufferSize();
  int middle = sampleSize / 2 ;
  float fmiddle = (float) middle ;
  for (int sample = 0 ; sample < sampleSize ; sample++) {
    float cartesianX = (float) (sample - middle) / fmiddle ;
    float cartesianY = ac.out.getValue(0, sample) * lineScale[HORIZONTAL] ;
    if (isZeroOff && cartesianY == 0.0) {
      continue;
    }
    if (cartesianY > 1.0) {
        cartesianY = 1.0 ;
    } else if (cartesianY < -1.0) {
        cartesianY = -1.0 ;
    }
    int [] screenCoords = null;
    if (rotateHAmount == 0) {
      screenCoords = cartesianToPhysical(cartesianX, cartesianY);
    } else {
      float [] polarCoords = cartesianToPolar(cartesianX, cartesianY);
      polarCoords[1] = polarCoords[1] + radians(rotateHAmount);
      float [] cartesianCoords = polarToCartesian(polarCoords[0], polarCoords[1]);
      screenCoords = cartesianToPhysical(cartesianCoords[0], cartesianCoords[1]);
    }
    int hOffset = screenCoords[0];
    int vOffset = screenCoords[1];
    color hcolor = (smearMode != 2) ? (isMonochrome ? WHITEM : theColor[(HORIZONTAL+colorOffset)%theColor.length]) : REVSMEAR ;
    color vcolor = (smearMode != 2) ? (isMonochrome ? WHITEM :theColor[(VERTICAL+colorOffset)%theColor.length]) : REVSMEAR;
    if (hOffset >= 0) {  // test for clipping
      for (int lwx = -lineWidth[HORIZONTAL]/2 ; lwx <= lineWidth[HORIZONTAL]/2 ; lwx++) {
        for (int lwy = -lineWidth[HORIZONTAL]/2 ; lwy <= lineWidth[HORIZONTAL]/2 ; lwy++) {
          int hwx = hOffset+lwx;
          int hwy = vOffset+lwy;
          if (hwx >= 0 && hwx < width && hwy >= 0 && hwy < height) {
            pixels[hwy * width + hwx] = hcolor; // yellow
          }
        }
      }
    }
    cartesianY = ac.out.getValue(0, sample) * lineScale[VERTICAL] ;
    if (rotateVAmount == 0) {
      screenCoords = cartesianToPhysical(cartesianY, cartesianX);
    } else {
      float [] polarCoords = cartesianToPolar(cartesianY, cartesianX);
      polarCoords[1] = polarCoords[1] + radians(rotateVAmount);
      float [] cartesianCoords = polarToCartesian(polarCoords[0], polarCoords[1]);
      screenCoords = cartesianToPhysical(cartesianCoords[0], cartesianCoords[1]);
    }
    ///screenCoords = cartesianToPhysical(cartesianY, cartesianX);
    hOffset = screenCoords[0];
    vOffset = screenCoords[1];
    if (hOffset >= 0) {  // test for clipping
      for (int lwx = -lineWidth[VERTICAL]/2 ; lwx <= lineWidth[VERTICAL]/2 ; lwx++) {
        for (int lwy = -lineWidth[VERTICAL]/2 ; lwy <= lineWidth[VERTICAL]/2 ; lwy++) {
          int hwx = hOffset+lwx;
          int hwy = vOffset+lwy;
          if (hwx >= 0 && hwx < width && hwy >= 0 && hwy < height) {
            pixels[hwy * width + hwx] = vcolor ;
          }
        }
      }
    }
  }
}

// Here is a demo use of polar coordinates. D. Parson
// Draw a circle 3/4 out from center & superimpose signal on it.
void plotTimeDomainPolar(AudioContext ac, int [] pixels) {
  int sampleSize = ac.getBufferSize();
  float fsampleSize = (float) sampleSize ;
  final float radiusOffset = 0.75 ;
  for (int sample = 0 ; sample < sampleSize ; sample++) {
    float polarAngle = (float)((float) sample / fsampleSize * 2.0 * Math.PI) ;
    // polarAngle gives a fraction of distance around the 2PI circle
    float radius = radiusOffset + ac.out.getValue(0, sample) * lineScale[CIRCULAR] /* * 0.5 */ ; // go 1/2 way out
    if (isZeroOff && radius == radiusOffset) {
      continue ;
    }
    if (radius > 1.0) {
        radius = 1.0 ;
    }
    float [] cartesian = polarToCartesian(radius, polarAngle);
    int [] screenCoords = cartesianToPhysical(cartesian[0], cartesian[1]);
    int hOffset = screenCoords[0];
    int vOffset = screenCoords[1];
    color ccolor = (smearMode != 2) ? (isMonochrome ? WHITEM : theColor[(CIRCULAR+colorOffset)%theColor.length]) : REVSMEAR ;
    if (hOffset >= 0 && hOffset < width && vOffset >= 0
        && vOffset < height) {  // test for clipping
      for (int lwx = -lineWidth[CIRCULAR]/2 ; lwx <= lineWidth[CIRCULAR]/2 ; lwx++) {
        for (int lwy = -lineWidth[CIRCULAR]/2 ; lwy <= lineWidth[CIRCULAR]/2 ; lwy++) {
          int hwx = hOffset+lwx;
          int hwy = vOffset+lwy;
          if (hwx >= 0 && hwx < width && hwy >= 0 && hwy < height) {
            pixels[hwy * width + hwx] = ccolor; // white
          }
        }
      }
    }
  }
}

void plotLissajous(AudioContext ac, int [] pixels) {
  int phaseShift = lineWidth[PHASE] ; // 10 ; // ac.getBufferSize() / 4 ;
  int bs = ac.getBufferSize() ;
  for (int i = 0 ; i < ac.getBufferSize() ; i++) {
    float leftAudio = ac.out.getValue(0, i) * lineScale[LISSAJOUS];
    if (leftAudio > 1.0) {
        leftAudio = 1.0 ;
    } else if (leftAudio < -1.0) {
        leftAudio = -1.0 ;
    }
    float phaseShiftedRightAudio = ac.out.getValue(1, (i+phaseShift) % bs) * lineScale[LISSAJOUS];
    if (phaseShiftedRightAudio > 1.0) {
        phaseShiftedRightAudio = 1.0 ;
    } else if (phaseShiftedRightAudio < -1.0) {
        phaseShiftedRightAudio = -1.0 ;
    }
    if (isZeroOff && leftAudio == 0.0 && phaseShiftedRightAudio == 0.0) {
      continue ;
    }
    int [] screenCoords = null ;

    if (rotateL1Amount == 0) {
      screenCoords = cartesianToPhysical(leftAudio, phaseShiftedRightAudio);
    } else {
      float [] polarCoords = cartesianToPolar(leftAudio, phaseShiftedRightAudio);
      polarCoords[1] = polarCoords[1] + radians(rotateL1Amount);
      float [] cartesianCoords = polarToCartesian(polarCoords[0], polarCoords[1]);
      screenCoords = cartesianToPhysical(cartesianCoords[0], cartesianCoords[1]);
    }

    int hOffset = screenCoords[0];
    int vOffset = screenCoords[1];
    color lcolor = (smearMode != 2) ? (isMonochrome ? WHITEM : theColor[(LISSAJOUS+colorOffset)%theColor.length]) : REVSMEAR;
    if (hOffset >= 0) {  // test for clipping
      for (int lwx = -lineWidth[LISSAJOUS]/2 ; lwx <= lineWidth[LISSAJOUS]/2 ; lwx++) {
        for (int lwy = -lineWidth[LISSAJOUS]/2 ; lwy <= lineWidth[LISSAJOUS]/2 ; lwy++) {
          int hwx = hOffset+lwx;
          int hwy = vOffset+lwy;
          if (hwx >= 0 && hwx < width && hwy >= 0 && hwy < height) {
            pixels[hwy * width + hwx] = lcolor; // cyan
          }
        }
      }
      // Now swap left-to-right to get the diagonal to go in opposite X direction.
      hOffset = width - (hOffset + 1);
      color vcolor = (smearMode != 2) ? (isMonochrome ? WHITEM : theColor[(VERTICAL+colorOffset)%theColor.length]) : REVSMEAR;
      for (int lwx = -lineWidth[LISSAJOUS]/2 ; lwx <= lineWidth[LISSAJOUS]/2 ; lwx++) {
        for (int lwy = -lineWidth[LISSAJOUS]/2 ; lwy <= lineWidth[LISSAJOUS]/2 ; lwy++) {
          int hwx = hOffset+lwx;
          int hwy = vOffset+lwy;
          if (hwx >= 0 && hwx < width && hwy >= 0 && hwy < height) {
            pixels[hwy * width + hwx] = vcolor; // green
          }
        }
      }
    }
  }
}

void plotFrequencyDomain(AudioContext ac, int [] pixels) {
  // Here is the FFT analysis based on Chapter 9 in *Sonifying Processing*
  // PowerSpectrum returns an array with the power of 256 spectral bands.
  // NOTE: I did not convert this to cartesian space, but computed it in physical
  // display space, to ensure that I don't skip over any clumns of pixels.
  // That is a potential danger to watch out for. Also, we might consider
  // thickening the lines by plotting adjacent pixels (> 1 pixel thickness).
  // Update 5/27/2015 Have them come in from top, bottom, left + right centers to middle
  int mywidth = width ;  // locate centered rectangle for clipping
  int myheight = height ;
  int xoffset = 0, yoffset = 0 ;
  if (mywidth > myheight) {
      // normally this is the case
    xoffset = (mywidth - myheight) / 2 ;
    mywidth = myheight ;
  } else {
    yoffset = (myheight - mywidth) / 2 ;
    myheight = mywidth ;
  }
  float[] features = ps.getFeatures();
  // if any features are returned
  if(features != null)
    {
    // Parson -- find the max frequency measure and scale the display to it
    float maxAmp = 0.0 ;
    for (int i = 0 ; i < features.length ; i++) {
      if (features[i] > maxAmp) {
        maxAmp = features[i];
      }
    }
    // for each x coordinate in the Processing window
    for(int x = 0; x < mywidth; x++)
      {      
      // figure out which featureIndex corresponds to this x-
      // position
      int featureIndex = (x * features.length) / mywidth;
      // calculate the bar height for this feature
      float strength = 0.0 ;
      if (maxAmp > 0.0) {
        strength = (float) (features[featureIndex]) / maxAmp ;
      }
      strength = strength * lineScale[FREQUENCY] ;
      int barHeight = Math.min((int)(strength * myheight * .33),
          myheight - 1);  // clip to top of display
      // draw a vertical line corresponding to the frequency
      // represented by this x-position
      // line(x, height, x, height - barHeight);
      color f1color = (smearMode != 2) ? (isMonochrome ? WHITEM : theColor[(FREQUENCY+colorOffset)%theColor.length]) : REVSMEAR;
      color f2color = (smearMode != 2) ? (isMonochrome ? WHITEM : theColor[(PHASE+colorOffset)%theColor.length]) : REVSMEAR ;
      for (int y = myheight - barHeight ; y < myheight ; y++)
        {
          // Plot up from bottom, again down from top
          pixels[(y+yoffset) * width + x + xoffset] = f1color ;// red, lower left
          pixels[(height-y+yoffset-1) * width + x + xoffset] = f1color ;// lower right
          pixels[(y+yoffset) * width + (mywidth-x-1)+xoffset] = f1color; // red, lower left
          pixels[(height-y+yoffset-1) * width + (mywidth-x-1+xoffset)] = f1color ;// lower right
          // Experiment with right angles
          pixels[(x+yoffset) * width + y + xoffset] = f2color ;
          pixels[(height-x+yoffset-1) * width + y + xoffset] = f2color ;
          pixels[(x+yoffset) * width + (mywidth-y-1)+xoffset] = f2color; // red, lower left
          pixels[(height-x+yoffset-1) * width + (mywidth-y-1+xoffset)] = f2color ;// lower right
        }
      }
    }
}

// Precompute a clipping mask for pixels[].
void createClippingMask() {
  int radius = ((width < height) ? width : height) / 2 ;
  int centerx = width / 2 ;
  int centery = height / 2 ;
  LinkedList<Integer> mask = new LinkedList<Integer>();
  for (int row = 0 ; row < height ; row++) {
    for (int col = 0 ; col < width ; col++) {
      int distance = (int) Math.sqrt((col - centerx) * (col - centerx)
        + (row - centery) * (row - centery)) + 1 ; // round up by 1 pixel
      if (distance > radius) {
        int nxtcol = col, pix = 1 ;
        while (true) {
          int tmpcol = nxtcol + 1 ;
          distance = (int) Math.sqrt((tmpcol - centerx) * (tmpcol - centerx)
            + (row - centery) * (row - centery)) + 1 ;
          if (distance > radius && ! (tmpcol >= width)) {
            nxtcol = tmpcol ;
            pix++ ;
            continue ;
          }
          mask.add(row * width + col);
          mask.add(row * width + col + pix);
          col = nxtcol ;  // ++ occurs in for loop header
          break ;   // out of while loop
        }
      }
    }
  }
  clippingMask = new int [ mask.size() ];
  for (int i = 0 ; i < clippingMask.length ; i++) {
    clippingMask[i] = mask.get(i).intValue();
  }
}

