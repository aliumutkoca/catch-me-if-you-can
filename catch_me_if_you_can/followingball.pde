class followingball {
  void drawball() {
    background (bgwin);
    stroke(255);
    strokeWeight(2);
    fill(followingballcolor);
    ellipse(x, y, randomBallSize, randomBallSize);
    
    x = lerp(x, mouseX, 0.1);
    y = lerp(y, mouseY, 0.1);
    println (x, mouseX);
  }
}