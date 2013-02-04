ArrayList<PVector> points = new ArrayList();
ArrayList<Toxin> toxins = new ArrayList();

int spacing = 20;
float ellipseCutter = 0.5;
int margin = 20;

void setup()
{
 size( 500, 500 ); 
 
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
 for( int i= 0; i < 10; i++ )
 {
  int randomPoint = (int) random( spacing, points.size() ); // so they don't draw at the very top or bottom
  PVector thisPoint = points.get( randomPoint );
  Toxin newToxin = new Toxin( thisPoint.x, thisPoint.y, random( 10, 40 ) );
  toxins.add( newToxin );
  points.remove( thisPoint ); // removes point from all possibilities and lessens size of points.size() by one.
 }
  println( toxins.size() );
  
  // draw
  background( 255 );
  fill( 0 );
  
  showGrid();
  
  displayToxins();
}

void draw() 
{
// nothing here for now
}


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


