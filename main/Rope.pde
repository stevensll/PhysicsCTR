public class Rope{
  private float len;
  private PVector node;
  private PVector start;
  private PVector end;
  private float theta;
  private float nodeRadius = 10;
  private boolean disabled = false;
  private int col = 35;
  public Rope(PVector s, PVector e ){
    this.len = dist(s.x, s.y, e.x, e.y);
    this.node = s;
    this.start = s;
    this.end = e;
    this.theta = atan((end.x-start.x)/(end.y-start.y));
    this.disabled = false;
  }
  
  float getLength(){return this.len;}
  PVector getStartPos(){return this.start;}
  PVector getEndPos(){return this.end;}
  float getAngle(){return this.theta;}
  
  void setEndPos(PVector end){
     this.end = end;
  }
  void disable(){
    this.disabled = true;
    setCol(150);
  }
  boolean getDisabled(){
    return this.disabled;
  }
  float getLen(){
    return this.len;
  }
  void display(){
    displayNode();
    stroke(col);
    line(start.x, start.y, end.x, end.y);
    this.theta = atan((end.x-start.x)/(end.y-start.y));
  }
  void setCol(int col){
    this.col = col;
  }
  void displayNode(){
     stroke(60,40,10);
     circle(node.x, node.y, nodeRadius);
  }
}
