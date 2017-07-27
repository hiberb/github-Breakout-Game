Ball Ball;  // Erzeugung eines neuen Balles von der Klasse Ball
paddle pad;  // Erzeugung eines neuen Schlägers von der Klasse Paddle
Brick brick;  // Erzeugung eines neuen Steines von der Klasse Brick


ArrayList <Brick> bricks;  // Erstellen einer neuen ArrayList mit bricks

int score;  // Score
int lives;  // Anzahl der Leben
public int hilfe;
public Boolean anfang = true;
public Boolean start = false;
public Boolean ende = false;

void setup()
{
   size(640,480);
   resetgame(); //<>//
}

void draw()
{ 
  
  if (anfang == true)
  {    
      background(0);
      textSize(20);
      text("Spielsteuerung ''Breakout''",210,25);
      text("----------------------",210,35);
      text("---------------------------------------------------------------",1,70);
      text("Pfeil nach ''rechts'' bewegt den Schläger nach rechts",80,100);
      text("Pfeil nach ''links'' bewegt den Schläger nach links",80,150);
      text("Pfeil nach ''oben'' -> Spielstart <-",80,200);
      text("Pfeil nach ''unten'' -> Menü <-",80,250);
      text("''p'' -> Pausiert das Spiel",80,300);
      text("''u'' -> Pausierung aufheben",80,350);
      text("------------------------------------------------------------------",1,380);
      text("-> Pfeil nach ''oben'' um zu spielen!",150,435);
      return;    
  }
  
  else
  
  
 background(128); // Grauer Hintergrund //<>//
 
 fill(255);
 
 for (Brick brick : bricks)
 {
    brick.show();  // Aufruf der Anzeige Funktion und Anzeige des Steines
 }
 
 if (start == false)
  {
     textSize(20);
     fill(255);
     text("Score: "+ score,10,26);    // Ausgabe der Scores
     text("Lifes: " + lives,550,25);  // Ausgabe der Leben
     Ball.show(); 
     pad.show(); 
     fill(255,225,0); 
     text("Info: ",300,300);
     text("----",299,310);
     text("Drücke ''ENTER'' um fortzufahren!",158,350);  
     text("Das Spiel startet sofort!",210,410);
     return; 
  }
  
  else
 
  for (int i = bricks.size() -1; i >= 0 ;i--)
{
    Brick brick = bricks.get(i);
    // Abfrage wenn der Ball einen Stein trifft
   if (Ball.hits(brick))
   {
       bricks.remove(i);       // Steine werden an der Stelle (i) entfernt, wo der Ball einen Stein trifft
     
       Ball.yspeed *= -1;    // Damit der Ball langsamer wird und nicht, wenn er einen Stein getroffen hat, die anderen Steine auch entfernt
     
       score++;            // Score wird jedes mal um 1 erhöht
   }
}
 
 Ball.update();              // Ruft Funktion Ball.update auf
 Ball.check_edges();        // Überprüfung auf die Seitenränder
 Ball.check_paddle(pad);   // Funktionsaufruf | Abfrage damit der Schläger den Ball treffen kann und nicht der Ball das Spielfeld nach unten verlässt ohne Treffer
 Ball.show();             // Ruft Funktion Ball.show auf und zeigt den Ball an
 
 if (Ball.y >= height)
 {
     resetball(); 
 }
 
 if (pad.x > 589)    // Für die rechte Seite des Bildschirmrandes, damit der Schläger nicht das Spielfeld rechts verlässt
 {
     pad.x = 589;
 }
 
 if (pad.x < 50)  // Für die linke Seite des Bildschirmrandes, damit der Schläger nicht das Spielfeld links verlässt
 {
     pad.x= 50;  
 }
 
 
 
  if (lives <= 0)  // Abfrage wenn Lifes = 0 ist
  { 
     fill(255,255,0);                // rote Farbe
     textSize(30);
     text("GAME OVER!",232,400);   // Ausgabe des Game Over Screens 
     text("Drücke ''SPACE'' um neu zu starten!",70,450);
     Ball.yspeed = 0;           // ySchnelligkeit des Balles ist 0
     Ball.xspeed = 0;          // xSchnelligkeit des Balles ist 0     
     return;    
  }
  
  if (score == 60)  // Prüfung auf Gewonnen
  {
     fill(255,69,0);  
     textSize(30);
     text("Du hast gewonnen!",180,400);
     text("Drücke ''SPACE'' um neu zu starten!",70,450);
     Ball = new Ball(width / 2,height /2,5);  
     Ball.yspeed = 0;           // ySchnelligkeit des Balles ist 0
     Ball.xspeed = 0;          // xSchnelligkeit des Balles ist 0   
     return;
  }


    pad.show();      // Funktionsaufruf des Schlägers und Anzeige des Schlägers
    pad.update();    // Funktionsaufruf für die Geschwindigkeit des Balles
 
    textSize(20);
    text("Score: "  + score,10,26);    // Ausgabe der Scores
    text("Lifes: "  + lives,550,25);  // Ausgabe der Leben
    text("--------------------------------------------------------------------------------------------------------------------------",1,40);
    for (int i = 0; i < 35;i++)
    {
         text("|",320,i); 
    }  
}

void keyPressed()
{
  if (keyCode == RIGHT)   //<>//
  {   
     pad.move(7);       // Schnelligkeit des Schlägers nach rechts
  }
  else if (keyCode == LEFT)
  {
     pad.move(-7);     //Schnelligkeit des Schlägers nach links
  }
  
  if (key == ' ')
  {
     fill(255);
     start = false;
     resetgame();   // Aufruf der Funktion resetgame
     return;
  } 
  
  if (keyCode == UP)
  {
     anfang = false;
     return;
  }
  
  if (keyCode == DOWN)
  {
     fill(255);
     anfang = true;
     return;
  }  
  
  if (keyCode == ENTER)
  {
    if (ende == true || start == false)
    {
     start = true;
     resetgame();
     return;
    }
  }
  
   if (keyPressed)  // Prüfung auf Spielpause
    {
     if (key == 'p')
     {
         fill(255,69,0); 
         text("->PAUSE<-",200,27);
         noLoop();
         return;            
     }
    }
    
    if (keyPressed)  // Prüfung auf Ende der Spielpause
    {
     if (key == 'u')
     {
         fill(255,69,0); 
         text("->PAUSE<-",200,27);
         loop();
         return;            
     }
    } 
}

void keyReleased()
{
    pad.move(0);    // Speed = 0 wenn man die Taste loslässt
}

void resetball()
{
    lives--;
    Ball = new Ball (width / 2 ,height /2,5);
}

void resetgame()  // Wenn der Ball auf den Boden kommt
{
    Ball = new Ball(width / 2,height /2,5);  //Initialisierung eines neuen Balls mit Namen Ball und Festlegung der Größe des Balles
    pad = new paddle(width / 2,height - 30,100,10);  //Initialisierung eines neuen Schlägers mit Namen paddle und Festlegung der Größe des Schlägers
    brick = new Brick(width / 2,30,50,20); //Initialisierung eines neuen Steines mit Namen brick und Festlegung der Größe des Steines

 
 bricks = new ArrayList(); // neue ArrayList für die bricks
 
 for (int x = 50; x < width;x+=60) // Geschachtelte for-Schleife, um neue Bricks zu erstellen, um in die ArrayList an die entsprechende Position zu schreiben
 {
    for (int y = 60; y < height / 2 ;y+= 30)
    {    
        bricks.add(new Brick(x,y,50,20));   // Steine werden hinzugefügt an die entsprechende Position    
    }        
 }   
   score = 0;  // Score wird wieder auf 0 gesetzt;
   lives = 3;  // Man hat insgesamt wieder 3 Versuche frei
}


//////////////////////////////////////////


// QUELLENANGABEN:

// https://processing.org/examples/widthheight.html -> Für width und height
// https://processing.org/examples/array.html       -> Für Array
// https://processing.org/reference/ArrayList.html  -> Für ArrayList
// https://processing.org/examples/keyboard.html    -> KeyPressed Funktionen
// https://processing.org/examples/truefalse.html   -> True/False Abfragen
// https://processing.org/reference/class.html      -> Für eine neue Klasse
// https://processing.org/reference/loop_.html      -> Pausierung des Spieles
// https://processing.org/reference/this.html       -> Für ''this''

//////////////////////////////////////////