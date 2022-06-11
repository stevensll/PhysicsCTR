//GAME ENGINE
Physics phys;
UI ui;
enum State{
  MAIN,
  LVLS,
  L1,
  L2,
  L3,
}
State gState;
//

//CONSTANTS
float gravity = .9;
float gravityT = 0.4;
//

float angle, angleV, angleA;
float force;
float len;
float veloX, veloY;

PVector scoreLoc;
Ball lonzo;
Rope rope1;
Rope rope2;
Rope rope3;
Rope chosen;

ArrayList<PVector> Inters = new ArrayList<PVector>();
ArrayList<Rope> Ropes = new ArrayList<Rope>();
boolean empty = true;

void setup() {
  frameRate(60);
  size(720, 900);
  ui = new UI();
  phys = new Physics();
  gState = State.MAIN;
  reset();
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
     ui.gameButtons();
     break;
   case L2:
     game();
     ui.gameButtons();
     break;
   case L3:
     game();
     ui.gameButtons();
     break;
  }
}

void reset(){
  angle = 0;
  angleV = 0;
  angleA =0;
  force = 0;
  len = 0;
  veloX = 0;
  veloY = 0;
  chosen = null;
  Ropes.clear();
  Inters.clear();
  empty = true;
}

void game() {
  background(112, 50, 126);
  strokeWeight(5);
  stroke(255);
  rope1.display();
  rope2.display();
  rope3.display();
  lonzo.display();
  
  //BUTTONS
  rectMode(CENTER);
  rect(scoreLoc.x, scoreLoc.y, 100, 100);
  line(scoreLoc.x+50, scoreLoc.y+50, scoreLoc.x-50,scoreLoc.y-50);
  if (lonzo.getPos().x<scoreLoc.x+50 && lonzo.getPos().x>scoreLoc.x-50 && lonzo.getPos().y+lonzo.radius < scoreLoc.y+50 && lonzo.getPos().y > scoreLoc.y-50) {
    ui.endScreen(true);
    //noLoop();
  } else if(lonzo.getPos().x-lonzo.radius > width || lonzo.getPos().x+lonzo.radius < 0 || lonzo.getPos().y-lonzo.radius > height || lonzo.getPos().y+lonzo.radius < 0){
    ui.endScreen(false);
    //noLoop();
  }
  //
  
  if (mousePressed) {
    line(mouseX, mouseY, pmouseX, pmouseY);
    for (int i = 0; i < Ropes.size(); i ++) {
      Inters.set(i, phys.lineCollision(mouseX, mouseY, pmouseX, pmouseY, Ropes.get(i).getStartPos().x, Ropes.get(i).getStartPos().y, Ropes.get(i).getEndPos().x, Ropes.get(i).getEndPos().y));
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
