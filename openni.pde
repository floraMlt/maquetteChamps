class Sensor {
 
  int value;
  int state; // indique état actuel du projet
  int prevState; // indique état antérieur pour le changement d'état
  float maxValue; // distance maximum 
  int zone;
  int nbRand[];
  int prevNbRand[];
  
  Sensor() {
      value = 0;
      state = 1;
      prevState = -1;
      maxValue = 3000; // la distance la plus loin détectée est 2,50 m
      zone = 0;
      nbRand = new int[5];
      nbRand[0] = int(random(0, 3));
      nbRand[1] = int(random(4, 7));
      nbRand[2] = int(random(8, 12));
      nbRand[3] = int(random(13, 16));
      nbRand[4] = int(random(17, 21));
      prevNbRand = new int[5];
      prevNbRand[0] = nbRand[0];
      prevNbRand[1] = nbRand[1];
      prevNbRand[2] = nbRand[2];
      prevNbRand[3] = nbRand[3];
      prevNbRand[4] = nbRand[4];
  }  
  
  
  void update() {

      context.update(); // permet de récupérer des infos récentes depuis la kinect

      // zone 2
      //if (com3d.z <= 2000 && com3d.z >= 500 && com3d.x >= -1800 && com3d.x <= -750) {
      if (com3d.z <= 1933 && com3d.z >= 1000 && com3d.x >= -1400 && com3d.x <= -583) {
        zone = 2;
        counter[0] = (counter[0] +1) % 475; // on incrémente le compteur et il revient à 0 quand il est égal à 300
        tint(255, 40);
        image(images[0], width/2-img.width/2, height/2-img.height/2);
        noTint();
        tabSons[nbRand[0]].play();
        tabSons[nbRand[1]].pause();
        tabSons[nbRand[2]].pause();
        tabSons[nbRand[3]].pause();
        tabSons[nbRand[4]].pause();
        println("zone 2");
        println(nbRand[0]);
        println("counter 2 "+counter[0]);
        if(counter[0] == 474){
          prevNbRand[0] = nbRand[0];
          nbRand[0] = int(random(0,3));
          tabSons[prevNbRand[0]].pause();
          tabSons[nbRand[0]].loop();
          tabSons[nbRand[0]].play();
        } 
      }
      
      // zone 3 
      //if (com3d.z <= 2000 && com3d.z >= 500 && com3d.x >= -750 && com3d.x <= -125) {
      if (com3d.z <= 1933 && com3d.z >= 1000 && com3d.x >= -583 && com3d.x <= -97) {
        zone = 3;
        counter[1] = (counter[1] +1) % 475; // on incrémente le compteur et il revient à 0 quand il est égal à 300
        tint(255, 40);
        image(images[1], width/2-img.width/2, height/2-img.height/2);
        noTint();
        tabSons[nbRand[1]].play();
        tabSons[nbRand[0]].pause();
        tabSons[nbRand[2]].pause();
        tabSons[nbRand[3]].pause();
        tabSons[nbRand[4]].pause();
        println("zone 3");
        println(nbRand[1]);
        println("counter 3 "+counter[1]);
        if(counter[1] == 474){
          prevNbRand[1] = nbRand[1];
          nbRand[1] = int(random(4,7));
          tabSons[prevNbRand[1]].pause();
          tabSons[nbRand[1]].loop();
          tabSons[nbRand[1]].play();
        }
      }
      
      // zone 4   
      //if (com3d.z <= 2000 && com3d.z >= 500 && com3d.x >= -125 && com3d.x <= 675) {
      if (com3d.z <= 1933 && com3d.z >= 1000 && com3d.x >= -97 && com3d.x <= 525) {  
        zone = 4;
        counter[2] = (counter[2] +1) % 475; // on incrémente le compteur et il revient à 0 quand il est égal à 300
        tint(255, 40);
        image(images[2], width/2-img.width/2, height/2-img.height/2);
        noTint();
        tabSons[nbRand[2]].play();
        tabSons[nbRand[0]].pause();
        tabSons[nbRand[1]].pause();
        tabSons[nbRand[3]].pause();
        tabSons[nbRand[4]].pause();
        println("zone 4");
        println(nbRand[2]);
        println("counter 4 "+counter[2]);
        if(counter[2] == 474){
          counter[2] = (counter[2] +1) % 300;
          prevNbRand[2] = nbRand[2];
          nbRand[2] = int(random(8, 12));
          tabSons[prevNbRand[2]].pause();
          tabSons[nbRand[2]].loop();
          tabSons[nbRand[2]].play();
        }
      }
      
      // zone 5
      //if (com3d.z <= 2000 && com3d.z >= 500 && com3d.x >= 675 && com3d.x <= 1800) {
      if (com3d.z <= 1933 && com3d.z >= 1000 && com3d.x >= 525 && com3d.x <= 1400) {  
        zone = 5;
        //counter[3] = 0;
        counter[3] = (counter[3] +1) % 475; // on incrémente le compteur et il revient à 0 quand il est égal à 300
        tint(255, 40);
        image(images[3], width/2-img.width/2, height/2-img.height/2);
        noTint();
        tabSons[nbRand[3]].play();
        tabSons[nbRand[0]].pause();
        tabSons[nbRand[1]].pause();
        tabSons[nbRand[2]].pause();
        tabSons[nbRand[4]].pause();
        println("zone 5");
        println(nbRand[3]);
        println("counter 5 "+counter[3]);
        if(counter[3] == 474){
          prevNbRand[3] = nbRand[3];
          nbRand[3] = int(random(13, 16));
          tabSons[prevNbRand[3]].pause();
          tabSons[nbRand[3]].loop();
          tabSons[nbRand[3]].play();
        }
      }
      
      // zone 6
      //if (com3d.z <= 3000  && com3d.z >= 2000 && com3d.x >= -125 && com3d.x <= 1800) {
      if (com3d.z <= 2867  && com3d.z >= 1933 && com3d.x >= -97 && com3d.x <= 1400) {  
        zone = 6;
        counter[4] = (counter[4] +1) % 475; // on incrémente le compteur et il revient à 0 quand il est égal à 300
        tint(255, 20);
        image(images[4], width/2-img.width/2, height/2-img.height/2);
        noTint();
        tabSons[nbRand[4]].play();
        tabSons[nbRand[0]].pause();
        tabSons[nbRand[1]].pause();
        tabSons[nbRand[2]].pause();
        tabSons[nbRand[3]].pause();
        println("zone 6");
        println(nbRand[4]);
        println("counter 6 "+ counter[4]);
        if(counter[4] == 474){
          prevNbRand[4] = nbRand[4];
          nbRand[4] = int(random(17, 21));
          tabSons[prevNbRand[4]].pause();
          tabSons[nbRand[4]].loop();
          tabSons[nbRand[4]].play();
        }
      }
      
      // zone inactive
     // if (com3d.z <= 3000  && com3d.z >= 2000 && com3d.x >= -1800 && com3d.x <= -125) {
      if (com3d.z <= 2867  && com3d.z >= 1933 && com3d.x >= -1400 && com3d.x <= -97) {  
        println("zone inactive");
      }
       
      prevState = state; // actualiser l'etape precedente  L'état anterieur devient l'etat actuel comme ça on peut passe de l'etat 1 à 2 mais aussi de 2 à 1, etc...
    
  }
}
