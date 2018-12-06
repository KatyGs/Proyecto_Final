class Camaraweb{
  float r;
  
  Camaraweb(){
     this.r= + 0.02;
  }
  
  void display(){
     captura();
     
      if( key == '1'){
        perspectiva= 2;
      }
  }
  
  void captura(){
    if (video.available()) {
        video.read();
       }
      image(video,0,0);
  }
}
