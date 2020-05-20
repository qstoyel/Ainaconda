class NeuralNet {
 PVector outputThought;
 
  int iNodes;//No. of input nodes
  int hNodes;//No. of hidden nodes
  int oNodes;//No. of output nodes

  Matrix whi;//matrix containing weights between the input nodes and the hidden nodes
  Matrix whh;//matrix containing weights between the hidden nodes and the second layer hidden nodes
  Matrix woh;//matrix containing weights between the second hidden layer nodes and the output nodes

  
  
  NeuralNet(int inputs, int outputNo, int hiddenNo){
        //set dimensions from parameters
    iNodes = inputs;
    oNodes = outputNo;
    hNodes = hiddenNo;


    //create first layer weights 
    //included bias weight
    whi = new Matrix(hNodes, iNodes +1);

    //create second layer weights
    //include bias weight
    whh = new Matrix(hNodes, hNodes +1);

    //create second layer weights
    //include bias weight
    woh = new Matrix(oNodes, hNodes +1);  

    //set the matricies to random values
    whi.randomize();
    whh.randomize(); 
    woh.randomize();
  }
  
  
  //--------------------------
  
  PVector think(int[] eyes) {
    outputThought = new PVector(10,0);
    return outputThought; 
  }
  
  
  //-----------------------------------------
  
  NeuralNet clone() {
    NeuralNet clone = new NeuralNet(8, 9, 1);
    return clone;
  }
  //----------------------------------------
  
  void mutate(float mr) {
    //mutates each weight matrix
    whi.mutate(mr);
    whh.mutate(mr);
    woh.mutate(mr);
  }
  
}
