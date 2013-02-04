class ChemicalObject {

  String chemicals;
  float release;
  int isCleanAct;
  int isMetal;
  int isCarcinogen;

  PVector position = new PVector();
  PVector targetPosition = new PVector();


  void fromCSV(String[] input) {
    //221112  HYDROCHLORIC ACID YES  NO  NO  Pounds  66435  66435  0  66435

    chemicals = input[1];
    release = float (input[9]);
    isCleanAct = int (input[2]);
    isMetal = int (input[3]);
    isCarcinogen = int (input[4]);

    //println(chemicals);
  }

/*
  void update() {
    position.lerp(targetPosition, 0.1);
  }

  void render() {
    canvas.pushMatrix();
    canvas.translate(position.x, position.y);
    canvas.fill(0);
    canvas.text(chemicals, 0, 0);
    canvas.popMatrix();
  }
  */
  
}


