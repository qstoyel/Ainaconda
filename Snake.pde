class Snake {
  PVector[] pos;
  PVector vel;
  
  int snake_size;
  
  Snake() {
    pos = new PVector[height/10*width/10];
    snake_size = 5;
    for (int i = 0; i < snake_size; i ++) {
      pos[i] = new PVector(width/2 + 10*i, height/2 + 10*i);
    }
    vel = new PVector (10,0);
  }
  //-------------------------------------------------------
  void move() {
    for (int i = 0; i < snake_size; i ++) {
      pos[snake_size - i] = pos[snake_size - i - 1];
    }
    pos[4] = pos[3];
    pos[3] = pos[2];
    pos[2] = pos[1];
    pos[1] = pos[0];
    pos[0] = pos[0].add(vel);
  }
  //-------------------------------------------------------
  
  void show(){
    for (int i = 0; i < snake_size; i ++){
      fill(0);
      square(pos[i].x, pos[i].y, 10);
    }
  }
  
  
  
  
  
  
}
