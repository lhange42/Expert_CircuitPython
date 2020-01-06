int xPos = 150;
int yPos = 150;

int xSpeed = 5;
int ySpeed = 5;

int screenH = 300;
int screenW = 400;

int radius = 25;

void setup(){
  size(300, 400);
}

void draw(){
  background(0);
  ellipse(xPos, yPos, 50, 50);
  fill(0,0,255);
  
  xPos = xPos + xSpeed;
  yPos = yPos + ySpeed;

  if (xPos >= screenH - radius || xPos <= 0 + radius){
    xSpeed = xSpeed * -1;
  }
  
  if (yPos >= screenW - radius || yPos <= 0 + radius){
    ySpeed = ySpeed * -1;
  }

  println("Hello World");
  
}
