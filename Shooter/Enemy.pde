class Enemy {
 int health, timer;
 int size = 20;
 float y, x;
 PImage img;
  
  Enemy(int h, float x, float y, int scale,PImage i) {
    health = h;
    this.x = x;
    this.y = y;
    size = size*scale;
    img = i;
  }
  
  void pathLine() {
    y += 1.1;
  }
  
  void pathCurved() {
    y += 1;
    //if() {
      //x += 1;
    //} else {
     // -= 1;
   //}
    
  }
  
  
  void alive() {
    if (health > 0) { // bullet hits it because it touches the box
      for(int i = 0; i < bs.size(); i++) {
        if (bs.get(i).xCor >= x && bs.get(i).xCor <= x+size && bs.get(i).yCor >= y-size && bs.get(i).yCor <= y) {
          bs.remove(i);
          health -= 1;
          timer = 3;
        }
      }
    }
  }
  
  
}

//enemy types
//hit change color...
//path
