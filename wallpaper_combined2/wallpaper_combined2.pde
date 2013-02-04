/* ____________ FORMAT STUFF ______________________________________*/
ArrayList<Toxin> toxins = new ArrayList();
ArrayList<PVector> points = new ArrayList();

/* ____________ DATA STUFF ___________________________________*/
ArrayList<ChemicalObject> chemicalList = new ArrayList();
ArrayList<ChemicalBin> binList = new ArrayList();
HashMap<String, ChemicalBin> binHash = new HashMap();

/* ____________ VARIABLES ______________________________*/

//DATA VARAIABLES
float fullWidth = 0;
PFont labelFont;
//float scrollOffset;
//float tscrollOffset;

//FORMAT VARIABLES
int spacing = 20;
float ellipseCutter = 0.5;
int margin = 20;
int chemCount = 10;
color [] palette = {
  //#80314C, #B7504F, #F8BE63, #C7C58B, #FEFCB1, #024357, #598574, #355265, #9DAD83
  #664B31, #EB5E91, #EB391F, #EB891B, #A47D34, #5F9898, #93C1AE, #727D76, #CED8D6
};
color bg = #F5F1E7;


//SETUP//////////////////////////////////////////////////////////////////////////////////////////////

void setup() {
  size(300, 800); 
  background(bg);
  textSize(4);
  smooth(4);

  /* Sorting data - hashmaps stuff */
  Collections.sort(binList);
  Collections.reverse(binList);
  //println(binList.size());
  //println(tx.chemicals);

  labelFont = createFont("Helvetica", 24);


  //Create a grid of points that are PVectors 
  for ( int cols = 0; cols < width/spacing; cols++ ) { // start below the top edge

    for ( int rows = 0; rows < height/spacing; rows++ ) { // this ends above the bottom edge

      PVector newPoint = new PVector();
      if ( rows % 2 == 0 ) {
        newPoint = new PVector( cols*spacing + spacing/2, rows*spacing );
        points.add( newPoint );
      } 
      else {
        newPoint = new PVector( cols*spacing, rows*spacing );
        points.add( newPoint );
      }
    }
  }
  // create the Toxin objects
  for ( int i= 0; i < chemCount; i++ ) {
    int randomPoint = (int) random( spacing, points.size() ); // so they don't draw at the very top or bottom
    PVector thisPoint = points.get( randomPoint );
    ChemicalObject newChemicalObject = new ChemicalObject( thisPoint.x, thisPoint.y, random( 10, 40 ) );
    chemicalList.add( newChemicalObject );
    points.remove( thisPoint ); // removes point from all possibilities and lessens size of points.size() by one.
  }
  //println( toxins.size() );


  //CALLING ALL FUNCTIONS

  loadData();
  //showGrid(); 
  displayToxins();
}

//DRAW//////////////////////////////////////////////////////////////////////////////////////////////

void draw() {

  // this was doing some stuff when we were figuring out hasmaps
  /* Lining up all thec chemicals in order */
  //tscrollOffset = -map(mouseX, 0, width, 0, fullWidth - width);
  //scrollOffset = lerp(scrollOffset, tscrollOffset, 0.1);

  //translate(scrollOffset, 0);
  //for (ChemicalObject chem:chemicalList) {
  //chem.update();
  //chem.render();
  //}
  /* Reaching into the bin! */
  //countChemicals();
}

//FUNCTIONS///////////////////////////////////////////////////////////////////////////////////////////

void showGrid()
{
  for ( PVector thisPoint : points )
  {
    ellipse( thisPoint.x, thisPoint.y, 1, 1 );
  }
}


void displayToxins()
{
  for ( ChemicalObject thisToxin : chemicalList )
  {
    thisToxin.display(); 
    println( thisToxin.pos.x + ", " + thisToxin.pos.y + ", " );
  }
}


/*________ DATA FUNCTIONS _______*/

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
    } 
    else {
      //Nope! Better make a new bin!
      ChemicalBin bin = new ChemicalBin();
      bin.chemical = chem;
      bin.chemicalList.add(tx);
      //Add it to the hashmap
      binHash.put(chem, bin);
      binList.add(bin);
    }
  }
}


//void countChemicals() {
//  for (int i = 0; i < binList.size(); i++) { //list of a list
//    ChemicalBin bin = binList.get(i);    
//
//    for (int j = 0; j < bin.chemicalList.size(); j++) { //list of chemicals 
//
//      ChemicalObject chem = bin.chemicalList.get(j);
//      if (chem.isMetal == 0) {
//        fill(255, 0, 0);
//      } 
//      else {
//        fill(0, 255, 0);
//      }
//      ellipse (i*50, height/2, bin.chemicalList.size()/5, bin.chemicalList.size()/5); 
//      //println ("size: " + bin.chemicalList.size());
//    }
//  }
//}


//void sortByChemical() {
//  float x = 0;
//  for (int i = 0; i < binList.size(); i++) {
//    ChemicalBin bin = binList.get(i);
//    //float x = i * 40;
//    for (int j = 0; j < bin.chemicalList.size(); j++) {
//      ChemicalObject chem = bin.chemicalList.get(j);
//      float y = height/2 - (j * 10);
//      chem.targetPosition = new PVector(x, y);
//    }
//    x += textWidth(bin.chemical) + 2;
//  }
//  fullWidth = x;
//}


//void keyPressed() {
//  if (key == 'c') sortByChemical();
//}

