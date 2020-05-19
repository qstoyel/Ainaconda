Snake test;
boolean isFood = false;



void setup() {
  size(800, 800); //size of the window
  frameRate(2);//increase this to make the dots go faster
  test = new Snake();//create a new population with 1000 members
}


void draw() { 
  background(255);
  test.move(); //<>//
  test.show();
}
