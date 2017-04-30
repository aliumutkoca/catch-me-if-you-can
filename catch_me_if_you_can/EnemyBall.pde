class EnemyBall {

  //Diameter and radius of enemy ball
  float ENEMY_DIAMETER = random(10, 30), ENEMY_RADIUS = ENEMY_DIAMETER / 2;
  static final float MIN_SPEED = .8, MAX_SPEED = 1;

  float enemyX = abs(random(ENEMY_RADIUS, width  - ENEMY_RADIUS) - (mouseX));
  float enemyY = abs(random(ENEMY_RADIUS, height - ENEMY_RADIUS) - (mouseY));

  float speedx = random(MIN_SPEED, MAX_SPEED) * (random(1) < .5? -1 : 1);
  float speedy = random(MIN_SPEED, MAX_SPEED) * (random(1) < .5? -1 : 1);

  void move() {
    if ((enemyX += speedx) < ENEMY_RADIUS || enemyX > width  - ENEMY_RADIUS)  speedx *= -1;
    if ((enemyY += speedy) < ENEMY_RADIUS || enemyY > height - ENEMY_RADIUS)  speedy *= -1;
  }

  void display() {
    ellipse(enemyX, enemyY, ENEMY_DIAMETER, ENEMY_DIAMETER);
  }

  //Enemy ball's distance to mouse
  boolean checkMouseInside() {
    return sqrt(sq(mouseX - enemyX) + sq(mouseY - enemyY)) < FRIEND_DIAMETER;
  }
}