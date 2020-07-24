class Menu {
    PImage earth;
    PShape globe;
    float angle;
    
    Button startButton;
    Button watchButton;
    Button rationaleButton;
    
    //positioning
    int rowHeight = 75;
    float widthSection = width/4;
    float heightSection = height/8;
    float tableWidth = width - (widthSection);
    float indent = width/8;
    float bottomSection = height - (height/32)*3;
    
    //constructor
    Menu() {
        earth = loadImage("earth.jpg"); 
        globe = createShape(SPHERE, 200);
        globe.setStroke(false);
        globe.setTexture(earth);
        angle = 0;
      
        startButton = new Button(indent + 2, bottomSection, widthSection - 5, 50, "START(S)", purple[1]);  
        watchButton = new Button(indent + widthSection + 4, bottomSection, widthSection - 5, 50, "WATCH HOW", blue[1]);
        rationaleButton = new Button(widthSection * 3 - indent + 4, bottomSection, widthSection - 5, 50, "RATIONALE", green[1]);
      }
    
        void sketch() {
               camera(width/2, height/2, (height/2.0) / tan(PI*30.0 / 180.0), width/2, height/2.0, 0, 0, 1, 0);
               push();
               animation();
               pop();
               
               //title
               push();
               fill(0);
               textAlign(CENTER, CENTER);
               textSize(30);
               translate(width/2, heightSection - 50);
               text("Interactive Map", 0, 0);
               textSize(16);
               translate (0, 25);
               text("showing populations of cities in the UK.", 0, 0);
               pop();
               
               //table
               push();
               translate (width/8, heightSection);
               beginShape(QUAD_STRIP); 
               fill(background);
                  vertex(0, 0); 
                  vertex(tableWidth, 0);   
               fill(255);
                  vertex(0, rowHeight);
                  vertex(tableWidth, rowHeight);
                  vertex(0, rowHeight * 2 ); 
                  vertex(tableWidth, rowHeight * 2); 
                  vertex(0, rowHeight * 3);
                  vertex(tableWidth, rowHeight * 3); 
                  vertex(0, rowHeight * 4);
                  vertex(tableWidth, rowHeight * 4); 
                  vertex(0, rowHeight * 5);
                  vertex(tableWidth, rowHeight * 5); 
                  vertex(0, rowHeight * 6);
                  vertex(tableWidth, rowHeight * 6); 
                  vertex(0, rowHeight * 7);
                  vertex(tableWidth, rowHeight * 7); 
               endShape();
               strokeWeight(3);
               line(0, rowHeight, tableWidth, rowHeight);
               //vertical lines - Columns 
               line(tableWidth/3, 0, tableWidth/3, rowHeight * 7);
               strokeWeight(1);
               line(2 * tableWidth/3, 0, 2 * tableWidth/3, rowHeight * 7);
               pop();
               
               //text setup
               fill(0); //black text
               textAlign(CENTER, CENTER);
               textSize(25);
               translate(width/2, heightSection + (rowHeight/2)); //  translate(width/2, heightSection * 2); //moved it up
               
               //row 1
               push();
               text("FUNCTIONS", -widthSection, 0);
               text("MOUSE", 0 , 0);
               text("KEYS", + widthSection , 0);
               pop();
               
               //row 2
               translate(0, rowHeight);
               push();
               text("PAN", -widthSection, 0);
               textSize(16);
               String s = "Move towards EDGES of screen.";
               translate(0, 0);
               text(s, -width/8, -rowHeight, rowHeight*2, rowHeight*2 );
               
               String s2 = "Press UP, DOWN, RIGHT and LEFT arrow keys.";
               translate(widthSection, 0);
               text(s2, -width/8, -rowHeight, rowHeight*2, rowHeight*2 );
               pop();
               
               //row 3
               translate(0, rowHeight);
               push();
               text("PAN OFF", -widthSection, 0);
               
               String s3 = "Click within the CENTRE of screen.";
               translate(0, 0);
               textSize(16);
               text(s3, -width/8, -rowHeight, rowHeight*2, rowHeight*2 );
               
               String s4 = "Press SHIFT key.";
               translate(widthSection, 0);
               textSize(16);
               text(s4, -width/8, -rowHeight, rowHeight*2, rowHeight*2 );
               pop();
               
               //row 4
               translate(0, rowHeight);
               push();
               text("ZOOM", -widthSection, 0);
               
               String s5 = "Scroll WHEEL or DOUBLE CLICK LEFT button.";
               translate(0, 0);
               textSize(16);
               text(s5, -width/8, -rowHeight, rowHeight*2, rowHeight*2 );
               
               String s6 = "          Press            'I' to zoom IN,    'O' to zoom OUT.";
               translate(widthSection, 0);
               textSize(16);
               text(s6, -width/8, -rowHeight, rowHeight*2, rowHeight*2 );
               pop();
               
               //row 5
               translate(0, rowHeight);
               push();
               text("SWITCH", -widthSection, 0);
               
               String s7 = "Click on-screen BUTTONS in the top LEFT.";
               translate(0, 0);
               textSize(16);
               text(s7, -width/8, -rowHeight, rowHeight*2, rowHeight*2 );
               
               String s8 = "Press '1', '2' or '3' keys.";
               translate(widthSection, 0);
               textSize(16);
               text(s8, -width/8, -rowHeight, rowHeight*2, rowHeight*2 );
               pop();  
               
               //row 6
               translate(0, rowHeight);
               push();
               text("FLITER", -widthSection, 0);
               
               String s9 = "Click on-screen BUTTONS in the top RIGHT";
               translate(0, 0);
               textSize(16);
               text(s9, -width/8, -rowHeight, rowHeight*2, rowHeight*2 );
               
               String s10 = "Press 'A', 'L', 'M', 'H', 'D' keys.";
               translate(widthSection, 0);
               textSize(16);
               text(s10, -width/8, -rowHeight, rowHeight*2, rowHeight*2 );
               pop();
    
               //row 7
               translate(0, rowHeight);
               push();
               text("MENU", -widthSection, 0);
               
               String s11 = "DOUBLE CLICK RIGHT button to return.";
               translate(0, 0);
               textSize(16);
               text(s11, -width/8, -rowHeight, rowHeight*2, rowHeight*2 );
               
               String s12 = "Press 'ENTER' key to return.";
               translate(widthSection, 0);
               textSize(16);
               text(s12, -width/8, -rowHeight, rowHeight*2, rowHeight*2 );
               pop();  
               
             
               //buttons
                push(); 
                translate(-width/2, -(heightSection + (rowHeight/2)) - rowHeight * 6); //undo translate, buttons must not have translate as the pressable position!!
                displayMenuButtons();
                pop();
                 
                if (startButton.isClicked()){
                    menu = 1;
                } 
              
                if (watchButton.isClicked()) {
                    link("https://youtu.be/PtKlmK5K8Wg");
                    println("Opening How To Video on, video is also in Data Folder");
                }
                
                if (rationaleButton.isClicked()){
                    launch("Rationale.doc"); //launch("Rationale.pdf");
                    println("Rationale Document is in Data folder");
                }
          }
        
       void displayMenuButtons() {
           startButton.display();
           watchButton.display();
           rationaleButton.display();
       }
    
    
        void animation(){ 
                //1
                 translate(width/16 * 3, heightSection - 35, 0);
                 push(); 
                 scale(0.1);
                 rotateX(-PI/6);
                 rotateY(angle);
                 angle += 0.02;
                 noStroke();
                 shape(globe);
                 pop();
                //2
                 translate(width/16 * 10, 0);
                 push(); 
                 scale(0.1);
                 rotateX(-PI/6);
                 rotateY(-angle);
                 angle += 0.02;
                 noStroke();
                 shape(globe);
                 pop();
        }
        
}
