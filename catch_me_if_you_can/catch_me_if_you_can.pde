/*
Project:   Catch Me If You Can
Author:    Ali Umut Koca
Date:      April 29, 2017
Ver:       alpha_v2
Thanks to: Chrisir, GoToLoop, koogs, kfrajer 
*/

//Time
int lastTimeCheck;
int startingTime;

//Level interval 
int INTERVAL = 3000; //every x secs gives +1 level

//Last level
int lastLevel = 0;

//Variables to create enemy balls (stupid and intelligent balls) every x sec
int lastTimeCheckStupidBall;
int INTERVAL_STUPID_BALL = 2000; //Every x secs spawns stupid ball
int lastTimeCheckIntelligenBall;
int INTERVAL_FOLLOWER_BALL = 20000; //Every x secs spawns stupid ball

//Diameter and radius of our ball
static final int FRIEND_DIAMETER = 30, FRIEND_RADIUS = FRIEND_DIAMETER >> 1 ;

//Bucket for stupid enemy balls
ArrayList<EnemyBall> balls;

//Bucket for intelligent follower enemy balls
ArrayList<FollowerEnemyBall> followingBalls;

//How many stupid enemy balls at start?
int enemyBallQuantity = 10;

//Game starts at false
boolean gameOver = false;

void setup () {
  //Standard Setup
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

  //test
  startingTime = millis();
}


void draw () {
  if (gameOver) {
    showGameOver();
  } else {
    showGame();
  }
}

void showGame() {
  background(#70C1B3);

  //Show the level on top left. Level is based on INTERVAL
  fill(255);
  textSize(height/25);
  textAlign(TOP);
  text("Level:" + (((millis() - startingTime) / INTERVAL)+1), height/40, height/19);

  //Get the created stupid enemy balls at start
  for (EnemyBall e : balls) {
    e.run();
  }

  //Create stupid enemy ball every 3 secs
  if ( millis() > lastTimeCheckStupidBall + INTERVAL_STUPID_BALL) {
    lastTimeCheckStupidBall = millis();
    balls.add(new EnemyBall());
  }

  //Get the created intelligent follower enemy balls
  for (FollowerEnemyBall f : followingBalls) {
    f.run();
  }

  //Create intelligent follower enemy ball every 5 secs
  if ( millis() > lastTimeCheckIntelligenBall + INTERVAL_FOLLOWER_BALL) {
    lastTimeCheckIntelligenBall = millis();
    followingBalls.add(new FollowerEnemyBall());
  }

  //Create our ball
  fill(#FF1654);
  stroke(255);
  strokeWeight(2);
  ellipse (mouseX, mouseY, FRIEND_DIAMETER, FRIEND_DIAMETER);
}

void showGameOver() {
  background(#FF5733);
  fill(255);

  textSize(height/10);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/2);

  textAlign(CENTER);
  textSize(height/20);
  text("\nPress SPACE to try again", width/2, height/2);

  //Show the last level on game
  textAlign(TOP);
  textSize(height/25);
  text("Highest Level:" + lastLevel, height/40, height/19);
}

//We start the game again
void keyPressed() {
  if (key==' ') {
    //Clears stupid and intelligent balls
    balls.clear();
    followingBalls.clear();
    //Makes game over true to false that game starts again
    gameOver = false;
    //Adds x quantity stupid balls at game start
    for (int i = 0; i < enemyBallQuantity; i++) {
      balls.add(new EnemyBall());
    }
    //Adds 1 intelligent ball at game start
    followingBalls.add(new FollowerEnemyBall());
    //Reset the level
    startingTime = millis();
  }
}