class Brick // Erstellung einer neuen Klasse namens brick
{
  
  float x;
  float y;  
  float l;
  float h;
  
  float red = random(255);    // Random Farben-Generierung für die Steine
  float green = random(255);
  float blue = random(255);


  
  Brick(float x, float y, float l, float h)  // Erstellung der Steine mit Parametern x,y,l,h
  {
     this.x = x; 
     this.y = y;
     this.l = l;
     this.h = h;
  }
  
  void show()    // Anzeige auf dem Bildschirm
  {          
      fill(red,green,blue);
      rectMode(CENTER);
      rect(x,y,l,h);   
  } 
}