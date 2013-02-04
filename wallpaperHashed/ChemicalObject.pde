class ChemicalObject {

  String chemicals;
  float release;
  int isCleanAct;
  int isMetal;
  int isCarcinogen;
//int industry;

  PVector position = new PVector();
  PVector targetPosition = new PVector();


  void fromCSV(String[] input) {
    //221112  HYDROCHLORIC ACID YES  NO  NO  Pounds  66435  66435  0  66435

    chemicals = input[1];
    release = float (input[9]);
    isCleanAct = int (input[2]);
    isMetal = int (input[3]);
    isCarcinogen = int (input[4]);
//industry = int (input[0]);
    
    //println(chemicals);
  }

  void update() {
    position.lerp(targetPosition, 0.1);

    //Just for fun
    //if (random(100) < 0.1) targetPosition = new PVector(random(width), random(height));
  }

  void render() {
    pushMatrix();
    translate(position.x, position.y);
    fill(0);
    text(chemicals, 0, 0);
    popMatrix();
  }
}

