class paddle // Klasse Schläger erzeugen eines neuen Schlägers
{
 
  float x;
  float y;
  
  float l;
  float h;
  
  float xspeed = 0;
  
  paddle(float x, float y, float l, float h) // Erzeugung eines Schlägers mit parametern x,y,l,h //<>//
  {
     this.x = x; 
     this.y = y;
     this.l = l;
     this.h = h;
  }
  
  void show()  // Anzeigen auf dem Bildschirm
  {   
      fill(255);
      rectMode(CENTER);
      rect(x,y,l,h);    
  }
  
  
  void update()  // Schnelligkeit aktualisieren
  {    
      x += xspeed;    
  }
  
  
  void move(float menge)  // Schnelligkeit (menge) wird xspeed zugeteilt
  {
      xspeed = menge;
  }
}