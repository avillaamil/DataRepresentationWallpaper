//ArrayList<Toxins> tox = new ArrayList();
ArrayList<ChemicalObject> chemicalList = new ArrayList();
ArrayList<ChemicalBin> binList = new ArrayList();
HashMap<String, ChemicalBin> binHash = new HashMap();

float fullWidth = 0;
PFont labelFont;

float scrollOffset;
float tscrollOffset;

// ------------- canvas variables
PGraphics canvas;
int canvas_width = 2480;
int canvas_height = 3508;
float ratioWidth = 1;
float ratioHeight = 1;
float ratio = 1;

void setup() { 
  size(canvas_width/4, canvas_height/4);
  background(30);
  smooth(8);

  // ------------- construct/resize canvas
  canvas = createGraphics(canvas_width, canvas_height);
  calculateResizeRatio();

  // --------------------------------------- CANVAS
  canvas.beginDraw();
  canvas.smooth(8);
  canvas.background(230);

  canvas.translate(canvas.width/2, canvas.height/2); 




  //Loading data using the function 
  loadData();
  Collections.sort(binList);
  Collections.reverse(binList);


  //println(binList.size());


  labelFont = createFont("Helvetica", 24);
  canvas.textFont(labelFont);
  canvas.textSize(12);
}

void draw() {
  canvas.background(230);

  tscrollOffset = -map(mouseX, 0, canvas.width, 0, fullWidth - canvas.width);

  //easing
  scrollOffset = lerp(scrollOffset, tscrollOffset, 0.1);

  translate(scrollOffset, 0);
  for (ChemicalObject chem:chemicalList) {
    chem.update();
    chem.render();
  }






  canvas.endDraw();

// --------------------------------------- CANVAS  

  // resize the offline canvas according to the resize ratio
  float resizedWidth = (float) canvas.width * ratio;
  float resizedHeight = (float) canvas.height * ratio;

  // draw the offline canvas on the screen canvas
  image(canvas, (width / 2) - (resizedWidth / 2), (height / 2) - (resizedHeight / 2), resizedWidth, resizedHeight);

  canvas.save("chem.png");
}

// ------------- resize the offline canvas to be viewable on the screen canvas
void calculateResizeRatio() {
  ratioWidth = (float) width / (float) canvas.width;
  ratioHeight = (float) height / (float) canvas.height;

  if (ratioWidth < ratioHeight)  ratio = ratioWidth;
  else                          ratio = ratioHeight;
}


/*~~~~~~~~~~~LOADING FUNCTION~~~~~~~~~~~~~~*/
void loadData() {
  String[] rows =  loadStrings("toxinscleaned.csv");

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

      println(tx.chemicals);
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
      float y = canvas.height/2 - (j * 10);
      chem.targetPosition = new PVector(x, y);
    }
    x += textWidth(bin.chemical) + 2;
  }
  fullWidth = x;
}

void keyPressed() {
  if (key == 'c') sortByChemical();
}

