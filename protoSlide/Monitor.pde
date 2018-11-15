class Monitor
{
 
// Interface
int diamCirc = 25;
int altoLin = 70;

// Indicadores
int min = 0;
float sec = 0;
int ppm = 124;
int rpm = 86;
float kms = 0; 
  
  Monitor() {
  }
  /*Monitor(int _ppm, int _rpm) {
    this.ppm = _ppm;
    this.rpm = _rpm;

    img = loadImage(imageFile);  // Load the image into the program
  }*/
  
  void mockSensores(boolean simular) {
    if (simular) {
      // si simular es true asigna valores a las variables rpm y ppm
      
      // TIEMPO
      min = frameCount / (int) frameRate / 60;
      sec = frameCount / frameRate % 60;
      
      // PULSO (cada 50 frames)
      if (frameCount % 50 == 0) { // lo cambio cada 50 frames
        ppm = 124 + Math.round(random(-8,8));
      }
      
      // RPM (cada 32)
      if (frameCount % 32 == 0) { // lo cambio cada 32 frames
        rpm = 86 + Math.round(random(-13,13));
      }
      
      // KMS (una cuenta sobre el frameCount
      kms = frameCount;
      kms = kms/286;
    }  
  }
  
  void drawMonitor(boolean enVivo) {
    // Indicadores
    textSize(32);
    fill(200,0,0); // rojo
    
    //L1: Segundos
    translate(0,altoLin+10);
    ellipse(diamCirc/2,diamCirc/2,diamCirc,diamCirc);
    text("min:", 40, 20);  
    text(min+":"+String.format("%04.1f", sec), 120, 20); 
  
    //L2: PPM (pulsaciones por minuto)
    translate(0,altoLin);
    ellipse(diamCirc/2,diamCirc/2,diamCirc,diamCirc);
    text("ppm:", 40, 20);
    text(ppm, 120, 20); 
    
    //L3: RPM (revoluciones de pedaleo)
    translate(0,altoLin);
    ellipse(diamCirc/2,diamCirc/2,diamCirc,diamCirc);
    text("rpm:", 40, 20);
    text(rpm, 120, 20); 
    
    //L4: KMs (Kms recorridos en simulación)
    translate(0,altoLin);
    ellipse(diamCirc/2,diamCirc/2,diamCirc,diamCirc);
    text("kms:", 40, 20);
    text(String.format("%.2f", kms), 120, 20); 
    
  }  
}
