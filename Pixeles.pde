class Pixeles{
    int c;
    
  Pixeles(){
    filter(BLUR, 4);
    filter(DILATE);
    filter(POSTERIZE, 9);
  }
  
  void display(){
     figirreg();
     if( key == '2'){
       perspectiva = 3;
     }
  }
  
  void figirreg(){
      if (video.available()) {
        video.read();
        video.loadPixels();
        mosaico();
        for (int i = 0; i < video.width; i+=15){
          for (int j = 0; j < video.height; j+=15){
            //almaceno el color del pixel i,j
            this.c = video.get(i,j);    
            fill(c);
            pushMatrix();
            scale(-1,1);
            polygonos.add(new CustomShape(i,j,c));
            popMatrix();
          }
        }
        
      }
      
       for (CustomShape cs: polygonos) {
        cs.display();
      }
      
      
      for (int i = polygonos.size()-1; i >= 0; i--) {
        CustomShape cs = polygonos.get(i);
        if (cs.done()) {
          polygonos.remove(i);
        }
      }
  }
  
  void mosaico(){
       pushMatrix();
       background(video);
       beginShape();
       video.loadPixels();
       image(video,0,0);
            for(int p = 0; p < video.width; p++){
              for(int r = 0; r < video.height; r++){
               // color s = color (255,0,0);
                int loc = p+r*width;
                int clr = video.get(p,r); 
                video.pixels[loc/2]= color(clr);
              }
            }
       video.updatePixels();
       endShape(CLOSE);
       popMatrix();
  }
  
}
