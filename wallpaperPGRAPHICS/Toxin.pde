class Toxins {

  String chemicals;
  float release;
  int isMetal;
  int isCarcinogen;
  int industry;


  void fromCSV(String[] input) {
    //221112  HYDROCHLORIC ACID YES  NO  NO  Pounds  66435  66435  0  66435
    
    chemicals = input[1];
    release = float (input[9]);
    isMetal = int (input[3]);
    isCarcinogen = int (input[4]);
    industry = int (input[0]);
    
  }
}

