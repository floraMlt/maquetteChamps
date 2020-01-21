class DreamState {
  int valueD;
  int stateD; // indique état actuel du projet
  int prevStateD; // indique état antérieur pour le changement d'état
  float maxValueD; // distance maximum 
  int zoneD;
  int nbRandD[];
  int prevNbRandD[];
  
  DreamState() {
      valueD = 0;
      stateD = 1;
      prevStateD = -1;
      maxValueD = 3000; // la distance la plus loin détectée est 3 m
      zoneD = 0;
      nbRandD = new int[5];
      nbRandD[0] = int(random(0, 1));
      nbRandD[1] = int(random(2, 4));
      nbRandD[2] = int(random(5, 7));
      nbRandD[3] = int(random(8, 9));
      nbRandD[4] = 10;
      prevNbRandD = new int[5];
      prevNbRandD[0] = nbRandD[0];
      prevNbRandD[1] = nbRandD[1];
      prevNbRandD[2] = nbRandD[2];
      prevNbRandD[3] = nbRandD[3];
  }  
  
  
  void updateD() {
    
      context.update(); // permet de récupérer des infos récentes depuis la kinect
  
      // zone 2
      if (com3d.z <= 1933 && com3d.z >= 1000 && com3d.x >= -1400 && com3d.x <= -583) {
        zoneD = 2;
        counter[0] = (counter[0] +1) % 475; // on incrémente le compteur et il revient à 0 quand il est égal à 300
        image(imagesMixees[0], width/2-imagesMixees[0].width/2, height/2-imagesMixees[0].height/2);
        //tabSonsMixes[nbRandD[0]].loop();
        tabSonsMixes[nbRandD[0]].play();
        tabSonsMixes[nbRandD[1]].pause();
        tabSonsMixes[nbRandD[2]].pause();
        tabSonsMixes[nbRandD[3]].pause();
        tabSonsMixes[10].pause();
        println("zone 2");
        println(nbRandD[0]);
        println("counter 2 "+counter[0]);
        if(counter[0] == 474){
          //counter[0] = 0;
          //counter[0] = (counter[0] +1) % 300;
          prevNbRandD[0] = nbRandD[0];
          nbRandD[0] = int(random(0,1));
          tabSonsMixes[prevNbRandD[0]].pause();
          tabSonsMixes[nbRandD[0]].loop();
          tabSonsMixes[nbRandD[0]].play();
        }
      }
      
      // zone 3 
      if (com3d.z <= 1933 && com3d.z >= 1000 && com3d.x >= -583 && com3d.x <= -97) {
        zoneD = 3;
        counter[1] = (counter[1] +1) % 475; // on incrémente le compteur et il revient à 0 quand il est égal à 300
        image(imagesMixees[1], width/2-imagesMixees[1].width/2, height/2-imagesMixees[1].height/2);
        //tabSonsMixes[nbRandD[1]].loop();
        tabSonsMixes[nbRandD[1]].play();
        tabSonsMixes[nbRandD[0]].pause();
        tabSonsMixes[nbRandD[2]].pause();
        tabSonsMixes[nbRandD[3]].pause();
        tabSonsMixes[10].pause();
        println("zone 3");
        println(nbRandD[1]);
        println("counter 3 "+counter[1]);
        if(counter[1] == 474){
          //counter[1] = 0;
          //counter[1] = (counter[1] +1) % 300;
          prevNbRandD[1] = nbRandD[1];
          nbRandD[1] = int(random(2,4));
          tabSonsMixes[prevNbRandD[1]].pause();
          tabSonsMixes[nbRandD[1]].loop();
          tabSonsMixes[nbRandD[1]].play();
        }
      }
      
      // zone 4   
      if (com3d.z <= 1933 && com3d.z >= 1000 && com3d.x >= -97 && com3d.x <= 525) {
        zoneD = 4;
        counter[2] = (counter[2] +1) % 475; // on incrémente le compteur et il revient à 0 quand il est égal à 300
        image(imagesMixees[2], width/2-imagesMixees[2].width/2, height/2-imagesMixees[2].height/2);
        //tabSonsMixes[nbRandD[2]].loop();
        tabSonsMixes[nbRandD[2]].play();
        tabSonsMixes[nbRandD[0]].pause();
        tabSonsMixes[nbRandD[1]].pause();
        tabSonsMixes[nbRandD[3]].pause();
        tabSonsMixes[10].pause();
        println("zone 4");
        println(nbRandD[2]);
        println("counter 4 "+counter[2]);
        if(counter[2] == 474){
          //counter[2] = 0;
          counter[2] = (counter[2] +1) % 300;
          prevNbRandD[2] = nbRandD[2];
          nbRandD[2] = int(random(5, 7));
          tabSonsMixes[prevNbRandD[2]].pause();
          tabSonsMixes[nbRandD[2]].loop();
          tabSonsMixes[nbRandD[2]].play();
        }
      }
      
      // zone 5
      if (com3d.z <= 1933 && com3d.z >= 1000 && com3d.x >= 525 && com3d.x <= 1400) {
        zoneD = 5;
        //counter[3] = 0;
        counter[3] = (counter[3] +1)% 475; // on incrémente le compteur et il revient à 0 quand il est égal à 300
        image(imagesMixees[3], width/2-imagesMixees[3].width/2, height/2-imagesMixees[3].height/2);
        //tabSonsMixes[nbRandD[3]].loop();
        tabSonsMixes[nbRandD[3]].play();
        tabSonsMixes[nbRandD[0]].pause();
        tabSonsMixes[nbRandD[1]].pause();
        tabSonsMixes[nbRandD[2]].pause();
        tabSonsMixes[10].pause();
        println("zone 5");
        println(nbRandD[3]);
        println("counter 5 "+counter[3]);
        if(counter[3] == 474){
          //counter[3] = 0;
          //counter[3] = (counter[3] +1) % 300;
          prevNbRandD[3] = nbRandD[3];
          nbRandD[3] = int(random(8, 9));
          tabSonsMixes[prevNbRandD[3]].pause();
          tabSonsMixes[nbRandD[3]].loop();
          tabSonsMixes[nbRandD[3]].play();
        }
      }
      
      // zone 6
      if (com3d.z <= 2867  && com3d.z >= 1933 && com3d.x >= -97 && com3d.x <= 1400) {
        zoneD = 6;
        counter[4] = 0;
        counter[4] = (counter[4] +1) % 475; // on incrémente le compteur et il revient à 0 quand il est égal à 300
        image(imagesMixees[4], width/2-imagesMixees[4].width/2, height/2-imagesMixees[4].height/2);
        //tabSonsMixes[10].loop();
        tabSonsMixes[10].play();
        //tabSonsMixes[10].loop();
        tabSonsMixes[nbRandD[0]].pause();
        tabSonsMixes[nbRandD[1]].pause();
        tabSonsMixes[nbRandD[2]].pause();
        tabSonsMixes[nbRandD[3]].pause();
        println("zone 6");
        println(nbRandD[4]);
        println("counter 5 "+counter[4]);
        if(counter[4] == 474){
          tabSonsMixes[nbRandD[4]].pause();
          tabSonsMixes[nbRandD[4]].loop();
          tabSonsMixes[nbRandD[4]].play();
        }
      }
      
      // zone inactive
      if (com3d.z <= 2867  && com3d.z >= 1933 && com3d.x >= -1400 && com3d.x <= -97) {
        println("zone inactive");
      }
       
      prevStateD = stateD; // actualiser l'etape precedente  L'état anterieur devient l'etat actuel comme ça on peut passe de l'etat 1 à 2 mais aussi de 2 à 1, etc...
    
  } 
}
