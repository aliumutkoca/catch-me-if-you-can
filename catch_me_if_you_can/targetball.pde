class targetball {
  void drawball() {
    stroke(255);
    strokeWeight(2);
    fill(targetballcolor);
    ellipse(mouseX, mouseY, 60, 60);
  }
}