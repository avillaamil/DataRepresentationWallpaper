class Toxin{
 
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
 
 
 //QUESTION: how do we call the total release in the toxin constructor???????? (ChemicalObject.totalRelease ??)
 Toxin( float _x, float _y, float _value, ChemicalBin bin ){
 pos.x = _x;
 pos.y = _y;
 
////QUESTION: how do we tell it that the value is based on the chemical object releases?
 //_value = ChemicalObject.release; //here we need to tell it what to reference as 'value', which will affect the ellipse size
 value = _value;
 
 
 //toxinCounter = totalChemicalRelease;
 
 int numberOfChemicals = bin.chemicalList.size(); // number of chemicals in the list
 //println(numberOfChemicals);
 
 centerRadius = 3 + (sqrt(value) * ellipseCutter);
 cbin = bin;
 
 //attach new color to each of the triangles
 myColors = new color[20];
   
 //pull from random color palette
 for (int i=0; i<20; i++) {
   myColors[i] = palette[(int)random(palette.length)];
    }
 }
  

 void display(){
  //center ellipse
    //call color for each of the ellipses and display

    for (int i=0; i < 20; i++){
      fill(myColors[i]);
      stroke(myColors[i]);
    }
 
  //UPDATE!!!!!!!!!!!!!!!!!!!!!!!!!!!!
  //draw ellipses at the positions associated with the PVectors
  println("*" + centerRadius);
  ellipse( pos.x, pos.y, centerRadius, centerRadius ); //centerRadius is dependent on total release, position x and y are random
  //text 
  
  
  //lines
  PVector currPoint = new PVector( pos.x, pos.y );
  for( int i = 0; i < 4; i++ )
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
}
  
