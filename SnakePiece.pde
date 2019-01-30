class SnakePiece {
  PVector pos;
  PVector prevPos;
  int size;

  SnakePiece(PVector pos, int size) {
    this.pos = pos;
    this.prevPos = new PVector(0, 0);
    this.size = size;
  }
  
  //Mantiene el aspecto de la grilla de fondo
  void clearPath() {
    if ((pos.x%2==0 && pos.y %2==0) || (pos.x%2==1 && pos.y %2==1)) {
      fill(255);
    } else {
      fill(150);
    }
    noStroke();
    rect(pos.x, pos.y, this.size, this.size);
  }

  void display() {
    fill(0);
    noStroke();
    rect(pos.x, pos.y, this.size, this.size);
  }

  void move(int speedX, int speedY) {
    this.prevPos.x = this.pos.x;
    this.prevPos.y = this.pos.y;
    this.pos.x = this.pos.x + speedX * this.size;
    this.pos.y = this.pos.y + speedY * this.size;
  }

  PVector getPos() {
    return this.pos;
  }
  
  void setPos(PVector pos){
    this.prevPos.x = this.pos.x;
    this.prevPos.y = this.pos.y;
    this.pos.x = pos.x;
    this.pos.y = pos.y;
  }

  PVector getPrevPos() {
    return this.prevPos;
  }

  boolean eatHimSelf(ArrayList<SnakePiece> snakePieces){
    boolean res = false;
    int size = snakePieces.size();
    for(int i=0;i<size-1;i++){
      if(dist(this.pos.x,this.pos.y,snakePieces.get(i+1).getPos().x,snakePieces.get(i+1).getPos().y)==0){
        res = true;
      }
    }
    return res;
  }

}
