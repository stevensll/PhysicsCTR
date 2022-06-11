public class Levels{
  public Levels(){
  
  }
  void makeLVL1(){
  
  }
  void makeLVL2(){
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
    scoreLoc =new PVector (width/2+200, height/2+300);
  }
  void makeLVL3(){
  
  }

}
