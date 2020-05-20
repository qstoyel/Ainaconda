Population pop;
boolean isFood = false;
int starting_snake_size = 5;
float globalMutationRate = 0.02;

boolean humanPlayer = false;



void setup() {
  size(800, 800); //size of the window
  frameRate(10);//increase this to make the game go faster
  pop = new Population(10);//create a new population 
  

}


void draw() { 
  background(255);
  pop.update();
}
