import processing.serial.*;

int constant = 150;
float angle = 0.05;
int scalar = 100;
float speed = 0.05;

int outerX = 90;
int outerY = 150;


Serial myPort = new Serial(this, Serial.list()[2], 9600);

void setup() {
     println("Available serial ports:");
     println(Serial.list());
     size(300, 300);
     smooth();
}

void draw() {
    
    background(255);
    stroke(100);
    fill(255);
    ellipse(150, 150, 200, 200);
    
    
     if (myPort.available() > 0) { 
          int myNum = myPort.read();
          angle = myNum;
   
          println(myNum);
          delay(1);
     } 
     
     float outerX = 150 + -65 * cos(radians(angle));
     float outerY = 150 - 65 * sin(radians(angle));
     
     strokeWeight(5);
     stroke(100,100,0);
     line(150, 150, outerX, outerY);
     
     textSize(30);
     fill(0);
     text(str(angle), 120, 210);
     
     
     stroke(0);
     fill(0);
     ellipse(150,150, 20, 20);
     
}
