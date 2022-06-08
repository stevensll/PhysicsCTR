float angle=PI/2;
float angleV=0;
float angleA=0;
float force;
float len;
float gravity = 0.01;
PVector ball;

void setup(){
  size(720,900);
  ball = new PVector(width/2,height/2);
  len = 175;

}

void draw(){
  background(112, 50, 126);
  strokeWeight(5);
  stroke(255);
  force = gravity * sin(angle);
  angleA = -1*force;
  angleV+=angleA;
  angle+=angleV;
  angleA*=0.99;
  ball.x = len * sin(angle) + width/2;
  ball.y = len * cos(angle) + height/2;
  line(width/2,height/2,ball.x,ball.y);
  circle(ball.x,ball.y,20);
  
}
