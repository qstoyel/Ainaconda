class NeuralNet {
 PVector outputThought;
 
  int iNodes;//No. of input nodes
  int hNodes;//No. of hidden nodes
  int oNodes;//No. of output nodes

  Matrix whi;//matrix containing weights between the input nodes and the hidden nodes
  Matrix whh;//matrix containing weights between the hidden nodes and the second layer hidden nodes
  Matrix woh;//matrix containing weights between the second hidden layer nodes and the output nodes

  
  
  NeuralNet(){
    
  }
  
  
  //--------------------------
  
  PVector think(int[] eyes) {
    outputThought = new PVector(10,0);
    return outputThought; 
  }
  
  
  //-----------------------------------------
  
  NeuralNet clone() {
    NeuralNet clone = new NeuralNet();
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
