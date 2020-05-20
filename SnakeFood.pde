class Snakefood {
  PVector food_pos;
  boolean is_food = false;

  Snakefood() {
    food_pos = new PVector(random(width), random(height)); 
    is_food = true;
  }
  //----------------------------
  void addfood(){
    food_pos = new PVector(round(random((width-20)/10))*10, random(round((height-20)/10))*10); 
  }
  
  //----------------------------------
  void show(){
    fill(255,0,0);
    square(food_pos.x, food_pos.y, 10);
  }
}
