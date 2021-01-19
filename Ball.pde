class Ball{
  float xCord;
  float yCord;
  int ballNum;
  float startx;
  float starty;
  
  Ball(float x, float y, int bn){
    this.xCord = x;
    this.startx = x;
    this.yCord = y;
    this.starty = y;
    this.ballNum = bn;
  }
  
  void calculate(){
    if(start && !changing){  //run if user clicks start and they are not currently changing slider values
      if(this.xCord<this.startx && bool1 && !bool2 && bool3){  //animates until lifted balls drop to the middle
        this.xCord += sqrt(1-((yMid-this.yCord)/(stringLength - sqrt(pow(stringLength,2)-pow(lift,2)))-0.1));
        this.yCord = yMid-stringLength + sqrt(pow(stringLength,2)-pow(this.xCord-this.startx,2));
      }
      else{
        if(!res){
          balls[ballNum].yCord=balls[ballNum].starty;
        }
        res = true;
        bool3 = false;
        if(!lost1){
          if(lift>0 && numBalls>1 && a != numBalls && !bool3){  //decreases how high the balls go simulating energy loss
            floatLift*=1-(0.01*energyLoss);
            lift=round(floatLift);
          }
          lost1 = true;
        }
        if(this.xCord < this.startx + lift && bool1 && !bool3){  //animates until the balls swing to the right end
          bool2 = true;
          this.xCord += sqrt(1-((yMid-this.yCord)/(stringLength - sqrt(pow(stringLength,2)-pow(lift,2)))-0.1));
          this.yCord = yMid-stringLength + sqrt(pow(stringLength,2)-pow(this.xCord-this.startx,2));
        }
        else{
          if(this.xCord > this.startx && bool2 && !bool3){  //animates until balls come to the middle again
            bool1 = false;
            this.xCord -= sqrt(1-((yMid-this.yCord)/(stringLength - sqrt(pow(stringLength,2)-pow(lift,2)))-0.1));
            this.yCord = yMid-stringLength + sqrt(pow(stringLength,2)-pow(this.xCord-this.startx,2));
          }
          else{
            bool3=true;
            if(!lost2){
              if(lift>0 && numBalls>1 && a != numBalls && bool3){  //energy loss
                floatLift*=1-(0.01*energyLoss);
                lift=round(floatLift);
              }
              lost2 = true;
            }
            bool2 = false;
            if(this.xCord > this.startx - lift && bool3){  //animates until the balls go to left end
              this.xCord-= sqrt(1-((yMid-this.yCord)/(stringLength - sqrt(pow(stringLength,2)-pow(lift,2)))-0.1));
              this.yCord = yMid-stringLength + sqrt(pow(stringLength,2)-pow(this.xCord-this.startx,2));
            }
            else{
              bool1 = true;  //resets boolean values
              bool2 = false;
              lost1 = false;
              lost2 = false;
              bool3 = true;
              res = false;
              
            }
          }
        }
      }
    }
    else{
      setValues();  //constantly show the values changing as the user changes them
    }
  }
  
  void drawBall(){
    fill(0);
    circle(this.xCord, this.yCord, 2*radBalls);
    line(this.startx, yMid-stringLength, this.xCord, this.yCord);
  }
}

void doubleP(){
  if(numBalls==1 && start){
    fill(0);
    xCord2 = balls[0].xCord - 100*sin(theta2);
    yCord2 = balls[0].yCord+100*cos(theta2);
    circle(xCord2, yCord2, 2*radBalls);
    
    if(theta2>=0){
      balls[0].xCord+= 0.003*(balls[0].xCord-xCord2);
    }
    else{
      balls[0].xCord-= 0.003*(balls[0].xCord-xCord2);;
    }
    theta2 = cos(theta1);
    theta1 += PI/72;
    
    line(balls[0].xCord - 100*sin(theta2),  balls[0].yCord+100*cos(theta2), balls[0].xCord, balls[0].yCord);
  }
}


  
  
