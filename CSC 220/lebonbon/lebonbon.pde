import ddf.minim.*;

Minim minim;
AudioPlayer player;
PImage lebron;
void setup() {
  size(800, 800); 
  
  // Initialize Minim
  minim = new Minim(this);
  lebron = loadImage("C:/Users/Matth/Downloads/lebron.jpg");
  // Load the audio file
  player = minim.loadFile("C:/Users/Matth/Downloads/audio.mp3");
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
