static int POINT_DIAM=14;
static int LINE_STROKE=6;

class Circuito
{
  //PImage img;     // imagen de fondo
  color colorC = color(80,200,80);  // color de dibujo (stroke)
  float[] xPoints = {10,70,70,130,190,120,100};  // lista de coordenada x de los puntos
  float[] yPoints = {20,20,60, 90, 70, 30, 50};  // lista de coordenada y de los puntos
  
  // calculados al inicio
  float[] dists; // lista de distancias entre los puntos.
  float[] xRatios; // lista de ratio en X.
  float[] yRatios; // lista de ratio en Y.  
  
  // variables de control (  tienen default pero se resetean en calcInit() )
  int nroLine = 0;     // nro del segmento (cual es el segmento corriente)
  float posLine = 0;   // posicion en el segmento
  float posX = xPoints[nroLine];    // posicion X en el segmento
  float posY = yPoints[nroLine];    // posicion Y en el segmento  
  boolean eoc   = false; // end of circuit
  boolean debug = false;
  
  Circuito() {
    calcInit();
  }
  
  Circuito(color _colorC, float[] _xPoints, float[] _yPoints) {
    colorC  = _colorC; 
    xPoints = _xPoints;
    yPoints = _yPoints;
    calcInit();
  }
  
  void calcInit() {
    dists   = new float[xPoints.length] ;
    xRatios = new float[xPoints.length] ;
    yRatios = new float[xPoints.length] ;
        
    // Linea i (con punto inicial)
    for (int i=0; i<xPoints.length-1; i++) {       
      dists[i]=dist(xPoints[i], yPoints[i], xPoints[i+1], yPoints[i+1]);
      xRatios[i]=(xPoints[i+1] - xPoints[i])/dists[i];
      yRatios[i]=(yPoints[i+1] - yPoints[i])/dists[i];
    }
    
    nroLine = 0;     // nro del segmento (cual es el segmento corriente)
    posLine = 0;   // posicion en el segmento
    posX = xPoints[nroLine];    // posicion X en el segmento
    posY = yPoints[nroLine];    // posicion Y en el segmento  
    eoc = false;
  }
 
  void show() {
    // circuito fijo completo
    strokeWeight(LINE_STROKE); 
    fill(colorC);  
        
    // Linea i (con punto inicial)
    for (int i=0; i<xPoints.length-1; i++) {        
      noStroke();
      ellipse(xPoints[i], yPoints[i], POINT_DIAM, POINT_DIAM);
      stroke(colorC);      
      line(xPoints[i], yPoints[i], xPoints[i+1], yPoints[i+1]);
    }
    
    // Punto Final
    noStroke();
    ellipse(xPoints[xPoints.length-1], yPoints[xPoints.length-1], POINT_DIAM, POINT_DIAM);
    stroke(colorC);   
  }
  
  void play() { //<>//
    //if (eoc) // si termino de animar no hace nada
    //  return;
      
    // circuito fijo completo
    strokeWeight(LINE_STROKE); 
    fill(colorC);  
       
    //  lineas de dibujo fijas (sin animar)
    for (int i=0; i<nroLine; i++) {        
      // punto
      noStroke();
      ellipse(xPoints[i], yPoints[i], POINT_DIAM, POINT_DIAM);
      //linea
      stroke(colorC);      
      line(xPoints[i], yPoints[i], xPoints[i+1], yPoints[i+1]); //<>//
    }
    //punto
    noStroke();
    ellipse(xPoints[nroLine], yPoints[nroLine], POINT_DIAM, POINT_DIAM);
    // linea de dibujo animada
    stroke(colorC);   
    line(xPoints[nroLine], yPoints[nroLine], posX, posY);
 
    if (posLine < dists[nroLine]) {
      // cambia la posicion (si no posicion actual es menor que la distancia a dibujar)
      posX = posX + xRatios[nroLine];
      posY = posY + yRatios[nroLine];
      posLine++;    
    } else  // si completo la distancia cambia de linea de dibujo      
    if (nroLine < (xPoints.length-1)) {
      // si no es la ultima linea, cambia de linea de dibujo
      nroLine++;
      posX = xPoints[nroLine];
      posY = yPoints[nroLine];
      posLine = 0;    
    } else {
      eoc = true; // end of circuit, termina de animar.
    }         
    
    if (debug)     
      text("l="+nroLine+" |d="+dists[nroLine]+" | pos="+posLine+" | posX="+posX+" | posY="+posY, 10, 350);
  }
  
  void showF() {
    // circuito fijo completo
    strokeWeight(6); 
    fill(colorC);  
        
    // Linea 1 (con punto inicial)
    noStroke();
    ellipse(10, 20, 14, 14);
    stroke(colorC);      
    line(10, 20, 130, 20);
    
    // Linea 2
    noStroke();
    ellipse(130, 20, 14, 14);
    stroke(colorC);     
    line(130, 20, 130, 140);
    
    // Linea 3
    noStroke();
    ellipse(130, 140, 14, 14);
    stroke(colorC);     
    line(130, 140, 330, 240);
    
    // Punto Final
    noStroke();
    ellipse(330, 240, 14, 14);
    stroke(colorC);     
  }
  
  void playF() {
    stroke(colorC);
    strokeWeight(6); 
        
    // lineas de dibujo fijas (sin animar)
    line(10, 20, 130, 20);
    line(130, 20, 130, 140);
    
    // linea de dibujo animada
    line(130, 140, posX, posY);
 
    float d=dist(130, 140, 230, 340);
    float rx=(330-130)/d;
    float ry=(240-140)/d;
    
    if (posLine < 223) {
      posX = posX + rx;
      posY = posY + ry;
      posLine++;    
    } else
        line(130, 140, 330, 240);
                
    text("d="+d+" | pos="+posLine+" | posX="+posX+" | posY="+posY, 10, 350);
  }
  
}
