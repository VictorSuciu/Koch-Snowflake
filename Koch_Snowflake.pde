

void setup() {
  int depth = 6;
  //int[] sequence = new int[3 * (int)pow(4, depth-1)];
  ArrayList<Boolean> sequence = generateSequence(depth);
  
  background(10);
  size(1200, 850);
  
  stroke(255);
  strokeWeight(2);
  
  int sideLen = 5000/(depth*depth*depth*depth);
  double[] currPoint = {80, 640};
  double[] prevPoint = {80 - sideLen, 640};
  double[] vector = {currPoint[0] - prevPoint[0], currPoint[1] - prevPoint[1]};
  
  for(int i = 0; i < sequence.size(); i++) {
    if(i == 0) {
      stroke(255, 0, 0);
    }
    else if(i == 1) {
      stroke(0, 255, 0);
    }
    else {
      stroke(255);
    }
    vector = transform(vector, sequence.get(i) ? (PI/3) : (-2*PI/3));
    line((int)currPoint[0], (int)currPoint[1], 
         (int)(currPoint[0] + vector[0]), (int)(currPoint[1] + vector[1]));
    
    prevPoint[0] = currPoint[0];
    prevPoint[1] = currPoint[1];
    
    currPoint[0] += vector[0];
    currPoint[1] += vector[1];
    
    vector[0] = currPoint[0] - prevPoint[0];
    vector[1] = currPoint[1] - prevPoint[1];
  }
}

double[] transform(double[] vector, float theta) {
  double[] newVector = {vector[0]*cos(theta) + vector[1]*(-sin(theta)),
                        vector[0]*sin(theta) + vector[1]*cos(theta)};
  return newVector;
}

ArrayList<Boolean> generateSequence(int depth) {
  ArrayList<Boolean> sequence = new ArrayList();
  for(int i = 0; i < 3; i++) {
    sequence.add(false);
  }
  for(int i = 0; i < depth - 1; i++) {
    for(int k = sequence.size() - 1; k >= 0; k--) {
      sequence.add(k, true);
      sequence.add(k, false);
      sequence.add(k, true);
    }
  }
  for(int i = 0; i < sequence.size(); i++) {
    print(sequence.get(i) ? "1" : "0");  
  }
  return sequence;
}
  
void draw() {
  
}
