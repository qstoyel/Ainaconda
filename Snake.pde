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
      getdir();
      for (int i = snake_size - 1; i > 0; i--) {
        //need tmp variable for this to work
        tmp = new PVector(pos.get(i-1).x, pos.get(i-1).y);
        pos.set(i, tmp);
      }
      pos.set(0, pos.get(0).add(vel));
    }
    //death by walls
    if (pos.get(0).x > height || pos.get(0).x < 0 || pos.get(0).y < 0 || pos.get(0).y > height) {
      alive = false;
    }
    //death by snake
    for (int i = 1; i < snake_size; i ++) {
     if (pos.get(0).x == pos.get(i).x && pos.get(0).y == pos.get(i).y){
       alive = false;
     }
    }
    //food time?
    if (abs(pos.get(0).x - snakefood.food_pos.x) <2  && abs(pos.get(0).y - snakefood.food_pos.y) <2) { //<>//
      eat();
    }
    //PVector holder = pos.get(0);
    //println("Head at: " + holder);
  } //<>//
  //-------------------------------------------------------
  
  void show(){
    for (int i = 0; i < snake_size; i ++){
      fill(0);
      if (i ==0){
        fill(0,255,0);
      }
      square(pos.get(i).x, pos.get(i).y, 8);
    }
  }
  
  
  //---------------------------------------------------------
  void eat(){
   snake_size ++;
   //add tail offscreen that will get added on next step
   pos.add(new PVector(-10,-10));
   snakefood.addfood();
   
  }
  
  //---------------------------------------------------------
  void getdir() {
    if (keyPressed) {
      if (key == 'a') {
        vel = new PVector(-10,0) ;
      }
      if (key == 'w') {
        vel = new PVector(0,-10) ;
      }
      if (key == 's') {
        vel = new PVector(0,10) ;
      }
      if (key == 'd') {
        vel = new PVector(10,0) ;
      }
    } 
  }
  
}
