/**
 * Mirror 
 * by Daniel Shiffman.  
 *
 * Each pixel from the video source is drawn as a rectangle with rotation based on brightness.   
 */ 
 
import processing.video.*;
import gab.opencv.*;
import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;

Capture video;
Box2DProcessing box2d;
OpenCV opencv;

ArrayList<Contour> contours;
ArrayList<Contour> polygons;
//clase Box2d
ArrayList<CustomShape> polygonos;


Inicio inicio;
Camaraweb cw;
Fragmento fragmento;
Lineas linea;
Pixeles pix;
Rombo rombos;

int perspectiva;

void setup() {
  size(640, 480);
  smooth();
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  // We are setting a custom gravity
  box2d.setGravity(0, -20);

  // Create ArrayLists  
  polygonos = new ArrayList<CustomShape>();
  colorMode(RGB, 255, 255, 255, 100);

  // This the default video input, see the GettingStartedCapture 
  // example if it creates an error
  video = new Capture(this, width, height);
  opencv = new OpenCV(this, video);
  
  // Start capturing the images from the camera
  video.start();  
  
  opencv.startBackgroundSubtraction(5, 3, 0.5);
  opencv.threshold(70);
  contours = opencv.findContours();
  

  
  inicio = new Inicio();
  cw = new Camaraweb();
  fragmento = new Fragmento();
  linea = new Lineas();
  pix = new Pixeles();
  rombos = new Rombo();
}


void draw() { 
  switch(perspectiva){
      case 0:
      inicio.display();
      break;
      case 1:
      cw.display();
      break;
      case 2:
      pix.display();
      break;
      case 3:
      fragmento.display();
      break;
      case 4:
      linea.display();
      break;
      case 5:
      rombos.display();
      break;
    }
}
