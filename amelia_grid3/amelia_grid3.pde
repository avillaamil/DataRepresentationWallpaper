//containers for all this stuff
ArrayList<PVector> points = new ArrayList();
ArrayList<Toxin> toxins = new ArrayList();

int spacing = 20;
float ellipseCutter = 0.5;
int margin = 20;

//colors
color [] palette = {
  //#80314C, #B7504F, #F8BE63, #C7C58B, #FEFCB1, #024357, #598574, #355265, #9DAD83
  #664B31, #EB5E91, #EB391F, #EB891B, #A47D34, #5F9898, #93C1AE, #727D76, #CED8D6
};

//color dirtyOlive = #828A25;
color backgroundOffWhite = #F5F1E7;
//color lightYellow = #FFF280;

//SETUP//////////////////////////////////////////////////////////////////////////////////////////////

void setup()
{
 size( 300, 800 ); 
 
 
 //Create a grid of points that are PVectors 
 for( int cols = 0; cols < width/spacing; cols++ ) // start below the top edge
 {
  for( int rows = 0; rows < height/spacing; rows++ ) // this ends above the bottom edge
 {
  PVector newPoint = new PVector();
  if( rows % 2 == 0 )
  {
   newPoint = new PVector( cols*spacing + spacing/2, rows*spacing );
   points.add( newPoint );
  } else {
   newPoint = new PVector( cols*spacing, rows*spacing );
   points.add( newPoint );
 } 
 }
}
 // create the Toxin objects
 for( int i= 0; i < 160; i++ )
 {
  int randomPoint = (int) random( spacing, points.size() ); // so they don't draw at the very top or bottom
  PVector thisPoint = points.get( randomPoint );
  Toxin newToxin = new Toxin( thisPoint.x, thisPoint.y, random( 10, 40 ) );
  toxins.add( newToxin );
  points.remove( thisPoint ); // removes point from all possibilities and lessens size of points.size() by one.
 }
  println( toxins.size() );
  
  // draw
  background(backgroundOffWhite);
  textSize(4);
  fill(0);
  strokeWeight(2);
  
  //showGrid(); 
  displayToxins();
}

//DRAW//////////////////////////////////////////////////////////////////////////////////////////////

void draw() 
{
// nothing here for now
}

//FUNCTIONS///////////////////////////////////////////////////////////////////////////////////////////

void showGrid()
{
 for( PVector thisPoint : points )
  {
   ellipse( thisPoint.x, thisPoint.y, 5, 5 ); 
  } 
}


void displayToxins()
{
 for( Toxin thisToxin : toxins )
 {
  thisToxin.display(); 
  println( thisToxin.pos.x + ", " + thisToxin.pos.y + ", " );
 }
}


