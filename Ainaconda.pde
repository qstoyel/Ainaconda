Snake test;
Snakefood snakefood;
boolean isFood = false;



void setup() {
  size(800, 800); //size of the window
  frameRate(10);//increase this to make the dots go faster
  test = new Snake();//create a new snake 
  snakefood = new Snakefood();
  snakefood.addfood();

}
 //<>//

void draw() { 
  background(255);
  snakefood.show();
  test.move();
  test.show();
}
