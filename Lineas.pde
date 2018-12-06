class Lineas{
  int c;
  Lineas(){
    
  }
  
  void display(){
    background(0);
    if (video.available()) {
          video.read();
        }
        
         pushMatrix();
         //translate(200,200);
         scale(-1,1);
         beginShape();
         image(video,0,0);
         opencv.loadImage(video);
         endShape();
         popMatrix();
         
         video.loadPixels();
         
         filter(BLUR, 4);
         filter(DILATE);
         filter(POSTERIZE, 9);
      
         opencv.updateBackground();
            
         opencv.dilate();
         opencv.erode();
            
            strokeCap(ROUND);
            strokeJoin(ROUND);
            strokeWeight(3);
            lineas();
            
      for (Contour contour : opencv.findContours()) {
        fill(0);
        stroke(255,244,24);//amarillo
        contour.draw();
    
          fill(this.c);
          stroke(255, 53, 53);//rojo
          pushMatrix();
          scale(-1,1);
          beginShape();
            for (PVector point : contour.getPolygonApproximation().getPoints()) {
              vertex(point.x, point.y);
            }
          endShape(CLOSE);
          popMatrix();
          
          pushMatrix();
          translate(width/2, height/2);
          fill(this.c,90);
          stroke(47,156,181);//azul
          beginShape();
            for (PVector point : contour.getPolygonApproximation().getPoints()) {
              vertex(point.x, point.y/2);
            }
          endShape(CLOSE);
          popMatrix();
      
          fill(0);
          stroke(255,141,186);
          beginShape();
            for (PVector point : contour.getPolygonApproximation().getPoints()) {
              vertex(point.x/2, point.y);
            }
          endShape(CLOSE);
          
      }
      
      if(key == '3'){
        perspectiva = 5;
      }
  }
  
  void lineas(){
     for (int i = 0; i <video.width; i++){
          for (int j = 0; j <video.height; j++){
            this.c = video.get(i,j);
      }
    }
  }
  
}
