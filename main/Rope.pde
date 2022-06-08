public class Rope{
  private float l;
  private PVector start;
  private PVector end;
  private float theta;
  
  public Rope(float l, PVector s, PVector e ){
    this.l = l;
    this.start = s;
    this.end = e;
    this.theta = atan((end.y-start.y)/(end.x-start.x));
  }
  
  float getLength(){return this.l;}
  PVector getStartPos(){return this.start;}
  PVector getEndPos(){return this.end;}
  
  void display(){
    stroke(30,30,30);
    line(start.x, start.y, end.x, end.y);
    print(degrees(theta));
  }
}
