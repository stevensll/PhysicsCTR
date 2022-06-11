public class UI{
  Levels lvls;
  PImage mainbg;
  PImage levelsbg;
  PImage lvl1bg;
  PImage lvl2bg;
  PImage lvl3bg;
  public UI(){
    lvls = new Levels();
    mainbg = loadImage("bg/sun.jpg");
    levelsbg = loadImage("bg/city.jpg");
    lvl1bg = loadImage("bg/sun2.jpg");
    lvl2bg = loadImage("bg/ocean.jpg");
    lvl3bg = loadImage("bg/lily.jpg");
  }
    void gameButtons(){
    rectMode(CENTER);
    stroke(0);
    fill(192,40,10);
    rect(width/2-125,height/2-400,150,75,10);
    rect(width/2+125,height/2-400,150,75,10);
    PFont font = createFont("bunga.otf", 120);
    fill(0);
    textFont(font);
    textAlign(CENTER);
    textSize(75);
    text("LEVELS", width/2-125, height/2-385);
    text("Retry", width/2+125, height/2-385);
    textSize(200);
    if (mousePressed) {
        //GO TO LEVELS MENU
        if (mouseX < width/2-50 && mouseX > width/2-200 && mouseY<height/2-400+75/2 && mouseY > height/2-400-75/2) {
          gState = State.LVLS;
          reset();
        }
        //RESTART THE LEVEL
       if (mouseX > width/2+50 && mouseX < width/2+200 && mouseY<height/2-400+75/2 && mouseY > height/2-400-75/2) {
         reset();
         switch(gState){
            case L1:
              lvls.makeLVL1();
              break;
            case L2:
              lvls.makeLVL2();
              break;
            case L3:
              lvls.makeLVL3();
              break;
          }
        }
      }
    }
  void endScreen(boolean win){
    rectMode(CENTER);
    stroke(0);
    fill(192,40,10);
    rect(width/2,height/2,400,150,10);
    PFont font = createFont("bunga.otf", 120);
    fill(0);
    textFont(font);
    textAlign(CENTER);
    textSize(75);
    textSize(200);
    if(win){
      stroke(0);
      fill(121,238,115);
      rect(width/2,height/2,400,150,10);
      fill(0);
      text("VICTORY!", width/2, height/2+50);
      lonzo.stop();
    }
    else {
        stroke(0);
        fill(192,40,10);
        rect(width/2,height/2,400,150,10);
        fill(0);
        text("DEFEAT!", width/2, height/2+50);
        lonzo.stop();
    }
  }
  void mainMenu() {
    PFont font = createFont("bunga.otf", 120);
    fill(0);
    textFont(font);
    textAlign(CENTER);
    background(mainbg);
    textSize(300);
    text("Cut", width/2, height/2-270);
    textSize(100);
    text("the", width/2, height/2-200);
    textSize(300);
    text("Rope", width/2, height/2-50);
    textSize(50);
    text("(Remixed)", width/2, height/2);
    textSize(60);
    text("Steven Lei and Jeremy Wong", width/2, height/2+350);
    text("AP Physics Pd. 5", width/2, height/2+400);
    rectMode(CENTER);
    fill(152, 84, 62);
    stroke(152, 84, 62);
    rect(width/2, height/2+150, 300, 150, 10);
    fill(0);
    textSize(200);
    text("Play", width/2, height/2+200);
  }
  void mainButton() {
    if (mousePressed) {
      if (mouseX < width/2 + 150 && mouseX > width/2-150 && mouseY<height/2+225 && mouseY > height/2 +75) {
        gState = State.LVLS;
      }
    }
  }
  void levelsMenu() {
    background(levelsbg);
    fill(152, 84, 62);
    stroke(152, 84, 62);
    rectMode(CENTER);
    rect(width/3-75, height/3-75, 150, 150, 10);
    rect(width/2, height/2, 150, 150, 10);
    rect(2*width/3+75, 2*height/3+75, 150, 150, 10);
    rect(width/2-200, height/2+400, 200,50,10);
    PFont font = createFont("bunga.otf", 120);
    fill(0);
    textFont(font);
    textAlign(CENTER);
    textSize(150);
    text("Levels", width/2, 100);
    textSize(200);
    text("1", width/3-75, height/3-25);
    text("2", width/2, height/2+50);
    text("3", 2*width/3+75, 2*height/3+125);
    textSize(50);
    text("Return", width/2-200, height/2+415);
  }
  void levelsButton() {
      if (mousePressed) {
        //LEVEL 1
        if (mouseX < width/3 && mouseX > width/3-150 && mouseY<height/3 && mouseY > height/3-150) {
            reset();
            gState = State.L1;
            lvls.makeLVL1();
        }
        //LEVEL 2
        if (mouseX < width/2+75 && mouseX > width/2-75 && mouseY<height/2+75 && mouseY > height/2-75) {
            reset();
           gState = State.L2;
           lvls.makeLVL2();
        }
        //LEVEL3
        if (mouseX < 2*width/3+150&& mouseX > 2*width/3 && mouseY<2*height/3+150 && mouseY > 2*height/3) {
            reset();
            gState = State.L3;
        }
        //RETURN
        if (mouseX < width/2-100&& mouseX > width/2-300 && mouseY<height/2+425 && mouseY > height/2+375) {
          gState = State.MAIN;
        }
      }
  }
}
