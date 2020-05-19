class Snakefood {
  PVector food_pos;
  boolean is_food = false;

  Snakefood() {
    food_pos = new PVector(random(width), random(height)); 
    is_food = true;
  }
  //----------------------------
  void addfood(){
    food_pos = new PVector(random(width/10)*10, random(height/10)*10); 
  }
  
  //----------------------------------
  void show(){
    fill(255,0,0);
    square(food_pos.x, food_pos.y, 8);
  }
}
