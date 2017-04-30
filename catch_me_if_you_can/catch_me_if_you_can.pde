//Time
int lastTimeCheck;

//Diameter and radius of our ball
static final int FRIEND_DIAMETER = 30, FRIEND_RADIUS = FRIEND_DIAMETER >> 1 ;

//Bucket for stupid enemy balls
ArrayList<EnemyBall> balls;

//Bucket for intelligent follower enemy balls
ArrayList<FollowerEnemyBall> followingBalls;

//How many stupid enemy balls at start?
int enemyBallQuantity = 10;

void setup () {
  //Standart Setup
  size (600, 400);
  surface.setResizable(true);
  frameRate(60);
  smooth();
  noCursor();

  //Create stupid enemy balls and ArrayList for those
  balls = new ArrayList<EnemyBall>();
  for (int i = 0; i < enemyBallQuantity; i++) {
    balls.add(new EnemyBall());
  }

  //Create intelligent follower enemy balls and ArrayList for those
  followingBalls = new ArrayList<FollowerEnemyBall>();
  followingBalls.add(new FollowerEnemyBall());
}

void draw () {
  background(#70C1B3);

  //Show the level on top left. Level is based on INTERVAL
  int INTERVAL = 3000;
  fill(255);
  textSize(height/25);
  textAlign(TOP);
  text("Level:" + millis()/INTERVAL, height/40, height/19);

  //Get the created stupid enemy balls at start
  for (EnemyBall c : balls) {
    c.move();
    c.display();
    if (c.checkMouseInside()) {
      println("Game Over!");
    }
  }

  //Create stupid enemy ball every 3 secs
  if ( millis() > lastTimeCheck + INTERVAL) {
    lastTimeCheck = millis();
    balls.add(new EnemyBall());
  }

  //Get the created intelligent follower enemy balls
  for (FollowerEnemyBall f : followingBalls) {
    f.move();
    f.display();
    if (f.checkMouseInside()) {
      println("Intelligent Ball Got You!");
    }
  }

  //Create stupid enemy ball every 3 secs
  if ( millis() > lastTimeCheck + INTERVAL) {
    lastTimeCheck = millis();
    followingBalls.add(new FollowerEnemyBall());
  }

  //Create our ball
  fill(#FF1654);
  stroke(255);
  strokeWeight(2);
  ellipse (mouseX, mouseY, FRIEND_DIAMETER, FRIEND_DIAMETER);
}