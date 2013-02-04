class ChemicalBin implements Comparable{
  
  String chemical;
  ArrayList<ChemicalObject> chemicalList = new ArrayList();
  
  color col;
  
  int compareTo(Object o) {
    int r = chemicalList.size() - ((ChemicalBin) o).chemicalList.size();
    return(r);
  }
}

