public int tic = 64;
public float rotate;
public float scale = 1.2;
public int oddballs = 10;
public Particle[] lucky = new Particle[200];

void setup() {
  size(600,600,P3D);
  for (int i = 0; i < lucky.length; i++) {
    lucky[i] = new Particle();
  }
  for (int i = lucky.length-1; i > lucky.length-1-oddballs; i--) {
    lucky[i] = new Oddball();
  }
}

void draw() {
background(0,0,0);

translate(300,300,10);
 for (int i = 0; i < lucky.length-1-oddballs; i++) {
    pushMatrix();
      lucky[i].move();
      lucky[i].show();
    popMatrix();
  }
for (int i = lucky.length-1; i > lucky.length-1-oddballs; i--) {
    lucky[i].redirect();
    lucky[i].move();
    lucky[i].show();
  }
}

public void decorate() {
  stroke(0);
  for (int i = 0; i < 8; i++) {
    rotate(PI/4*i);
    pushMatrix();
      translate(0,-200*scale,0);
      rotateX(PI/2);
      fill(200);
      rect(-200*tan(PI/8)*scale, 0,400*tan(PI/8)*scale,50*scale);
    popMatrix();
  }
  tic++;
  if (tic == 512) {
     tic = 1; 
  }
  if (tic < 32 || tic > 512 - 32) {
    rotate = PI/96*tic;
  } else if (tic < 64 || tic > 512 - 64) {
    rotate = PI/64*tic;
  } else {
    rotate = PI/32*tic;
  }
  rotate(rotate);
  
  
  for (int i = 0; i < 8; i++) {
    rotate(PI/4);
    fill (255);
    triangle(0,0,tan(PI/8)*200*scale, -200*scale, -tan(PI/8)*200*scale, -200*scale);
  }
}

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
