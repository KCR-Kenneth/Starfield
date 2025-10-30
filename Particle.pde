class Particle {
  private float myX, myY, myS, myA;
  private int myC;
  public Particle() {
    myX = 0;
    myY = 0;
    myS = (float)(Math.random()*3+1);
    myA = (float)(Math.random()*2*Math.PI);
    myC = color((int)(Math.random()*80 +60), 0, 0);
  }
  
  public void move() {
    if ((tic < 64 || tic > 512 - 64) && (!(getDistance() < 30*scale) || Math.random() >= 0.5)) {
      myX-=2*cos(myA);
      myY-=2*sin(myA);
    } else if (getDistance() < 110*scale) {
      myX+=myS*cos(myA);
      myY+=myS*sin(myA);
    } else if (getDistance() < 190*scale) {
      myX+=0.5*myS*cos(myA);
      myY+=0.5*myS*sin(myA);
    }
  }
  
  public void show() {
    pushMatrix();
      translate(myX, myY,0);
      fill(myC);
      noStroke();
      sphere(10);
    popMatrix();
  }
  
  public void redirect() {
    if (getDistance() >= 190*scale) {
      setmyX(getmyX() - getmyX()/20);
      setmyY(getmyY() - getmyY()/20);
      setmyA((float)(Math.random()*PI+PI/2)+getmyA());
    }
  }
  
  public float getDistance() {
    return sqrt(getmyX()*getmyX()+getmyY()*getmyY());
  }
  
  public void setmyX (float input) {
    myX = input;
  }
  public void setmyY (float input) {
    myY = input;
  }
  public void setmyS (float input) {
    myS = input;
  }
  public void setmyA (float input) {
    myA = input;
  }
  public void setmyC (int input) {
    myC = input;
  }
  public float getmyX () {
    return myX;
  }
  public float getmyY () {
    return myY;
  }
  public float getmyS () {
    return myS;
  }
  public float getmyA () {
    return myA;
  }
  public int getmyC () {
    return myC;
  }
}
