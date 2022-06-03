float y = 250;
float velocity = 0;
float restLength = 200;
float k  = 0.01;
float mass = 1;
void setup(){
  size(720,900);
}

void draw(){
  background(112, 50, 126);
  noStroke();
  fill(45,197,244);
  circle(300,y,64);
  float x = y - restLength;
  float force = -k*x;
  velocity +=force/mass;
  y+=velocity;
}
