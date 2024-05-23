import ddf.minim.*;

Minim minim;
AudioPlayer player;
PImage lebron;
void setup() {
  size(1800, 2560); 
  fullScreen();
  // Initialize Minim
  minim = new Minim(this);
  lebron = loadImage("lebron.jpg");
  lebron.resize(width, height);
  // Load the audio file
  player = minim.loadFile("audio.mp3");
  player.setGain(10000);
  player.loop();
}

void draw() {
  background(255); // Set background color to white
  image(lebron, 0, 0); // Display the image at position (0, 0)
}

void stop() {
  player.close();
  minim.stop();
  super.stop();
}
