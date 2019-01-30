/* Tributo al Snake implementado por Lic. García Héctor ¯\(°_o)/¯  */

ArrayList<SnakePiece> snakePieces = new ArrayList<SnakePiece>();
Food food;

int speedX = 0;
int speedY = 0;
int size = 25;
int backgroundSize = 20;
boolean gameOver = false;

//Construcción del fondo de la grilla
void setBackground() {
  boolean flag = false;
  for (int i=0; i<width; i+=size) {
    flag = !flag;
    noStroke();
    for (int j=0; j<height; j+=size) {
      if (flag == true) {
        fill(255);
        flag = !flag;
      } else {
        fill(150);
        flag = !flag;
      }
      rect(i, j, size, size);
    }
  }
}

void setup() {
  size(800, 800);
  setBackground();
  PVector foodPos = new PVector(floor(random(width)/size) * size, floor(random(height)/size) * size);
  snakePieces.add(new SnakePiece(new PVector(0, 0), size));
  food = new Food(foodPos, size);
  food.display();
}

void draw() {
  if (isGameOver(snakePieces.get(0).getPos()) || gameOver){
    gameOver = true;
    fill(0, 102, 153);
    textSize(32);
    text("Game over", 320, height/2);
    text("Presione q para salir del programa", 150, height/2 + 50);
    noLoop();
  }
  frameRate(7);
  //Pinto el cuadrado anterior del color correspondiente
  noStroke();
  food.display();

  for (int i=0; i<snakePieces.size(); i++) {
    if (i == 0) {
      snakePieces.get(i).clearPath();
      snakePieces.get(i).move(speedX, speedY);
      if(snakePieces.get(0).eatHimSelf(snakePieces)){
         gameOver = true;
      }
      //Colisiono con la comida
      if (dist(food.getPos().x, food.getPos().y, snakePieces.get(0).getPos().x, snakePieces.get(0).getPos().y) == 0) {
        food.spawn();
        snakePieces.add(new SnakePiece(new PVector(snakePieces.get(snakePieces.size()-1).getPrevPos().x, snakePieces.get(snakePieces.size()-1).getPrevPos().y), size));
      }
      snakePieces.get(i).display();
    } else {
      snakePieces.get(i).clearPath();
      snakePieces.get(i).setPos(snakePieces.get(i-1).getPrevPos());
      snakePieces.get(i).display();
    }
  }
}

boolean isGameOver(PVector pos){
  return (pos.x > width || pos.x < 0 || pos.y > height || pos.y < 0);
}

void keyPressed() {
  if (key == 'a' || key=='A') {
    speedX = -1;
    speedY = 0;
  } else if (key == 'd'|| key=='D') {
    speedX = 1;
    speedY = 0;
  } else if (key == 'w' || key=='W') {
    speedX = 0;
    speedY = -1;
  } else if (key == 's' || key=='S') {
    speedX = 0;
    speedY = 1;
  } else if ((key == 'q' || key=='Q') && gameOver) {
    exit();
  }
}
