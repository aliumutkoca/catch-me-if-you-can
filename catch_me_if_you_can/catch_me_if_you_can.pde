targetball tb;
followingball fb;
youlost yl;

color bgwin = #EADBCE;
color bglost = #9DBF9E;
color targetballcolor = #E76F51;
color followingballcolor = color(random(255), random(255), random(255));
float x = random(0, width);
float y = random(0, height);
float randomBallSize = random(25, 60);

void setup () {
  size(600, 300);
  background (bgwin);
  tb = new targetball();
  fb = new followingball();
  yl = new youlost();
}

void draw () {
  if ((int)(x+0.1) != mouseX) {
    fb.drawball();
    tb.drawball();
  } else {
    yl.yesilost();
  }
}