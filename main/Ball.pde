public class Ball{
  private float radius = 30;
  private PVector pos;
  private boolean idle;
  
  public Ball (PVector s){
    this.pos = s;
    this.idle = true;
  }
  void display(){
    stroke(0,153,0);
    fill(0,153,0);
    circle(pos.x,pos.y, radius);
  }
  boolean isIdle(){
    return this.idle;
  }
  void move(){
    this.idle = false;
  }
  void stop(){
    this.idle = true;
  }
  void setPos(float x, float y){
    this.pos.x = x;
    this.pos.y = y;
  }
  void updatePos(float x, float y){
    this.pos.x+=x;
    this.pos.y+=y;
  }
  PVector getPos(){
    return this.pos;
  }

}
