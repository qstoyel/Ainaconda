class Snake {
  ArrayList<PVector> pos;
  PVector vel;
  PVector tmp;
  int snake_size;
  
  int[] eyes;
  
  boolean alive  = true;
  
  Snake(int starting_snake_size) {
    snake_size = starting_snake_size;
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
    if (!inbox(pos.get(0))) {
      alive = false;
    }
    //death by snake
    for (int i = 1; i < snake_size; i ++) {
     if (pos.get(0).x == pos.get(i).x && pos.get(0).y == pos.get(i).y){
       alive = false;
     }
    }
    //food time?
    if (dist(pos.get(0).x, pos.get(0).y,  snakefood.food_pos.x, snakefood.food_pos.y) <5) { //<>//
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
      square(pos.get(i).x, pos.get(i).y, 10);
      look();
      println("eyes: " + eyes[0]);
      
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
  
  //---------------------------------------------------------
  
  void look() {
    eyes = new int[8];
    PVector headpos;
    headpos = new PVector(pos.get(0).x , pos.get(0).y);
    PVector direction;
    for (int i = 0; i< eyes.length; i++) {
      direction = PVector.fromAngle(i*(PI/4));
      direction.mult(10);
      eyes[i] = lookInDirection(headpos, direction);
    }
  }
  
  int lookInDirection  (PVector position, PVector direction) {
    int distance = 0;
    while (inbox(position)) {
      position.add(direction);
      distance ++;
      // check all squares along direction out to the walls
      if (dist(position.x, position.y,  snakefood.food_pos.x, snakefood.food_pos.y) < 5){
        //see snakefood?
        return distance;
      }
      for(int i = 1; i < snake_size; i ++) {
        if (dist(position.x, position.y,  pos.get(i).x, pos.get(i).y) < 5){
          //see snake body?
          return distance;
        }
      }
    }    
    return distance;
  }
  
  boolean inbox(PVector pos) {
    // is a position inside the field of play?
    if (pos.x < height || pos.x > 0 || pos.y > 0 || pos.y < height) {
      return true;
    }
    else {
      return false;
    }
  }
  
  
}
