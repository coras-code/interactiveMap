class Button {
  float positionX = 0;
  float pressableX = 0;
  float positionY = 0;
  float pressableY = 0;
  float Width = 0; //capital prevents conflicts with the reserved word 'width'
  float Height = 0;
  color colour;
  String text; 
  boolean clicked = false; //this is the actual button 

    //constructor to create a button
   Button(float x, float y, float w, float h, String t, color c) {
      positionX = x;
      positionY = y;
      Width = w;
      Height = h;
      text = t; 
      colour = c;
  }

  //constructor to create a 3D button
  Button(float x, float y, float w, float h, String t, color c, float X, float Y) {
      positionX = x;
      positionY = y;
      Width = w;
      Height = h;
      text = t; 
      colour = c;
      pressableX = X;
      pressableY = Y;
  }
  
  void update2D() { //must be placed in void draw to work //change to just update
       if (mousePressed == true && mouseButton == LEFT && mouseX >= positionX && mouseX <= positionX+Width &&
           mouseY >= positionY && mouseY <= positionY+Height) {
            clicked = true; 
            mousePan = (mousePan) ? true : false;
        } else {
            clicked = false;
        }
  }
  
  void render2D() { 
        push();
        fill(colour);
        stroke(0);
        strokeWeight(2);
        rect(positionX, positionY, Width, Height, 10, 10, 10, 10); //10 for rounded corners 
        fill(0); //text colour
        textSize(22);
        textAlign(CENTER, CENTER);
        text(text,positionX+(Width/2), positionY+(Height/2)); 
        pop();
  }

  //Alterations for buttons that are rotated and placed above map
  void update3D() {
        if (mousePressed == true && mouseButton == LEFT && mouseX >= pressableX && mouseX <= pressableX+(Width/2) &&
           mouseY >= pressableY && mouseY <= pressableY+(Height/2)) {
            clicked = true; 
            mousePan = (mousePan) ? true : false;
        } else {
            clicked = false;
        }
  }
  
  void render3D() {
        push();
        fill(colour);
        stroke(0); 
        strokeWeight(2);
        rect(positionX, positionY, Width, Height, 10, 10, 10, 10); 
        fill(0); 
        textSize(48);
        textAlign(CENTER, CENTER);
        text(text,positionX+(Width/2), positionY+(Height/2) - 6 , 1); //z to move it forward
        pop();
  }

  boolean isClicked() { 
        return clicked;
  }
  
  void display3D() {
        update3D();
        render3D();
  }
  
  void display() {
        update2D();
        render2D();
  }
}
