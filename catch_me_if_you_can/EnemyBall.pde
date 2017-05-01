//Enemyball
class EnemyBall {

  //Diameter and radius of enemy ball
  float STUPID_INT_ENEMY_DIAMETER = random(10, 30), STUPID_ENEMY_RADIUS = STUPID_INT_ENEMY_DIAMETER / 2;
  static final float MIN_SPEED = .8, MAX_SPEED = 1;

  float enemyX = abs(random(STUPID_ENEMY_RADIUS, width  - STUPID_ENEMY_RADIUS) - (mouseX));
  float enemyY = abs(random(STUPID_ENEMY_RADIUS, height - STUPID_ENEMY_RADIUS) - (mouseY));

  float speedx = random(MIN_SPEED, MAX_SPEED) * (random(1) < .5? -1 : 1);
  float speedy = random(MIN_SPEED, MAX_SPEED) * (random(1) < .5? -1 : 1);

  void run() {
    move();
    display();
    gameManager();
  }

  void move() {
    if ((enemyX += speedx) < STUPID_ENEMY_RADIUS || enemyX > width  - STUPID_ENEMY_RADIUS)  speedx *= -1;
    if ((enemyY += speedy) < STUPID_ENEMY_RADIUS || enemyY > height - STUPID_ENEMY_RADIUS)  speedy *= -1;
  }

  void display() {
    ellipse(enemyX, enemyY, STUPID_INT_ENEMY_DIAMETER, STUPID_INT_ENEMY_DIAMETER);
  }

  void gameManager() {
    if (sqrt(sq(mouseX - enemyX) + sq(mouseY - enemyY)) <= FRIEND_RADIUS + STUPID_ENEMY_RADIUS + 5) {
      gameOver = true;
      lastLevel = int(millis()/INTERVAL);
    }
  }
}//Class ends