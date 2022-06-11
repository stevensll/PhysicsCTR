public class UI{
  public UI(){
  
  }
  void endScreen(boolean win){
  rectMode(CENTER);
  stroke(0);
  fill(192,40,10);
  rect(width/2,height/2,400,150,10);
  rect(width/2-125,height/2+150,150,75,10);
  rect(width/2+125,height/2+150,150,75,10);
  PFont font = createFont("bunga.otf", 120);
  fill(0);
  textFont(font);
  textAlign(CENTER);
  textSize(75);
  text("Return", width/2-125, height/2+175);
  text("Retry", width/2+125, height/2+175);
  textSize(200);
  if(win){
    text("VICTORY!", width/2, height/2+50);
    noLoop();
  }
  else {
      text("DEFEAT!", width/2, height/2+50);
  }
  if (mousePressed) {
    if (mouseX < width/2-50 && mouseX > width/2-200 && mouseY<height/2+150+75/2 && mouseY > height/2 +150-75/2) {
      gState = State.LVLS;
    }
     if (mouseX < width/2+50 && mouseX > width/2+200 && mouseY<height/2+150+75/2 && mouseY > height/2 +150-75/2) {
   
    }
  }
  void mainMenu() {
    PFont font = createFont("bunga.otf", 120);
    fill(0);
    textFont(font);
    textAlign(CENTER);
    background(152, 190, 100);
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
    background(152, 190, 100);
    fill(152, 84, 62);
    stroke(152, 84, 62);
    rectMode(CENTER);
    rect(width/3-75, height/3-75, 150, 150, 10);
    rect(width/2, height/2, 150, 150, 10);
    rect(2*width/3+75, 2*height/3+75, 150, 150, 10);
    rect(width/2-200, height/2+300, 200,50,10);
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
    text("Return", width/2-200, height/2+315);
  }
  void levelsButton() {
      if (mousePressed) {
        //LEVEL 1
        if (mouseX < width/2+75 && mouseX > width/2-75 && mouseY<height/2+75 && mouseY > height/2-75) {
          gState = State.L1;
        }
        //LEVEL 2
        if (mouseX < width/3 && mouseX > width/3-150 && mouseY<height/3 && mouseY > height/3-150) {
            gState = State.L2;
        }
        //LEVEL3
        if (mouseX < 2*width/3+150&& mouseX > 2*width/3 && mouseY<2*height/3+150 && mouseY > 2*height/3) {
            gState = State.L3;
        }
        //RETURN
        if (mouseX < width/2-100&& mouseX > width/2-300 && mouseY<height/2+325 && mouseY > height/2+275) {
          gState = State.MAIN;
        }
      }
  }
}
