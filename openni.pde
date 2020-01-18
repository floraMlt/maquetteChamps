class Sensor {
 
  int value;
  int state; // indique état actuel du projet
  int prevState; // indique état antérieur pour le changement d'état
  float maxValue; // distance maximum 
  int zone;
  /*int nbRand;
  int nbRand2;
  int nbRand3;
  int nbRand4;
  int nbRand5;*/
  int nbRand[];
  int prevNbRand[];
  
  Sensor() {
      value = 0;
      state = 1;
      prevState = -1;
      maxValue = 2500; // la distance la plus loin détectée est 2,50 m
      zone = 0;
      /*nbRand = int(random(0, 3));
      nbRand2 = int(random(4, 7));
      nbRand3 = int(random(8, 12));
      nbRand4 = int(random(13, 16));
      nbRand5 = int(random(17, 21));*/
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
      
        /*int nbRand = int(random(0, 3));
        println(nbRand);
        int nbRand2 = int(random(4, 7));
        println(nbRand2);
        int nbRand3 = int(random(8, 12));
        println(nbRand3);
        int nbRand4 = int(random(13, 16));
        println(nbRand4);
        int nbRand5 = int(random(17, 21));
        println(nbRand5);
        */
      
      // zone 2
      if (com3d.z <= 1500 && com3d.z >= 500 && com3d.x >= -1500 && com3d.x <= -750) {
        zone = 2;
        counter[0] = (counter[0] +1) % 500; // on incrémente le compteur et il revient à 0 quand il est égal à 300
        image(images[0], width/2-img.width/2, height/2-img.height/2);
        tabSons[nbRand[0]].play();
        tabSons[nbRand[1]].pause();
        tabSons[nbRand[2]].pause();
        tabSons[nbRand[3]].pause();
        tabSons[nbRand[4]].pause();
        println("zone 2");
        println(nbRand[0]);
        println("counter 2 "+counter[0]);
        if(counter[0] == 250){
          //counter[0] = 0;
          //counter[0] = (counter[0] +1) % 300;
          prevNbRand[0] = nbRand[0];
          nbRand[0] = int(random(0,3));
          tabSons[prevNbRand[0]].pause();
          //tabSons[nbRand[0]].play();
        }else if(counter[0] > 250){
            tabSons[nbRand[0]].play();
            println("joue le son 2 "+nbRand[0]);
        }
      }
      
      // zone 3 
      if (com3d.z <= 1500 && com3d.z >= 500 && com3d.x >= -750 && com3d.x <= 0) {
        zone = 3;
        counter[1] = (counter[1] +1) % 500; // on incrémente le compteur et il revient à 0 quand il est égal à 300
        image(images[1], width/2-img.width/2, height/2-img.height/2);
        tabSons[nbRand[1]].play();
        tabSons[nbRand[0]].pause();
        tabSons[nbRand[2]].pause();
        tabSons[nbRand[3]].pause();
        tabSons[nbRand[4]].pause();
        println("zone 3");
        println(nbRand[1]);
        println("counter 3 "+counter[1]);
        if(counter[1] == 250){
          //counter[1] = 0;
          //counter[1] = (counter[1] +1) % 300;
          prevNbRand[1] = nbRand[1];
          nbRand[1] = int(random(4,7));
          tabSons[prevNbRand[1]].pause();
        }else if(counter[1] > 250){
            tabSons[nbRand[1]].play();
            println("joue le son 3 "+nbRand[1]);
        }
      }
      
      // zone 4   
      if (com3d.z <= 1500 && com3d.z >= 500 && com3d.x >= 0 && com3d.x <= 750) {
        zone = 4;
        counter[2] = (counter[2] +1) % 500; // on incrémente le compteur et il revient à 0 quand il est égal à 300
        image(images[2], width/2-img.width/2, height/2-img.height/2);
        tabSons[nbRand[2]].play();
        tabSons[nbRand[0]].pause();
        tabSons[nbRand[1]].pause();
        tabSons[nbRand[3]].pause();
        tabSons[nbRand[4]].pause();
        println("zone 4");
        println(nbRand[2]);
        println("counter 4 "+counter[2]);
        if(counter[2] == 250){
          //counter[2] = 0;
          counter[2] = (counter[2] +1) % 300;
          prevNbRand[2] = nbRand[2];
          nbRand[2] = int(random(4,7));
          tabSons[prevNbRand[2]].pause();
          //tabSons[nbRand[2]].play();
        }else if(counter[2] > 250){
            tabSons[nbRand[2]].play();
            println("joue le son 4 "+nbRand[2]);
        }
      }
      
      // zone 5
      if (com3d.z <= 1500 && com3d.z >= 500 && com3d.x >= 750 && com3d.x <= 1500) {
        zone = 5;
        counter[3] = 0;
        counter[3] = (counter[3] +1) % 500; // on incrémente le compteur et il revient à 0 quand il est égal à 300
        image(images[3], width/2-img.width/2, height/2-img.height/2);
        tabSons[nbRand[3]].play();
        tabSons[nbRand[0]].pause();
        tabSons[nbRand[1]].pause();
        tabSons[nbRand[2]].pause();
        tabSons[nbRand[4]].pause();
        println("zone 5");
        println(nbRand[3]);
        println("counter 5 "+counter[3]);
        if(counter[3] == 250){
          //counter[3] = 0;
          //counter[3] = (counter[3] +1) % 300;
          prevNbRand[3] = nbRand[3];
          nbRand[3] = int(random(4,7));
          tabSons[prevNbRand[3]].pause();
         // tabSons[nbRand[3]].play();
        }else if(counter[3] > 250){
            tabSons[nbRand[3]].play();
            println("joue le son 5 "+nbRand[3]);
        }
      }
      
      // zone 6
      if (com3d.z <= 2500  && com3d.z >= 1500 && com3d.x >= 750 && com3d.x <= 1500) {
        zone = 6;
        counter[4] = (counter[4] +1) % 500; // on incrémente le compteur et il revient à 0 quand il est égal à 300
        image(images[4], width/2-img.width/2, height/2-img.height/2);
        tabSons[nbRand[4]].play();
        tabSons[nbRand[0]].pause();
        tabSons[nbRand[1]].pause();
        tabSons[nbRand[2]].pause();
        tabSons[nbRand[3]].pause();
        println("zone 6");
        println(nbRand[4]);
        println("counter 6 "+ counter[4]);
        if(counter[4] == 250){
          //counter[4] = 0;
          //counter[4] = (counter[4] +1) % 300;
          prevNbRand[4] = nbRand[4];
          nbRand[4] = int(random(4,7));
          tabSons[prevNbRand[4]].pause();
          //tabSons[nbRand[4]].play();
        }else if(counter[4] > 250){
            tabSons[nbRand[4]].play();
            println("joue le son 6 "+nbRand[4]);
        }
      }
      
      // zone inactive
      if (com3d.z <= 2500  && com3d.z >= 1500 && com3d.x >= -1500 && com3d.x <= 750) {
        println("zone inactive");
      }
       
      prevState = state; // actualiser l'etape precedente  L'état anterieur devient l'etat actuel comme ça on peut passe de l'etat 1 à 2 mais aussi de 2 à 1, etc...
    
  }
}
