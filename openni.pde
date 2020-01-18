class Sensor {
 
  int value;
  int state; // indique état actuel du projet
  int prevState; // indique état antérieur pour le changement d'état
  float maxValue; // distance maximum 
  int zone;
  int nbRand;
  int nbRand2;
  int nbRand3;
  int nbRand4;
  int nbRand5;
  
  Sensor() {
      value = 0;
      state = 1;
      prevState = -1;
      maxValue = 2500; // la distance la plus loin détectée est 2,50 m
      zone = 0;
      nbRand = int(random(0, 3));
      nbRand2 = int(random(4, 7));
      nbRand3 = int(random(8, 12));
      nbRand4 = int(random(13, 16));
      nbRand5 = int(random(17, 21));
  }  
  
  
  void update() {
    
      context.update(); // permet de récupérer des infos récentes depuis la kinect
      
        /*int nbRand = int(random(0, 3));
        println(nbRand);
        int nbRand2 = int(random(4, 7));
        println(nbRand2);
        int nbRand3 = int(random(8, 12));
        println(nbRand3);
        int nbRand4 = int(random(13, 16));
        println(nbRand4);
        int nbRand5 = int(random(17, 21));
        println(nbRand5);*/
        tabSons[nbRand].pause();
        tabSons[nbRand2].pause();
        tabSons[nbRand3].pause();
        tabSons[nbRand4].pause();
        tabSons[nbRand5].pause();
      
      // zone 2
      if (com3d.z <= 1500 && com3d.z >= 500 && com3d.x >= -1500 && com3d.x <= -750) {
        zone = 2;
        counter[0] = 0;
        counter[0] = (counter[0] +1) % 300; // on incrémente le compteur et il revient à 0 quand il est égal à 300
        image(images[0], width/2-img.width/2, height/2-img.height/2);
        tabSons[nbRand].play();
        tabSons[nbRand2].pause();
        tabSons[nbRand3].pause();
        tabSons[nbRand4].pause();
        tabSons[nbRand5].pause();
        println("zone 2");
        println(nbRand);
        if(counter[0] == 150){
          nbRand = int(random(0,3));
          tabSons[nbRand].play();
        }
      }
      
      // zone 3 
      if (com3d.z <= 1500 && com3d.z >= 500 && com3d.x >= -750 && com3d.x <= 0) {
        zone = 3;
        counter[1] = 0;
        counter[1] = (counter[1] +1) % 300; // on incrémente le compteur et il revient à 0 quand il est égal à 300
        image(images[1], width/2-img.width/2, height/2-img.height/2);
        tabSons[nbRand2].play();
        tabSons[nbRand].pause();
        tabSons[nbRand3].pause();
        tabSons[nbRand4].pause();
        tabSons[nbRand5].pause();
        println("zone 3");
        println(nbRand2);
        if(counter[1] == 150){
          nbRand2 = int(random(4,7));
          tabSons[nbRand2].play();
        }
      }
      
      // zone 4   
      if (com3d.z <= 1500 && com3d.z >= 500 && com3d.x >= 0 && com3d.x <= 750) {
        zone = 4;
        counter[2] = 0;
        counter[2] = (counter[2] +1) % 300; // on incrémente le compteur et il revient à 0 quand il est égal à 300
        image(images[2], width/2-img.width/2, height/2-img.height/2);
        tabSons[nbRand3].play();
        tabSons[nbRand].pause();
        tabSons[nbRand2].pause();
        tabSons[nbRand4].pause();
        tabSons[nbRand5].pause();
        println("zone 4");
        println(nbRand3);
        if(counter[2] == 150){
          nbRand3 = int(random(4,7));
          tabSons[nbRand3].play();
        }
      }
      
      // zone 5
      if (com3d.z <= 1500 && com3d.z >= 500 && com3d.x >= 750 && com3d.x <= 1500) {
        zone = 5;
        counter[3] = 0;
        counter[3] = (counter[3] +1) % 300; // on incrémente le compteur et il revient à 0 quand il est égal à 300
        image(images[3], width/2-img.width/2, height/2-img.height/2);
        tabSons[nbRand4].play();
        tabSons[nbRand].pause();
        tabSons[nbRand2].pause();
        tabSons[nbRand3].pause();
        tabSons[nbRand5].pause();
        println("zone 5");
        println(nbRand4);
        if(counter[3] == 150){
          nbRand4 = int(random(4,7));
          tabSons[nbRand4].play();
        }
      }
      
      // zone 6
      if (com3d.z <= 2500  && com3d.z >= 1500 && com3d.x >= 750 && com3d.x <= 1500) {
        zone = 6;
        counter[4] = 0;
        counter[4] = (counter[4] +1) % 300; // on incrémente le compteur et il revient à 0 quand il est égal à 300
        image(images[4], width/2-img.width/2, height/2-img.height/2);
        tabSons[nbRand5].play();
        tabSons[nbRand].pause();
        tabSons[nbRand2].pause();
        tabSons[nbRand3].pause();
        tabSons[nbRand4].pause();
        println("zone 6");
        println(nbRand5);
        if(counter[4] == 150){
          nbRand5 = int(random(4,7));
          tabSons[nbRand5].play();
        }
      }
      
      // zone inactive
      if (com3d.z <= 2500  && com3d.z >= 1500 && com3d.x >= -1500 && com3d.x <= 750) {
        println("zone inactive");
      }
       
      prevState = state; // actualiser l'etape precedente  L'état anterieur devient l'etat actuel comme ça on peut passe de l'etat 1 à 2 mais aussi de 2 à 1, etc...
    
  }
}
