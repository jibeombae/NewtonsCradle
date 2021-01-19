import g4p_controls.*;

int numBalls = 5;
int radBalls = 20;
int xMid;
int yMid;
float xCord;
float yCord;
float[] xStart;
boolean bool1 = true;
boolean bool2 = false;
boolean bool3 = true;
int last;
float lift = 50;
Ball[] balls;
int a = 1;
boolean start = false;
boolean reset = false;
boolean lost1 = false;
boolean lost2 = false;
float stringLength = 100;
float energyLoss = 0;
float floatLift;
boolean changing=false;
PImage bg;
float fr = 60;
int x = 0;
boolean res = false;
float theta1;
float theta2;
float length2 = 100;
float xCord2 , yCord2;
boolean doublep = false;

void setup(){
  createGUI();
  frameRate(fr);
  size(600,600);
  bg = loadImage("milkyway.png");  //background
  background(bg);
  xMid = width/2;
  yMid = height/2;
  
  setValues();  //calls function that sets initial values
  
}

void setValues(){  //sets initial values (where the balls start)
  floatLift = lift;
  radBalls = 30-(2*numBalls);  //changes the radius of balls according to how many there are
  xCord = xMid - ((numBalls-1)*radBalls);  //starting x coordinates of the balls
  balls = new Ball[numBalls];
  for(int n = 0; n < numBalls; n++){  //sets the individual y values
    yCord = yMid-stringLength + sqrt(pow(stringLength,2)-pow(xCord + (n*2*radBalls),2));
    balls[n] = new Ball(xCord + (n*2*radBalls), yMid, n);
  }
  
  for(int s = 0; s < a; s++){  //the x and y values of balls that are lifted up
    balls[s].xCord -= lift;
    balls[s].yCord = yMid - stringLength + sqrt(pow(stringLength,2)-pow(balls[s].xCord-balls[s].startx,2));
  }
  last = numBalls-1;
  theta1=tan(lift/(yMid-balls[0].yCord));
  theta2=theta1;
  xCord2 = balls[0].xCord;
}

int fracValue(){
  int ans = 1;
  for(int i = 2; i<lift/10+1; i++){
    ans += i;
  }
  return ans;
}

void draw(){
  background(bg);
  if(bool3){
    for(int q = 0; q < a; q++){
      balls[q].calculate();
    }
  }
  else{
    for(int q = last; q > last - a; q--){
      balls[q].calculate();
    }
  }
  fill(149,85,0);  //title box
  rect(balls[0].startx-10, yMid-stringLength-20, balls[last].startx-balls[0].startx+20, 20);
  fill(133,87,35);
  rect(50,450,500,100);
  fill(185,156,107);
  rect(60,460,480,80);
  fill(92,64,51);
  textSize(50);
  text("Jibeom's Cradle", 115, 515);
  for(int i = 0; i < numBalls; i++){
    balls[i].drawBall();
  }
  if(doublep && numBalls == 1){
    doubleP();
  }
}
