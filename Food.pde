class Food{
  int size;
  PVector pos;
  
  Food(PVector pos, int size){
    this.pos = pos;
    this.size = size;
  
  }
  
  void display(){
    fill(255,0,0);
    rect(this.pos.x,this.pos.y,this.size,this.size);
  }
 
  PVector getPos(){
    return this.pos;
  }
  
  void spawn(){
    this.pos.x = floor(random(width)/size) * size;
    this.pos.y = floor(random(height)/size) * size;
  }

}
