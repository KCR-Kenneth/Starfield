//use a setter and getter, as though the variable is inaccessible

class Oddball extends Particle {
  public Oddball() {
    setmyX(0);
    setmyY(-100);
    setmyS((float)(Math.random()*3+3));
    setmyA((float)(Math.random()*2*Math.PI));
    setmyC(color((int)(Math.random()*80 +20), 0, (int)(Math.random()*80 +60)));
  }
  
  public void move() {
    setmyX(getmyX() + getmyS()*cos(getmyA()));
    setmyY(getmyY() + getmyS()*sin(getmyA()));
  }
}
