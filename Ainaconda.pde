Snake test;
Snakefood snakefood;
boolean isFood = false;
int starting_snake_size = 5;
float globalMutationRate = 0.02;





void setup() {
  size(800, 800); //size of the window
  frameRate(10);//increase this to make the game go faster
  test = new Snake(starting_snake_size);//create a new snake 
  snakefood = new Snakefood();  //
  snakefood.addfood(); //starting tidbit

} //<>//


void draw() { 
  background(255);
  snakefood.show();
  test.move();
  test.show();
}
