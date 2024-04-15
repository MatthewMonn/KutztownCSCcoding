// STUDENT 5%: Complete this comment block, including your name & blank entries.
/************************************************************
/* Sketch: CSC220Fall2023Final6Maze, optional extra credit project.
/* STUDENT MUST submit projects 1-5 in order to use this as extra credit.
/* Author: STUDENT NAME
/* Creation Date: 11/16/2023
/* Due Date: Friday 12/15/2023 at 11:59 PM
/* Course: 
/* Professor Name: Dr. Parson
/* Assignment: 6 (optional).
/* Purpose: Tunnel a 2D maze, either interactively or semi-automatically.
*************************************************************/

/* POLLED KEYS IN keyPolled().
/* THESE KEYS ARE POLLED IN FUNCTION keyPolled() to do the following actions.
/* NOTE : RIGHT, LEFT, UP, and DOWN arrows must be ignored when excavator is isAutoMode. 
/* RIGHT ARROW moves the excavator 1 pixel to the right, allows maze completion out right side.
   DO NOT MOVE THE EXCAVATOR OFF SCREEN, AND FOR ALL DIRECTIONS EXCEPT RIGHT, NEVER LET IT
   GO PAST WallSize PIXELS AWAY FROM THE left, top, or bottom edge of display.
/* LEFT ARROW moves the excavator 1 pixel to the right, stops when within WallSize of x==0.
/* UP ARROW moves the excavator 1 pixel up, stops when within WallSize of y==0.
/* DOWN ARROW moves the excavator 1 pixel down, stops when within WallSize of y==height-1.

/* NON-POLLED KEYS IN keyPressed().
/* 'a' puts excavator in isAutoMode mode.
*/

int excavatorX, excavatorY ;
boolean isAutoMode = false ;
int autoModeXspeed = 0, autoModeYspeed = 0, autoModeXendpoint = 0, autoModeYendpoint = 0 ;
final int WallSize = 25 ;  // Do not go beyond WallSize*2 except to tunnel out to right side.
// STUDENT 5% Set your own spaceColor & wallColor that differ from mine, using RGB
final int spaceColor = color(0, 128, 128);  // Color outside the maze in RGB, and tunnel color.
final int wallColor = color(128, 0, 0);   // Color of the walls.
PImage excavator = null ;

void setup() {
  size(1000, 1000, P2D);    // STUDENT may adjust size to fit monitor or use fullScreen(P2D);
  frameRate(60);            // for newer Mac bug
  excavatorX = WallSize/2 ;         // tunnel in from left
  excavatorY = int(random(WallSize*2, height-WallSize*2));
  background(spaceColor);
  rectMode(CORNER);
  fill(wallColor);
  stroke(0);
  rect(WallSize, WallSize, width-WallSize*2, height-WallSize*2);
  noStroke();
  imageMode(CENTER);
  // STUDENT 5% load your image file into excavator.
}

boolean firstTime = true ; // ADDED 12/8 see start of draw() function below
void draw() {
  if (firstTime) {
    // Added 12/8 because of a bug in at least one Processing installation.
    // This was already done in setup(), but at least one student's
    // Processing system is only displaying the rect(...) from setup
    // in a quick flash. Displaying it the first time in draw() fixes
    // the problem for that student, so:
    rectMode(CORNER);
    fill(wallColor);
    stroke(0);
    rect(WallSize, WallSize, width-WallSize*2, height-WallSize*2);
    noStroke();
    firstTime = false ;
  }
  /* STUDENT 30% of project:
    1. set the fill color to spaceColor, with no stroke.
    2. if sketch is in isAutoMode mode
        if excavatorX equals autoModeXendpoint and excavatorY equals autoModeYendpoint
            set isAutoMode to false
        else
            add autoModeXspeed into excavatorX
            add autoModeYspeed into excavatorY
    3. Draw a rectangle centered at excavatorX, excavatorY with width & height of WallSize
    4. Draw excavator image at excavatorX, excavatorY with width & height a fraction of WallSize
        Your image must fit fully inside the rectangle in which it is centered.
    5. Call function keyPolled.
  */
}

void keyPolled() {
  if (keyPressed) {
    /* START OF STUDENT CODE, 25% of project:
      If the key is coded and sketch is NOT already in isAutoMode
          If it is LEFT
            set excavatorX to excavatorX-1,
                constrained to range min(excavatorX,WallSize*2) and width-1
          Else if it is RIGHT
            set excavatorX to excavatorX+1,
                constrained to range 0 and width-1
          Else if it is UP
            set excavatorY to excavatorY-1,
                constrained to range WallSize*2 and height-WallSize*2
          Else if it is DOWN
            set excavatorY to excavatorY+1,
                constrained to range 0 and height-WallSize*2
     */
  }
}

int [][] XYdeltas = {
  {-1, 0},  // left
  {0, -1},  // up
  {1, 0},   // right
  {0, 1}    // down
};

void keyPressed() {
  /* STUDENT CODE, 30% of project:
    If they key is 'a' and sketch is NOT already in isAutoMode
      Set global isAutoMode to true
      Initialize local int XYdeltaIndex to a random number between 0 and XYdeltas.length-1
      Set global autoModeXspeed to XYdeltas[XYdeltaIndex][0]
      Set global autoModeYspeed to XYdeltas[XYdeltaIndex][1]
      If autoModeXspeed is not equal to 0
        Set autoModeYendpoint equal to excavatorY
        Set autoModeXendpoint equal to excavatorX
            PLUS (autoModeXspeed TIMES a random number between WallSize and WallSize*10)
        If autoModeXendpoint is less than (the smaller of WallSize*2 and excavatorX)
          Set autoModeXendpoint to (the smaller of WallSize*2 and excavatorX)
        Else if autoModeXendpoint is greater than or equal to width of the display
          Set autoModeXendpoint to width-1
          If excavatorX is greater than or equal to width of the display
            Set excavatorX to width-1
      Else // autoModeXspeed is equal to 0
        Set autoModeXendpoint equal to excavatorX
        Set autoModeYendpoint equal to excavatorY
            PLUS (autoModeYspeed TIMES a random number between WallSize and WallSize*10)
        If autoModeYendpoint is less than (the smaller of WallSize*2 and excavatorY)
          Set autoModeYendpoint to (the smaller of WallSize*2 and excavatorY)
        Else if autoModeYendpoint is greater than or equal to height-WallSize*2
          Set autoModeYendpoint to the larger of height-WallSize*2 and excavatorY
  */
}

