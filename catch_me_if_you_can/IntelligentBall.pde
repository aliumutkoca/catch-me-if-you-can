//Follower Intelligent Enemy Ball
class FollowerEnemyBall {
  float INT_ENEMY_DIAMETER = random(40, 60), INT_ENEMY_RADIUS = INT_ENEMY_DIAMETER/2;
  float febX = width/2;
  float febY= height/2;
  float followSpeedX = random(0.0001, 0.01);
  float followSpeedY = random(0.0001, 0.01);

  void run() {
    move();
    display();
    gameManager();
  }

  void move() {
    febX = lerp(febX, mouseX, followSpeedX);
    febY = lerp(febY, mouseY, followSpeedY);
  }
  void display() {
    stroke(#5DD39E);
    strokeWeight(5);
    ellipse (febX, febY, INT_ENEMY_DIAMETER, INT_ENEMY_DIAMETER);
  }

  void gameManager() {
    if (sqrt(sq(mouseX - febX) + sq(mouseY - febY)) <= FRIEND_RADIUS + INT_ENEMY_RADIUS + 5) {
      gameOver = true;
      lastLevel = int(millis()/INTERVAL);
    }
  }
}//Class ends