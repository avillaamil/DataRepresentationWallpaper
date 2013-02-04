//ArrayList<Toxins> tox = new ArrayList();
ArrayList<ChemicalObject> chemicalList = new ArrayList();
ArrayList<ChemicalBin> binList = new ArrayList();
HashMap<String, ChemicalBin> binHash = new HashMap();

float fullWidth = 0;
PFont labelFont;

float scrollOffset;
float tscrollOffset;
float circleSize;


void setup() {
  size(850, 1300); 
  background(230);
  smooth(4);

  //Loading data using the function 
  loadData();
  Collections.sort(binList);
  Collections.reverse(binList);


  println(binList.size());
  //println(tx.chemicals);



  labelFont = createFont("Helvetica", 24);
  textFont(labelFont);
  textSize(12);
}

void draw() {
  background(230);

  /* Lining up all thec chemicals in order */
  tscrollOffset = -map(mouseX, 0, width, 0, fullWidth - width);
  scrollOffset = lerp(scrollOffset, tscrollOffset, 0.1);

  translate(scrollOffset, 0);
  for (ChemicalObject chem:chemicalList) {
    chem.update();
    chem.render();
  }


  /* Pulling out releases */

  //for (int i=0; i < binList.size(); i++) {
  //  ChemicalObject co = ChemicalObject.get(i);
  //  
  //
  //}

  countChemicals(); 
}






/*~~~~~~~~~~~LOADING FUNCTION~~~~~~~~~~~~~~*/
void loadData() {
  String[] rows =  loadStrings("DATACLEANED.csv");

  for (int i=1; i<rows.length; i++) {
    ChemicalObject tx = new ChemicalObject();
    tx.fromCSV(rows[i].split(","));
    // println (tx.chemicals );
    chemicalList.add(tx);

    String chem = tx.chemicals;
    //Sort into bins
    //Do I already have a bin that matches the chemical?
    if (binHash.containsKey(chem)) {
      //Yes, so use one off the shelf
      ChemicalBin bin = binHash.get(chem);
      bin.chemicalList.add(tx);
      //      tx.col = bin.col;
    } 
    else {
      //Nope! Better make a new bin!
      ChemicalBin bin = new ChemicalBin();
      bin.chemical = chem;
      //      bin.col = color(random(255), 255, 255);
      bin.chemicalList.add(tx);
      //Add it to the hashmap
      binHash.put(chem, bin);
      binList.add(bin);
      //      tx.col = bin.col;
    }
  }
}


void countChemicals() {
  for (int i = 0; i < binList.size(); i++) { //list of a list
    ChemicalBin bin = binList.get(i);    
    
    for (int j = 0; j < bin.chemicalList.size(); j++) { //list of chemicals 
      
      ChemicalObject chem = bin.chemicalList.get(j);
      if(chem.isMetal == 0) {
        fill(255,0,0);
      } else {
        fill(0, 255, 0);
      }
    ellipse (i*50, height/2, bin.chemicalList.size()/5,bin.chemicalList.size()/5); 
    println ("size: " + bin.chemicalList.size()); 
    }
  }
}


void sortByChemical() {
  float x = 0;
  for (int i = 0; i < binList.size(); i++) {
    ChemicalBin bin = binList.get(i);
    //float x = i * 40;
    for (int j = 0; j < bin.chemicalList.size(); j++) {
      ChemicalObject chem = bin.chemicalList.get(j);
      float y = height/2 - (j * 10);
      chem.targetPosition = new PVector(x, y);
    }
    x += textWidth(bin.chemical) + 2;
  }
  fullWidth = x;
}



void keyPressed() {
  if (key == 'c') sortByChemical();
}

