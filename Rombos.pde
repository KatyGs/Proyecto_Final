class Rombo{
  PGraphics r1;
  color c,c1,c2,rojo,verde,azul,amarillo,naranja;
  int numPixels;
  int colores;
  
  Rombo(){
    r1 = createGraphics(width,height);
    
    this.c = video.width*video.height;
    this.c1 = r1.width*r1.height;
    
    this.rojo = color(255,76,75);
    this.verde = color(114,255,119);
    this.azul = color (102,250,255);
    this.amarillo = color (232,212,80);
    this.naranja = color (232,107,49);
    this.numPixels = video.width * video.height;
    opencv.startBackgroundSubtraction(5, 3, 0.5);
  }
  
  void display(){
    colores();
    rombo1();
    dibujo();
    
    if(key == BACKSPACE){
      perspectiva = 0;
    }
  }
  
  void colores(){
    if (video.available()) {
        video.read();
        opencv.loadImage(video);
        opencv.updateBackground();
  
        video.loadPixels();
        int threshold = 127; // Set the threshold value
        int threshold2 = 200;
        float pixelBrightness; // Declare variable to store a pixel's color
        // Turn each pixel in the video frame black or white depending on its brightness
        loadPixels();
          for (int i = 0; i < numPixels; i++) {
            pixelBrightness = brightness(video.pixels[i]);
              if (pixelBrightness > threshold) { // If the pixel is brighter than the
                pixels[i] = rojo; // threshold value, make it warm colors
              } 
              else { // Otherwise,
                pixels[i] = azul; 
              }
              if (pixelBrightness > threshold2){
                pixels[i] = amarillo;
              }
              if (pixelBrightness < threshold2/4){
                pixels[i] = verde;
              }
              if (pixelBrightness > threshold2+25) { 
                pixels[i] = naranja; 
              }
            
          }
        
        updatePixels();
    }
      
  }
  
  void dibujo(){
              //Rombos
                pushMatrix();
                translate(width,height);
                beginShape();
                fill(this.c1);
                vertex(106.66,0);
                vertex(0, height/2);
                vertex(106.66, height);
                vertex(213.33, height/2);
                //filter(INVERT);
                endShape(CLOSE);
                popMatrix();
                
                fill(this.c);
                beginShape();
                vertex(319.99,0);
                vertex(213.33, height/2);
                vertex(319.99, height);
                vertex(426.65, height/2);
                endShape(CLOSE);
                
                fill(this.c1);
                beginShape();
                vertex(533.313,0);
                vertex(426.65, height/2);
                vertex(533.313, height);
                vertex(width, height/2);
                endShape(CLOSE);
                
           //Triángulos     
            noStroke();
            fill(0);
            beginShape();
            triangle(0,0,106.66,0,0,height/2);
            triangle(106.66,0,213.66,height/2,319.99,0);
            triangle(319.99,0,426.65, height/2,533.313,0);
            triangle(533.313,0,width, height/2,width,0);
            endShape(CLOSE);
            
            pushMatrix();
            translate(width,height);
            rotate(PI);
            beginShape();
            triangle(0,0,106.66,0,0,height/2);
            triangle(106.66,0,213.66,height/2,319.99,0);
            triangle(319.99,0,426.65, height/2,533.313,0);
            triangle(533.313,0,width, height/2,width,0);
            endShape(CLOSE);
            popMatrix();
     
  }
  
  void rombo1(){
      r1.beginDraw();
      r1.image(video,0,0);
      r1.endDraw();
      
      pushMatrix();
      translate(220,height);
      //scale(.5);
      rotate(PI);
       image(r1,0,0);
        filter(BLUR, 2);
        filter(DILATE);
        filter(POSTERIZE,9);
      popMatrix();
      
      pushMatrix();
      translate(1065,height);
      //scale(.5);
      rotate(PI);
       image(r1,0,0);
        filter(BLUR, 2);
        filter(DILATE);
        filter(POSTERIZE,9);
      popMatrix();
  }
  

}
