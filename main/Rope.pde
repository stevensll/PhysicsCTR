public class Rope{
  private float len;
  private PVector node;
  private PVector start;
  private PVector end;
  private float theta;
  private float nodeRadius = 20;
  private boolean disabled = false;
  private int col = 35;
  public Rope(PVector s, PVector e ){
    this.len = dist(s.x, s.y, e.x, e.y);
    this.node = s;
    this.start = s;
    this.end = e;
    this.theta = atan((end.x-start.x)/(end.y-start.y));
     if(end.x >=start.x && end.y < start.y){
      this.theta+=PI;
    } else if (end.x < start.x && end. y < start.y){
      this. theta-=PI;
    } 
    this.disabled = false;
  }
  
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
    if(end.x >=start.x && end.y < start.y){
      this.theta+=PI;
    } else if (end.x < start.x && end. y < start.y){
      this. theta-=PI;
    } 
  }
  void setCol(color col){
    this.col = col;
  }
  void displayNode(){
     fill(60,40,10);
     stroke(60,40,10);
     circle(node.x, node.y, nodeRadius);
  }
  void addSlack(float len){
    this.len+=len;
  }
}
