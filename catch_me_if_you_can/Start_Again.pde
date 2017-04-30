//We start the game again
void keyPressed() {
  if (key==' ') {
    balls.clear();
    followingBalls.clear();
    for (int i = 0; i < enemyBallQuantity; i++) {
      balls.add(new EnemyBall());
    }
    followingBalls.add(new FollowerEnemyBall());
  }
}