class Bullet{
  float xCor, yCor;
  
  Bullet(float x,float y){
    xCor = x;
    yCor = y;
  }
  
  void move(){
    yCor -= 2;
  }
}
