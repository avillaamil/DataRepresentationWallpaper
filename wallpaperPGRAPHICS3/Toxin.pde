class Toxin {

  //set up PVector and variables 
  PVector pos = new PVector();
  float value;
  float centerRadius;

  //Global Variables to link data in Chemical Bin to Toxins
  ChemicalBin cbin;
  //int numberOfChemicals = bin.chemicalList.size();
  //int totalChemicalRelease = bin.chemicalList.totalRelease();

  //declare array of colors from random color palette
  color [] myColors;

  Toxin( float _x, float _y, float _value, ChemicalBin bin ) {
    pos.x = _x;
    pos.y = _y;
    value = _value;

    int numberOfChemicals = bin.chemicalList.size(); // number of chemicals in the list

    centerRadius = 3 + (sqrt(value) * ellipseCutter);
    cbin = bin;

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
    for (int i=0; i < 20; i++) {
      canvas.fill(myColors[i]);
      canvas.stroke(myColors[i]);
    }

    //draw ellipses at the positions associated with the PVectors
    canvas.ellipse( pos.x, pos.y, centerRadius, centerRadius );
    //text
    canvas.text(cbin.chemical, pos.x, pos.y, 30, 30);


    //lines
    PVector currPoint = new PVector( pos.x, pos.y );
    for ( int i = 0; i < value; i++ )
    {
      ArrayList possiblePoints = new ArrayList();
      for ( PVector possiblePoint : points )
      {
        if ( dist( possiblePoint.x, possiblePoint.y, currPoint.x, currPoint.y ) < spacing * 1.5 )
        {
          possiblePoints.add( possiblePoint );
        }
      }
      int randomPoint = (int) random( 0, possiblePoints.size() );
      PVector destination = (PVector) possiblePoints.get(randomPoint);
      canvas.line( currPoint.x, currPoint.y, destination.x, destination.y );
      currPoint.x = destination.x;
      currPoint.y = destination.y;
    }
  }
}

