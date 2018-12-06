class Inicio{
  PFont titulo, desc, inst;
  PImage fondo;
  
  Inicio(){
      titulo = createFont ("Megrim.ttf",65);
      desc = createFont ("Assistant.ttf",21);
      inst = createFont ("Alegreya.ttf",19);
      fondo = loadImage("P.Picasso.jpg");
  }
  
  void display(){
      image(fondo,0,0);
      filter(BLUR, 2);
      textAlign(CENTER);
      fill(255);
      textFont(titulo);
      text("PERSPEC", 260, height/6.5);
      pushMatrix();
      translate( 448, height/16.5);
      rotate(PI);
      beginShape();
      text("AVIT", 0, 0);
      endShape(CLOSE);
      popMatrix();
      textFont(desc);
      text("Diferentes perspectivas para verte frente a la webcam", width/2, height/3.8);
      text("por medio de la geometría.", width/2, height/3.2);
      textSize(16);
      text("Para una mejor experiencia muevete constantemente", width/2, 385);
      text("(PARA EMPEZAR PRESIONA 'ENTER')", width/2, 430);
      textFont(inst);  
      text("Presiona las teclas en el orden siguiente:", width/2, height/2.6);
      text("'1' Mosaico", width/2, 228);
      text("'2' Fragmentación", width/2, 258);
      text("'3' Lineas", width/2, 288);
      text("'4' Polígonos", width/2, 318);
      //text("'A' para PopArt"", width/2, 348);
      text("Presiona 'BACKSPACE' para regresar al inicio", width/2, 348);
      
      if(key == ENTER){
       perspectiva = 1;
     } 
  }
}
