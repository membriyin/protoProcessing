// constants

// SIZE=1000x850
static int Q1_X_SIZE = 600;
static int Q1_Y_SIZE = 400;
static int MARGIN = 20;

AppModel app;
//Monitor  monitor;
//Circuito circuito;
//LedPanel ledPanel;

void setup() {
  app = new AppModel();
  //size(img.width+img.height, img.height*2); //como no se puede usar el size con variables, hago la cuenta para bici.jpg
  size(600,500);
  

  /*monitor  = new Monitor();
  circuito = new Circuito();
  ledPanel = new LedPanel(app.getImgApp(), MARGIN);  */
}

void draw() {
  background(0);
  app.drawTitulo(false);
  app.showHelp();
  
  translate(0,50);  
  app.showImage();
  
  // Imagen B - IZQ-BOT
  translate(0,Q1_Y_SIZE+25);
  app.drawBanner(false); 
  
}
