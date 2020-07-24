  //Colour Scheme
  color background = color(160, 195, 225);
  color white = color(255);
  color [] purple = new color[3];
  color [] blue = new color[3];
  color [] green = new color[3];
  color [] colourScheme = new color[3];
  
  //Pan and Zoom
  float scale = 1.50;
  int zoomCount = 1;
  boolean zoomIn = false;
  boolean zoomOut = false;
  boolean mousePan = false;
  boolean panUp = false;
  boolean panDown = false;
  boolean panLeft = false;
  boolean panRight = false;
  float panSpeed = 1.25;
  float xPan = 307;//width/2;
  float yPan = 350;//height/2;
  
  //Filter
  boolean low = true; 
  boolean mid = true;
  boolean high = true;
  boolean details = false; 
  
  //Intialise Objects
  Menu mainMenu;
  DataTable data;
  PImage UK;
  PImage img;
  Button button1991;
  Button button2001;
  Button button2011;
  Button detailsButton;
  Button allButton;
  Button lowButton;
  Button midButton;
  Button highButton;
  int menu = 0;
  int year = 0;
  color [] colour = purple;

     void setup () {
          size(615 , 700, P3D);  
          //adding shades
          purple[0] = color(126, 77, 193); //middle
          purple[1] = color(177, 156, 217); //light
          purple[2] = color(66, 40, 100); //dark
          blue[0] = color(46, 165, 225);; //middle
          blue[1] = color(125, 237, 254); //light
          blue[2] = color(22, 48, 153); //dark
          green[0] = color(92, 186, 111); //middle
          green[1] = color(127, 232, 180); //light
          green[2] = color(0,100,0); //dark
          
          //resetSketch(); //TODO addtional feature
          
          //declaring
          mainMenu = new Menu();
          data = new DataTable();
          data.extractData();
          UK = loadImage("data/map.jpg");
          button1991 = new Button(20, 25, 200, 100, "1991", purple[1], 25, 25); 
          button2001 = new Button(225, 25, 200, 100, "2001", blue[1], 125, 25 );
          button2011 = new Button(430, 25, 200, 100, "2011", green[1], 225, 25 );
          detailsButton = new Button(710, 0, 200, 75, "DETAILS", background, 355, 10);
          allButton = new Button(920, 0, 150, 75, "ALL", background, 455, 10);
          midButton = new Button(840, 85, 150, 75, "MID", background, 425, 45 );
          lowButton = new Button(1080, 0, 150, 75, "LOW", background, 535, 10);
          highButton = new Button(1000, 85, 150, 75, "HIGH", background, 500, 45);
     }
     
     void draw(){
          background(background);  
          smooth();
          switch(menu)
          {
           case 0: {
               mainMenu.sketch();     
           } break;
           case 1: {
                 //buttons
                 push();
                 stroke(0);
                 strokeWeight(2);
                 translate(-307, -350, 275); //placing above map
                 rotateX(-PI/2);
                 display3DButtons();
                 pop();
               
                 //postion setup for pan and zoom
                 int tilt = 1000;
                 camera(width/2, tilt, (height/2.0) / tan(PI*30.0 / 180.0), width/2, height/2.0, 0, 0, 1, 0);
                 translate(width/2, height/2); //0,0, the centre point that zooms in and out
                 scale(scale);
                 translate(-xPan , -yPan); //sets x and y pan to the mid point of screen 
                 
                 //map
                 push();
                 noStroke();
                 scale(0.25);
                 beginShape(); 
                   textureMode(NORMAL);
                   texture(UK);
                   vertex(0, 0, 0, 0, 0);
                   vertex(UK.width, 0, 0, 1, 0);
                   vertex(UK.width, UK.height, 0, 1, 1);
                   vertex(0, UK.height, 0, 0, 1);
                 endShape();
                 pop();
                 
                 //popluation cubes
                 ambientLight(225, 225, 225); //less intense compared to defaults
                 directionalLight(126, 126, 126, 0, 0, -1);
                 lightFalloff(1, 0, 0);
                 lightSpecular(0, 0, 0);
                 data.sketch();
      
                 //actions
                 if (button1991.isClicked()) {  
                   data.sketch();
                   year = 0;
                   colour = purple;
                 } 
      
                 if (button2001.isClicked()){
                     data.sketch(); 
                      year = 1;
                      colour = blue;
                 } 
          
                 if (button2011.isClicked()) {
                   data.sketch();
                    year = 2;
                    colour = green;
                 }
                 
                 if (allButton.isClicked()) { 
                     low = true;
                     mid = true;
                     high = true;
                 } 
      
                  if (lowButton.isClicked()){
                     low = true;
                     mid = false;
                     high = false;
                 } 
                  if (midButton.isClicked()) {
                     low = false;
                     mid = true;
                     high = false;
                 }
          
                 if (highButton.isClicked()) {
                     low = false;
                     mid = false;
                     high = true;
                 }
                 
                 if (detailsButton.isClicked()) {
                     details = (details) ? false : true; //tenery operator
                 }
          
                 if (panUp) {
                     yPan -= panSpeed;
                 }
                 if  (panDown) {
                     yPan += panSpeed;
                 }
                 if  (panLeft) {
                     xPan -= panSpeed;
                 }
                 if  (panRight) {
                    xPan += panSpeed;
                 }
           } break;
         }// end of switch statement
     } //end of draw
  
 void zoomOut() {
    if (zoomCount > -3 && zoomCount <= 22) {
    scale = (scale / 1.1);
    zoomCount -= 1;
    println("zoom count " +zoomCount);
    } else {println("else zoom count " + zoomCount);}
  }
  
  void zoomIn() {
    if (zoomCount >= -3 && zoomCount < 22){
    scale = (scale * 1.1);
    zoomCount += 1;
     println("zoom IN count " +zoomCount);
    } else {println("else zoom IN count " + zoomCount);}
  }
  
  void mouseWheel(MouseEvent event) {
    float e = event.getCount();
    println("scroll " + e);
    if (e <= 0) {
      zoomOut();
    } else if  (e >= 1) {
      zoomIn();
    }
  }
  
  void mouseClicked(MouseEvent event) {
    float e = event.getCount();
      if (mouseButton == LEFT && mouseY > 125) {//below buttons so no interfering 
          if (e == 2) {     
             if (mouseButton == LEFT) {
                 if (zoomCount < 3) {
                    scale = 1.5 * 1.1 * 3;
                    zoomCount = 3; 
                 } else {
                    scale = 1.5;
                    zoomCount = 1;
                 }
             } else if (mouseButton == RIGHT) {
               menu = 0;
               //resetSketch(); //TODO additional feature
          }
      } else if (e == 1) { 
            mousePan = (mousePan) ? false : true;
        }
     }
  }

  void mouseMoved(){
        float sectionX = width/4;
        float sectionY = height/4;

        if (mousePan && mouseX > 3 * sectionX) {
            panLeft = false;
            panRight = true;
       } else if (mousePan && mouseX < sectionX) {
            panLeft = true;
            panRight = false;
       } else if (mousePan && mouseY > 3 * sectionY) {
            panUp = false;
            panDown = true;
       } else if (mousePan && mouseY < sectionY) {
            panUp = true;
            panDown = false;
       } else {
           panUp = false;
           panDown = false;
           panLeft = false;
           panRight = false;
       }
  }
    
  void keyPressed(){
    if (key == 's' || key == 'S') {
       menu = 1;
    } else if (key == 'a' || key == 'A') {
       low = true;
       mid = true;
       high = true;
     } else if (key == 'l' || key == 'L') {
       low = true;
       mid = false;
       high = false;
     } else if (key == 'm' || key == 'M' ) {
       low = false;
       mid = true;
       high = false;
     } else if (key == 'h'|| key == 'H') {
       low = false;
       mid = false;
       high = true;
     } else if (key == 'd' || key == 'D') {
       details = (details) ? false : true;
     } else if (key == 'i' || key == 'I') {
       zoomIn();
    }  else if (key == 'o' || key == 'O') {
       zoomOut();
    }  else if (key == '1') {
       data.sketch();
       year = 0;
       colour = purple;
     } else if (key == '2') {
       data.sketch();
       year = 1;
       colour = blue;
     } else if (key == '3') {
       data.sketch();
       year = 2;
       colour = green;
     } else if (key == ENTER) {
            menu = 0;
     }
    
    if (key == CODED) {
      if (keyCode == SHIFT) {
            mousePan = (mousePan) ? false : true;
       } else if (keyCode == UP) {
           panUp = true;
           panDown = false;
       } else if (keyCode == DOWN) {
           panUp = false;
           panDown = true;
       } else if (keyCode == LEFT){
           panLeft = true;
           panRight = false;
       } else if (keyCode == RIGHT) {
            panLeft = false;
           panRight = true;
       } else {
           panUp = false;
           panDown = false;
           panLeft = false;
           panRight = false;
        }
     }
  }
   
  void keyReleased(){
    if (key == CODED) {
        if (keyCode == UP){
           panUp = false;
       } if (keyCode == DOWN) {
           panDown = false;
       } if (keyCode == LEFT){
          panLeft = false;
       } if (keyCode == RIGHT) {
           panRight = false;
       }
    }
  }
  
    void display3DButtons() {
      button1991.display3D();
      button2001.display3D();
      button2011.display3D();
      detailsButton.display3D();
      allButton.display3D();
      lowButton.display3D();
      midButton.display3D();
      highButton.display3D();
    }
    
   
   // void resetSketch() {}
     //put everything from setup to reset, then call this function

     
