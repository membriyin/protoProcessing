/*
http://www.flong.com/texts/essays/essay_cvad/
como detectar movimiento:
como encontrar si los pixeles han cambiando, 
si los pixeles cambian es porque algo se ha movido
*/
import processing.video.*;
 
Capture video;
 
PImage prevFrame;
//voy a ir guardando la imagen anterior para ver si cambio

float threshold = 50;

int motionPixels = 0;
float motionPercent = 0;
float speed = 0;

void setup() {
  size(320, 240);
  video = new Capture(this, width, height, 30);
  video.start();
  // creo una imagen vacia del mismo tamaño que el video
  prevFrame = createImage(video.width, video.height, RGB);
  
  textSize(22);
  fill(120,120,200);  
}

void captureEvent(Capture video) {
   
  prevFrame.copy(video, 0, 0, video.width, video.height, 0, 0, video.width, video.height); // Before we read the new frame, we always save the previous frame for comparison!
  prevFrame.updatePixels();  // Read image from the camera
  video.read();
}

void draw() {

  loadPixels();
  video.loadPixels();
  prevFrame.loadPixels();

  motionPixels = 0; 
  for (int x = 0; x < video.width; x ++ ) {
    for (int y = 0; y < video.height; y ++ ) {

      int loc = x + y*video.width;            // Step 1, what is the 1D pixel location
      color current = video.pixels[loc];      // Step 2, what is the current color
      color previous = prevFrame.pixels[loc]; // Step 3, what is the previous color

       
      float r1 = red(current); 
      float g1 = green(current); 
      float b1 = blue(current);
      float r2 = red(previous); 
      float g2 = green(previous); 
      float b2 = blue(previous);
      float diff = dist(r1, g1, b1, r2, g2, b2);

      // Step 5, How different are the colors?
      // If the color at that pixel has changed, then there is motion at that pixel.
      if (diff > threshold) { 
        // If motion, display black
        pixels[loc] = color(0);
        motionPixels++;
      } else {
        // If not, display white
        pixels[loc] = color(255);
      }
    }
  }
  
  if (motionPixels <= 100) 
    image(video, 0, 0);
  else
    updatePixels();
  
  motionPercent = float(motionPixels) / 500.00;
  speed = map(motionPixels, 0, 50000, 0, 30) + 20;
  text("motion="+motionPixels+" ( "+String.format("%04.1f", motionPercent)+" % )", 10, 20); 
  text("speed  ="+String.format("%04.1f", speed), 10, 45); 
  
}
