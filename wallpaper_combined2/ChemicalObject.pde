class ChemicalObject {

  String chemicals;
  float release;
  int isCleanAct;
  int isMetal;
  int isCarcinogen;

//  PVector position = new PVector();
//  PVector targetPosition = new PVector();

  //set up PVector and variables 
  PVector pos = new PVector();
  float value;
  float centerRadius;

  //declare array of colors from random color palette
  color [] myColors;

  Toxin( float _x, float _y, float _value ) {
    pos.x = _x;
    pos.y = _y;
    value = _value;
    centerRadius = value * ellipseCutter;

    //attach new color to each of the triangles
    myColors = new color[20];

    //pull from random color palette
    for (int i=0; i<20; i++) {
      myColors[i] = palette[(int)random(palette.length)];
    }
  }
  
   void display()
 {
  //center ellipse
    //call color for each of the ellipses and display
    for (int i=0; i < 20; i++){
      fill(myColors[i]);
      stroke(myColors[i]);
    }
 
  //draw ellipses at the positions associated with the PVectors
  ellipse( pos.x, pos.y, centerRadius, centerRadius );
  //text 
  
  //lines
  PVector currPoint = new PVector( pos.x, pos.y );
  for( int i = 0; i < value; i++ )
  {
    ArrayList possiblePoints = new ArrayList();
    for( PVector possiblePoint : points )
    {
     if( dist( possiblePoint.x, possiblePoint.y, currPoint.x, currPoint.y ) < spacing * 1.5 )
     {
      possiblePoints.add( possiblePoint ); 
     }
    }
    int randomPoint = (int) random( 0, possiblePoints.size() );
    PVector destination = (PVector) possiblePoints.get(randomPoint);
    line( currPoint.x, currPoint.y, destination.x, destination.y );
    currPoint.x = destination.x;
    currPoint.y = destination.y;
  }
  
 }


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
   pushMatrix();
   translate(position.x, position.y);
   fill(0);
   text(chemicals, 0, 0);
   popMatrix();
   }
   */
}

