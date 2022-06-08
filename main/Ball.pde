public class Ball{
  private float radius = 50;
  private PVector pos;
  
  public Ball (float xcor, float ycor, float angle){
    this.pos.x = xcor;
    this.pos.y = ycor;
    this.pos.z = angle;
  }
  void display(){
    circle(pos.x,pos.y, radius);
  }
  void setPos(float x, float y){
    this.pos.x = x;
    this.pos.y = y;
  }
  PVector getPos(){
    return this.pos;
  }


}
