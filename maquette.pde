// Radial basis function
// librairie équivalente à eigen pour les matrices
// ne plus avoir de zones mais afficher toutes les images et mettre un coef de transparence
// zones deviennent les pts de controle ou la photo qui est associée est mise à 100% de la trasparence
// mettre celle avec le coeff le plus eleve au fond, la dessiner en premier
// faire pareil pour le son

import SimpleOpenNI.*; // représente la kinect

import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;

SimpleOpenNI context;
Sensor sensor;
Minim minim;

PVector com3d = new PVector();                                   
PVector com2d = new PVector(); 

// tableau mosaique img
PImage[] images; // Tableau pour mettre plusieurs images
int img_id;
PImage img;

// tableau photomontages
PImage[] imagesMixees; // Tableau pour mettre plusieurs images
int imgMix_id;
PImage imgImagine;

// tableau sons réels
AudioPlayer[] tabSons; //21bSons;
int son_id;
AudioPlayer audioPlay;

// tableau sons imaginaires
AudioPlayer[] tabSonsMixes; //11Mixes;
int sonMix_id;
AudioPlayer audioPlayImagine;

int[] counter;

/*String[] paths; // Tableau pour les animations
 int video_id;
 boolean animation;*/
 
/* void keyPressed() {
  // fonction qui détecte l'appui sur la touche du clavier espace
  if ( key == ' ' ) {
    sensor.state = 1;
  }
  if ( key == 'a' ) {
    sensor.state = 2;
  }
}*/

void setup() {

  size(1920, 1080);
  background(0);
  context = new SimpleOpenNI(this); // initialise objet openNI
  minim = new Minim(this);
  context.enableDepth();
  context.enableUser();
  com3d = new PVector(); // vecteurs permettant après de récupérer la place de l'utilisateur dans l'espace
  com2d = new PVector();
  sensor = new Sensor();


  // Tableau pour les images
  images = new PImage[5];
  images[0] = loadImage("zone2.jpg"); 
  images[1] = loadImage("zone3.jpg");
  images[2] = loadImage("zone4.jpg");
  images[3] = loadImage("zone5.jpg"); 
  images[4] = loadImage("zone6.jpg");

  imagesMixees = new PImage[5];
  imagesMixees[0] = loadImage("montageZone2.jpg");
  imagesMixees[1] = loadImage("montageZone3.jpg");
  imagesMixees[2] = loadImage("montageZone4.jpg");
  imagesMixees[3] = loadImage("montageZone5.jpg");
  imagesMixees[4] = loadImage("montageZone6.jpg");

  //Tableau sons réels
  tabSons = new AudioPlayer[21];
  tabSons[0] = minim.loadFile("zone2-1.mp3");
  tabSons[1] = minim.loadFile("zone2-2.mp3");
  tabSons[2] = minim.loadFile("zone2-3.mp3");
  tabSons[3] = minim.loadFile("zone2-4.mp3");
  tabSons[4] = minim.loadFile("zone3-1.mp3");
  tabSons[5] = minim.loadFile("zone3-2.mp3");
  tabSons[6] = minim.loadFile("zone3-3.mp3");
  tabSons[7] = minim.loadFile("zone3-4.mp3");
  tabSons[8] = minim.loadFile("zone4-1.mp3");
  tabSons[9] = minim.loadFile("zone4-2.mp3");
  tabSons[10] = minim.loadFile("zone4-3.mp3");
  tabSons[11] = minim.loadFile("zone4-4.mp3");
  tabSons[12] = minim.loadFile("zone4-5.mp3");
  tabSons[13] = minim.loadFile("zone5-1.mp3");
  tabSons[14] = minim.loadFile("zone5-2.mp3");
  tabSons[15] = minim.loadFile("zone5-3.mp3");
  tabSons[16] = minim.loadFile("zone5-4.mp3");
  tabSons[17] = minim.loadFile("zone6-1.mp3");
  tabSons[18] = minim.loadFile("zone6-2.mp3");
  tabSons[19] = minim.loadFile("zone6-3.mp3");
  tabSons[20] = minim.loadFile("zone6-4.mp3");

  //Tableau sons imaginaires
  tabSonsMixes = new AudioPlayer[11];
  tabSonsMixes[0] = minim.loadFile("mixZone2-1.mp3", 2048);
  tabSonsMixes[1] = minim.loadFile("mixZone2-2.mp3", 2048);
  tabSonsMixes[2] = minim.loadFile("mixZone3-1.mp3", 2048);
  tabSonsMixes[3] = minim.loadFile("mixZone3-2.mp3", 2048);
  tabSonsMixes[4] = minim.loadFile("mixZone3-3.mp3", 2048);
  tabSonsMixes[5] = minim.loadFile("mixZone4-1.mp3", 2048);
  tabSonsMixes[6] = minim.loadFile("mixZone4-2.mp3", 2048);
  tabSonsMixes[7] = minim.loadFile("mixZone4-3.mp3", 2048);
  tabSonsMixes[8] = minim.loadFile("mixZone5-1.mp3", 2048);
  tabSonsMixes[9] = minim.loadFile("mixZone5-2.mp3", 2048);
  tabSonsMixes[10] = minim.loadFile("mixZone6-1.mp3", 2048);

  sensor = new Sensor();
  counter = new int[5];
}

void draw() {

  //context.update(); // permet de récupérer des informations depuis la kinect

  /*switch(sensor.state) {
  default:
    sensor.state = 1;
    println("Ambiance réelle par défaut");
    context.update(); // permet de récupérer des informations depuis la kinect
    img = images[img_id];
    image(img, width/2-img.width/2, height/2-img.height/2); // dessine l'image de la photo au centre de l'écran
    audioPlay = tabSons[son_id];
    break;

  case 1: // Attente*/
    //println("Ambiance réelle");
    context.update(); // permet de récupérer des informations depuis la kinect
    img = images[img_id];
    image(img, width/2-img.width/2, height/2-img.height/2); // dessine l'image de la photo au centre de l'écran
    audioPlay = tabSons[son_id];
 /*   break;

  case 2: // Approche
    println("Ambiance imaginaire");
    context.update(); // permet de récupérer des informations depuis la kinect
    imgImagine = imagesMixees[imgMix_id];
    image(img, width/2-img.width/2, height/2-img.height/2); // dessine l'image de la photo au centre de l'écran
    audioPlayImagine = tabSonsMixes[sonMix_id];
    break;
  }*/

  int[] userList = context.getUsers(); // tableau de nombres entiers. Permet de capter plusieurs valeurs, plusieurs personnes
  for (int i=0; i<userList.length; i++) {
    if (context.getCoM(userList[i], com3d)) { // si l'objet est capable de détecter un centre de gravité alors il le dessine -> savoir si le centre de gravité a été détecté
      // get.CoM permet de renvoyer un résultat et elle peut modifier la valeur de com3d
      context.convertRealWorldToProjective(com3d, com2d);
    }
  }  
  sensor.update();
}




