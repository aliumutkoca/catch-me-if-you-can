//Follower Intelligent Enemy Ball
class FollowerEnemyBall {
  float ENEMY_DIAMETER = random(40, 60), ENEMY_RADIUS = ENEMY_DIAMETER / 2;
  float febX = width/2;
  float febY= height/2;
  void move () {
    febX = lerp(febX, mouseX, 0.001);
    febY = lerp(febY, mouseY, 0.001);
  }
  void display() {
    stroke(#5DD39E);
    strokeWeight(5);
    ellipse (febX, febY, ENEMY_DIAMETER, ENEMY_DIAMETER);
  }

  boolean checkMouseInside() {
    return sqrt(sq(mouseX - febX) + sq(mouseY - febY)) < ENEMY_DIAMETER;
  }
}