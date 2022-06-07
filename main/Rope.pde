public class Rope{
  private float l;
  private PVector start;
  private PVector end;
  
  public Rope(float l, PVector s, PVector e ){
    this.l = l;
    this.start = s;
    this.end = e;
  }
  
  float getLength(){return this.l;}
  PVector getStartPos(){return this.start;}
  PVector getEndPos(){return this.end;}
  
  void display(){
    stroke(30,30,30);
    line(start.x, start.y, end.x, end.y);
  }
}
