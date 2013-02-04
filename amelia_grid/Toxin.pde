class Toxin
{
  
 PVector pos = new PVector();
 float value;
 float centerRadius;
 
 Toxin( float _x, float _y, float _value )
{
 pos.x = _x;
 pos.y = _y;
 value = _value;
 centerRadius = value * ellipseCutter;
} 

 void display()
 {
  // center ellipse
  
  color c = color( random( 0, 255 ), random( 0, 255 ), random( 0, 255 ) );
  fill( c );
  stroke( c );
  ellipse( pos.x, pos.y, centerRadius, centerRadius ); 
  
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
    PVector destination = (PVector) possiblePoints.get( randomPoint );
    line( currPoint.x, currPoint.y, destination.x, destination.y );
    currPoint.x = destination.x;
    currPoint.y = destination.y;
  }
  
 }
  
}
