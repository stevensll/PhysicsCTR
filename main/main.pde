float angle;
float angleV=0;
float angleA=0;
float force;
float len;
float gravity = .9;
float gravityT = 0.4;
float veloX = 0;
float veloY = 0;
PVector ball;
PVector Box;
enum State{
  MAIN,
  LVLS,
  L1,
  L2,
  L3,
}
State gState;
//PVector inter = new PVector(0, 0);

Ball lonzo;
Rope rope1;
Rope rope2;
Rope rope3;
Rope chosen;
UI ui;
ArrayList<PVector> Inters = new ArrayList<PVector>();
boolean empty = true;

ArrayList<Rope> Ropes = new ArrayList<Rope>();
//Ropes.add(rope1);
//Ropes.add(rope2);
//Ropes.add(rope3);

void setup() {
  ui = new UI();
  frameRate(60);
  size(720, 900);
  gState = State.MAIN;
  PVector ballStart = new PVector(width/2-250, height/2);
  rope1 = new Rope(new PVector(width/2-300, height/2-200), ballStart);
  rope2 = new Rope(new PVector(width/2 + 300, height/2-200), ballStart);
  rope3 = new Rope(new PVector(width/2, height/2-200), ballStart);
  lonzo = new Ball(ballStart);
  for (int i = 0; i < 3; i++) {
    Inters.add(new PVector(0, 0));
  }
  Ropes.add(rope1);
  Ropes.add(rope2);
  Ropes.add(rope3);
  chosen = new Rope(new PVector(0, 0), new PVector(0, 0));
  len = 9999;
  Box =new PVector (width/2+200, height/2+300);
}



void draw() {
  print(gState);
  switch(gState){
    case MAIN:
      ui.mainMenu();
      ui.mainButton();
      break;
    case LVLS:
      ui.levelsMenu();
      ui.levelsButton();
      break;  
    case L1:
     game();
     break;
   case L2:
     game();
     break;
   case L3:
     game();
     break;
  }
}

void reset(){


}

void game() {
  background(112, 50, 126);
  strokeWeight(5);
  stroke(255);
  rope1.display();
  rope2.display();
  rope3.display();
  lonzo.display();
  rectMode(CENTER);
  rect(Box.x, Box.y, 100, 100);
  line(Box.x+50, Box.y+50, Box.x-50,Box.y-50);
  if (lonzo.getPos().x<Box.x+50 && lonzo.getPos().x>Box.x-50 && lonzo.getPos().y+lonzo.radius < Box.y+50 && lonzo.getPos().y > Box.y-50) {
    endScreen(true);
    //noLoop();
  } else if(lonzo.getPos().x-lonzo.radius > width || lonzo.getPos().x+lonzo.radius < 0 || lonzo.getPos().y-lonzo.radius > height || lonzo.getPos().y+lonzo.radius < 0){
    endScreen(false);
    //noLoop();
  }
  if (mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
    for (int i = 0; i < 3; i ++) {
      Inters.set(i, lineCollision(mouseX, mouseY, pmouseX, pmouseY, Ropes.get(i).getStartPos().x, Ropes.get(i).getStartPos().y, Ropes.get(i).getEndPos().x, Ropes.get(i).getEndPos().y));
    }
  }
  stroke(130);
  for (int i = 0; i <Ropes.size(); i++) {
    if (Inters.get(i).x!=0.0 && Inters.get(i).y!=0.0) {
      circle(Inters.get(i).x, Inters.get(i).y, 10);
      Ropes.get(i).disable();
      Ropes.get(i).setEndPos(Inters.get(i));
      lonzo.move();
    }
  }
  if (!lonzo.isIdle()) {
    for (Rope rope : Ropes) {
      if (!rope.getDisabled()) {
        empty = false;
        rope.setEndPos(lonzo.getPos());
        if (rope.getLen() < len) {
          len = rope.getLen();
          chosen = rope;
        }
      }
    }


    len =999;
    if (chosen !=null &&!empty) {
      chosen.setCol(250);
      angle = chosen.getAngle();
      force = gravity * sin(angle);
      angleA = -1*force/chosen.getLength();
      angleV+=angleA;
      angle+=angleV;
      angleV*=0.99;
      float newX = chosen.getStartPos().x+dist(chosen.getStartPos().x, chosen.getStartPos().y, chosen.getEndPos().x, chosen.getEndPos().y )* sin(angle);
      float newY = chosen.getStartPos().y+dist(chosen.getStartPos().x, chosen.getStartPos().y, chosen.getEndPos().x, chosen.getEndPos().y )* cos(angle);
      chosen.setEndPos(new PVector(newX, newY));
      lonzo.setPos(newX, newY);
    }
    if (empty) {
      print(angleV + "\n");
      veloX=sqrt(2*gravity)*sin(angle);
      veloY+=gravityT;
      lonzo.updatePos(veloX, veloY);
    }
    empty = true;
  }
}

PVector lineCollision(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4) {
  float uA = ((x4-x3)*(y1-y3) - (y4-y3)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
  float uB = ((x2-x1)*(y1-y3) - (y2-y1)*(x1-x3)) / ((y4-y3)*(x2-x1) - (x4-x3)*(y2-y1));
  if (uA >= 0 && uA <= 1 && uB >= 0 && uB <= 1) {
    float intersectionX = x1 + (uA * (x2-x1));
    float intersectionY = y1 + (uA * (y2-y1));
    return new PVector(intersectionX, intersectionY);
  }
  return new PVector(0, 0);
}

}
