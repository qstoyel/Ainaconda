class Population {
  Snake[] snakes;
  int generation;
  int bestSnakeNo;
  
  boolean allSnakesDead = false;
  
  
  Population(int popSize) {
    snakes = new Snake[popSize];
    for(int i = 0; i < popSize; i ++){
      snakes[i] = new Snake(starting_snake_size);
    }
  }
  
  //-----------------------------------------------------------------------------
  // need update, natural selection, fitness, selectBest, selectSnake,
  void update(){
    //move all living snakes
    allSnakesDead = true;
    for (int i =0, popSize = snakes.length; i < popSize; i ++){
      if (snakes[i].alive) {
        allSnakesDead = false;
        snakes[i].update();
      }
    }
    snakes[0].show();
    
    if (allSnakesDead) {
      
      naturalSelection();
    }
  }
  
  //--------------------------------------
  
  void naturalSelection() { //<>//
    calculateFitness();
    selectBest();
    Snake[] nextGen = new Snake[snakes.length];
    nextGen[0] = snakes[bestSnakeNo].clone();
    
    for (int i = 1, popSize = snakes.length; i < popSize; i ++) {
      nextGen[i] = selectSnake().clone(); //select snake picks random snake from old pop, weighted by fitness
     
      nextGen[i].mutate();
    }
    
    snakes = nextGen.clone();
    
  }

  
  
  //------------------------------------
  void calculateFitness() {
    for (int i =0, popSize = snakes.length; i < popSize; i ++) {
      snakes[i].calculateFitness() ;
    }
  }
  
  //---------------------------------------------------
  
  Snake selectSnake() {
    float fitnessSum = 0;
    float rollingSum = 0;
    for (int i =0, popSize = snakes.length; i < popSize; i ++) {
      fitnessSum += snakes[i].fitness;
    }
    float selector = random(fitnessSum);
    for (int i =0, popSize = snakes.length; i < popSize; i ++) {
      rollingSum += snakes[i].fitness;
      if (selector < rollingSum) {
        return snakes[i];
      } 
    }
    return snakes[0]; //to keep things happy, but should never get here
  }
    
   //----------------------------------------------------
  void selectBest() {
    float maxFitness = 0;
    bestSnakeNo = 0;
    for (int i =0, popSize = snakes.length; i < popSize; i ++) {
      if(snakes[i].fitness > maxFitness){
        maxFitness = snakes[i].fitness;
        bestSnakeNo  = i;
      }
    }
   
  }
  
  
}
