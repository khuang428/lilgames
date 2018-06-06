class Enemy {
  // health or hits
 int health; 
  
  Enemy(int h) {
    health = h;
  }
  
  void alive() {
    if (health > 0) { // bullet hits it because it touches the box
      for(int i = 0; i < bs.size(); i++) {
        if (bs.get(i).xCor >= 100 && bs.get(i).xCor <= 120 && bs.get(i).yCor >= 80 && bs.get(i).yCor <= 100) { // can change this to variables and add the size 
          health = health-1;
        }
      }
    }
    //if (health == 0) {
      //alive = false;
    //}
  }
    
}
