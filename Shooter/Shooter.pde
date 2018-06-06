int dirX = 0;
int dirY = 0;
float x = 250, y = 440, speed = 2,cooldown = 0;
ArrayList<Bullet>bs = new ArrayList();

void setup(){
  size(500,500);
  smooth();
  noStroke();
}

void draw(){
  background(0);
  x += speed * dirX;
  y += speed * dirY;
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
  fill(#ffffff);
  rect(x,y,20,20);
  for(Bullet b:bs){
    triangle(b.xCor,b.yCor,b.xCor - 3, b.yCor + 3, b.xCor + 3, b.yCor + 3);
    b.move();
  }
  if(cooldown > 0){
    cooldown--;
  }
}

void keyPressed(){
  if(keyCode == LEFT || keyCode == 'A'){
    dirX = -1;
  }
  if(keyCode == RIGHT || keyCode == 'D'){
    dirX = 1;
  }
  if(keyCode == UP || keyCode == 'W'){
    dirY = -1;
  }
  if(keyCode == DOWN || keyCode == 'S'){
    dirY = 1;
  }
  if(keyCode == ' ' && cooldown == 0){
    bs.add(new Bullet(x+10,y));
    cooldown = 10;
  }
}

void keyReleased(){
  if(keyCode == LEFT || keyCode == RIGHT || keyCode == 'A' || keyCode == 'D'){
    dirX = 0;
  }
  if(keyCode == UP || keyCode == DOWN || keyCode == 'W' || keyCode == 'S'){
    dirY = 0;
  }
}
