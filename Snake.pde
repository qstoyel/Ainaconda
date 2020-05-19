class Snake {
  ArrayList<PVector> pos;
  PVector vel;
  PVector tmp;
  
  int snake_size;
  
  boolean alive  = true;
  
  Snake() {
    snake_size = 5;
    pos = new ArrayList<PVector>();
    for (int i = 0; i < snake_size; i ++) {
      pos.add(new PVector(width/2 + 10*i, height/2 + 10*i));
    }
    vel = new PVector (10,0);
  }
  //-------------------------------------------------------
  void move() {
    if (alive) {
      for (int i = snake_size - 1; i > 0; i--) {
        //need tmp variable for this to work
        tmp = new PVector(pos.get(i-1).x, pos.get(i-1).y);
        pos.set(i, tmp);
      }
      pos.set(0, pos.get(0).add(vel));
    }
  }
  //-------------------------------------------------------
  
  void show(){
    for (int i = 0; i < snake_size; i ++){
      fill(0);
      square(pos.get(i).x, pos.get(i).y, 10);
    }
  }
  
  
  
  
  
  

  
}
