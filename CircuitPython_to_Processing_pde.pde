import processing.serial.*;
Serial myPort = new Serial(this, Serial.list()[2], 9600);

int constant = 150;
float angle = 0.05;
int scalar = 90;
float speed = 0.01;

int outerX = 60;
int outerY = 150;

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
     
     float outerX = constant + -scalar * cos(radians(angle));
     float outerY = constant - scalar * sin(radians(angle));
     
     strokeWeight(5);
     stroke(120,120,0);
     line(150, 150, outerX, outerY);
     
     textSize(30);
     fill(0);
     text(str(angle), 120, 210);
     
     
     stroke(0);
     fill(0);
     ellipse(150,150, 20, 20);
     
}
