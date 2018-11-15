
Circuito circuito1;
Circuito circuito2;

void setup() {
  //size(img.width+img.height, img.height*2); //como no se puede usar el size con variables, hago la cuenta para bici.jpg
  size(600,260);
  frameRate(10);

  circuito1 = new Circuito();
  
  float[] xPoints2 = {10,70,70,30,190,190,100};  // lista de coordenada x de los puntos
  float[] yPoints2 = {50,20,80,110,120,30, 50};  // lista de coordenada y de los puntos
  circuito2 = new Circuito(color(200,80,80), xPoints2, yPoints2);
}

void draw() {
  background(0);

  circuito1.play();
  translate(300,0);
  circuito2.play();
  translate(-300,0);  
}
