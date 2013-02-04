class Toxins {

  String chemicals;
  float release;


  void fromCSV(String[] input) {
    //221112  HYDROCHLORIC ACID YES  NO  NO  Pounds  66435  66435  0  66435
    chemicals = input[1];
    release = float (input[7]);
  }
}

