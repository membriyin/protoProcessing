class AppModel
//Nota: el tamaño de la s imagenes coincide con el del cuadrante 1 = 600x400
{
  PImage imgApp, imgMap, imgCfg;     // imagen de fondo
  String[] imagesFiles = {"bici.jpg","fede.jpg","gallo.jpg" };  // lista de imagenes
  String[] titles = {"Ch. Roig - 14/10/2018 - Teatro",        // lista de titulos
                     "En Vivo (monitoreando...)",        
                     "C. Raspanti - 21/04/2017 - Bici" };  
  String[] banners = {"En Vivo (monitoreando...)",              // lista de banner
                     "Christian Roig actuó en La Bici Inspirado por Federico.",
                     "Christian Raspanti corrió el Ironman de Florianópolis Inspirado por Federico." };  
  int imagePos = 0;                   
  
  AppModel() {
    imgApp = loadImage("bici.jpg"); //fede.jpg, gallo.jpg 
    imgCfg = loadImage("config.png"); 
  }
  
  PImage getImgApp() {
    return imgApp;
  }
    
  void showHelp() {
    image(imgCfg,width-36,10,32,32); 
  }
  
  void showImage() {
    changeByFrame(); // cada N frames cambia la imagen
    
    image(imgApp,0,0); // omito el size
  }
  
  void changeByFrame() {
    if (frameCount % 300 == 0) {
      //cada 300 frames cambia la imagen por la siguiente
      imagePos = (imagePos + 1) % imagesFiles.length;
      imgApp = loadImage(imagesFiles[imagePos]); 
    }
  }
  
  
  
  void showMap() {
    image(imgMap,0,0); // omito el size
  }
  
  void drawTitulo(boolean enVivo) {
    //titulo
    textSize(22);
    fill(120,120,200);  
    if (enVivo) {
      text("En Vivo (monitoreando...)", 10, 30);  
    //} else if (frameCount < 300) {
    //  text("Ch. Roig - 14/10/2018", 10, 30);  
    } else {
      text(titles[imagePos], 10, 30);    
    }
  }
      
  void drawBanner(boolean enVivo) {
    //titulo
    textSize(18);
    fill(120,120,200);  
    if (enVivo) {
      text(banners[0], 10, 3);  
    } else {
      text(banners[imagePos], 10, 3);  
    }
  }
}
