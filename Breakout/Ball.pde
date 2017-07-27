class Ball
{
  float x;
  float y;
  float r;
  float d;
  float xspeed = 5;
  float yspeed = -2;
  
  float speed = 5;
  
  Ball(float x, float y, float r)    // Initialisierung des Balles mit den Parametern x,y,r
  {
       this.x = x;
       this.y = y;
       this.r = r;
   
       this.d = r * 2;
   
       float angle = random(PI/4,3*PI/4);
       xspeed = speed * cos(angle);
       yspeed =  - speed * sin(angle);   
  }
  
 void show()  // Anzeigen des Balles
 {
     fill(255);
     ellipseMode(CENTER);  //Mitte auf dem Bildschirm anzeigen
     ellipse(x,y,d,d); //Erstellung des Balles mit festgelegter Größe
 }
 
 void update()  // Geschwindigkeit des Balles
 {
     x += xspeed;  //xgeschwindigkeit
     y += yspeed;  //ygeschwindigkeit
 }
  
  
 void check_edges()  // Berührung der Seiten überprüfen
 {
   if (((x - r)) <= 0 || ((x + r ) >= width)) // Berührungen der Seiten prüfen
   {
       xspeed *= -1;
   }
   
   if ((y -r ) <= 0)
   {
       yspeed *= -1; 
   }   
 }
 
 void check_paddle(paddle pad)
 {
   float xmin = pad.x -(pad.l /2) - r ;
   float xmax = pad.x +(pad.l /2) + r;
   
   float ymin = pad.y -(pad.h /2) -r ;
   float ymax = pad.y +(pad.h /2);
   
   if ((x >= xmin) && (x <= xmax) && (y >= ymin) && (y <= ymax)) // Abfrage damit der Schläger den Ball treffen kann und nicht der Ball das Spielfeld nach unten verlässt ohne Treffer
   {
        yspeed *= -1; 
   }
 }
 
 boolean hits(Brick brick)    // Abfrage wenn ein Stein getroffen wurde was geschehen soll
 {
   float xmin = brick.x -(brick.l /2) - r;
   float xmax = brick.x +(brick.l /2) + r;
   
   float ymin = brick.y -(brick.h /2) -r ;
   float ymax = brick.y +(brick.h /2) +r ;
   
   return ((x >= xmin) && (x <= xmax) && (y >= ymin) && (y <= ymax)); // Abfrage damit der Schläger den Ball treffen kann und nicht der Ball das Spielfeld nach unten verlässt ohne Treffer 
 }
}