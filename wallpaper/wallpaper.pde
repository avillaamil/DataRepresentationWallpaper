ArrayList<Toxins> tox = new ArrayList();


void setup() {
  size(850, 1300); 
  background(230);
  smooth(4);

  //Loading data using the function 
  loadData();

  //Adding a font for later
  PFont font;
  font = loadFont("HelveticaNeue-Bold-20.vlw");
  textFont(font);
}

void draw() {
  background(230);

  //Taking a look at the data
  for (int i=0; i<9; i++) {
    Toxins t = tox.get(i);

    //volume
    float x = map (t.release, 0, 66435, 50, 800);
     //println ("t.release: " + t.release + " " +x); 


    //quantity
    //float y = map();

    //chemical labels
    pushMatrix();
      translate(x, 300);
      rotate(radians (90));
    fill(100);
    textSize(18);
    text(t.chemicals, 0, 0);
    println("chemical name: " + t.chemicals);
    popMatrix();
  }
}



/*~~~~~~~~~~~LOADING FUNCTION~~~~~~~~~~~~~~*/
void loadData() {
  String[] rows =  loadStrings("DATACLEANED.csv");

  for (int i=1; i<10; i++) {
    Toxins tx = new Toxins();
    tx.fromCSV(rows[i].split(","));
    //println (ad.crashes );
    tox.add(tx);
  }
}

