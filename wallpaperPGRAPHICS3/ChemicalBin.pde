class ChemicalBin implements Comparable{
  
  String chemical;
  ArrayList<ChemicalObject> chemicalList = new ArrayList();
    
  int compareTo(Object o) {
    int r = chemicalList.size() - ((ChemicalBin) o).chemicalList.size();
    return(r);
  }
  
  
  
  
    float aggregateRelease() {
    float total = 0;
    for (int i=0; i < chemicalList.size(); i++) {
      ChemicalObject chem = chemicalList.get(i);
      float totalRelease = chem.release;

      total += totalRelease;    
    }
    return(total);
    //println(total);
  }
}

