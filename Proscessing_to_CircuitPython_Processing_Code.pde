import processing.serial.*;

Serial myPort = new Serial(this, Serial.list()[2], 9600);



void setup() {
     println("Available serial ports:");
     println(Serial.list());
     size(360, 540);
     smooth();
}


void draw(){
  
    //graph rectangle
    stroke(180,50,180);
    strokeWeight(10);
    fill(236,236,236);
    rect(0,0,360,360);
    
    //bottom rectangle
    stroke(180,50,180);
    strokeWeight(5);
    rect(2.5,355,355,182.5);
    
    //y-axis
    stroke(255,0,0);
    strokeWeight(2);
    line(180,5,180,352.5);
    
    //x-axis
    stroke(255,0,0);
    strokeWeight(2);
    line(5,180,355,180);
    
    
    float mappedX =  constrain(map(mouseX+1,0,360,0,180),0,180);
    float mappedY =  constrain(map(mouseY,0,360,0,180),0,180);
    
    
    if(mappedY == 180){
       mappedX = 180;
    }
    
    textSize(30);
    fill(150);
    text(int(mappedX)+("°"),180,405); 
    
    
    textSize(30);
    text("Servo 1: ",45,405);
    
    textSize(30);
    fill(150);
    text(int(mappedY)+("°"),180,440);
    
    textSize(30);
    text("Servo 2: ",45,440);
    
    mappedX = int(mappedX);
    mappedY = int(mappedY);
    
    println(mappedX +" , "+ mappedY);
    myPort.write(str(mappedX) + "," + str(mappedY) + "$");
    delay(500);
}
