float x = 250, y = 440, speed = 2.5,cooldown = 0;
ArrayList<Bullet>bs = new ArrayList();
ArrayList<Enemy>es = new ArrayList();
boolean LPressed, RPressed, UPressed, DPressed,SPressed;
PImage enImg1, enImg2, ship;

void setup(){
  size(500,500);
  smooth();
  noStroke();
  enImg1 = loadImage("Monoeyeart.png");
  enImg2 = loadImage("Monoeyeart1.png");
  ship = loadImage("ship.png");
  // testing shooting, test box
  Enemy test = new Enemy(5,100,100,1,enImg1);
  es.add(test);
}

void draw(){
  background(0);
  if(LPressed ^ RPressed){
    if(LPressed){
     x -= speed;
    }else{
      x += speed;
    }
  }
  if(UPressed ^ DPressed){
    if(UPressed){
     y -= speed;
    }else{
      y += speed;
    }
  }
  if(x > 480){
    x = 0;
  }else if(x < 0){
    x = 480;
  }
  if(y > 480){
    y = 480;
  }else if(y < 400){
    y = 400;
  }
  //fill(#ffffff);
  image(ship,x,y,20,20);
  for(int i = 0;i < bs.size();i++){
    Bullet b = bs.get(i);
    if(b.yCor < 0){
      bs.remove(b);
      i--;
    }
    triangle(b.xCor,b.yCor,b.xCor - 3, b.yCor + 3, b.xCor + 3, b.yCor + 3);
    b.move();
  }
  if(SPressed &&  cooldown == 0){
      bs.add(new Bullet(x+10,y));
      cooldown = 10;
   }
  if(cooldown > 0){
    cooldown--;
  }
  
  
  for(int i = 0; i < es.size(); i++) {
    Enemy e = es.get(i);
    e.alive();
    if(e.health>0) {
      image(e.img, e.x, e.y, e.size, e.size);
      //e.pathLine();
      //e.pathCurved();
    }
    
    if(e.y > 500){
      es.remove(e);
      i--;
    }
    
    if(e.timer > 0) {
      e.img = enImg2;
      e.timer--;
    } else {
      e.img = enImg1;
    }
    
    if (e.health == 0) {
      es.remove(e);
    }
  }
  
  
  
}

void keyPressed(){
  if(keyCode == LEFT || keyCode == 'A'){
    LPressed = true;
  }
  if(keyCode == RIGHT || keyCode == 'D'){
    RPressed = true;
  }
  if(keyCode == UP || keyCode == 'W'){
    UPressed = true;
  }
  if(keyCode == DOWN || keyCode == 'S'){
    DPressed = true;
  }
  if(keyCode == ' '){
    SPressed = true;
  }
}

void keyReleased(){
  if(keyCode == LEFT || keyCode == 'A'){
    LPressed = false;
  }
  if(keyCode == RIGHT || keyCode == 'D'){
    RPressed = false;
  }
  if(keyCode == UP || keyCode == 'W'){
    UPressed = false;
  }
  if(keyCode == DOWN || keyCode == 'S'){
    DPressed = false;
  }
  if(keyCode == ' '){
    SPressed = false;
  }
}
