 int tic = 64;
 float rotate;
 float scale = 1.2;
 int oddballs = 10;
 Particle[] lucky = new Particle[200];

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
      rotate(rotate);
      lucky[i].move();
      lucky[i].show();
    popMatrix();
  }
  for (int i = lucky.length-1; i > lucky.length-1-oddballs; i--) {
    lucky[i].redirect();
    lucky[i].move();
    lucky[i].show();
  }
  
  translate(0,0,-10);
}

class Particle {
   float myX, myY, myS, myA;
   int myC;
   Particle() {
    myX = 0;
    myY = 0;
    myS = (float)(Math.random()*3+1);
    myA = (float)(Math.random()*2*Math.PI);
    myC = color((int)(Math.random()*80 +60), 0, 0);
  }
  
   void move() {
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
  
   void show() {
    pushMatrix();
      translate(myX, myY,0);
      fill(myC);
      noStroke();
      sphere(10);
    popMatrix();
  }
  
   void redirect() {
    if (getDistance() >= 190*scale) {
      setmyX(getmyX() - getmyX()/20);
      setmyY(getmyY() - getmyY()/20);
      setmyA((float)(Math.random()*PI+PI/2)+getmyA());
    }
  }
  
   float getDistance() {
    return sqrt(getmyX()*getmyX()+getmyY()*getmyY());
  }
  
   void setmyX (float input) {
    myX = input;
  }
   void setmyY (float input) {
    myY = input;
  }
   void setmyS (float input) {
    myS = input;
  }
   void setmyA (float input) {
    myA = input;
  }
   void setmyC (int input) {
    myC = input;
  }
   float getmyX () {
    return myX;
  }
   float getmyY () {
    return myY;
  }
   float getmyS () {
    return myS;
  }
   float getmyA () {
    return myA;
  }
   int getmyC () {
    return myC;
  }
}

//use a setter and getter, as though the variable is inaccessible

class Oddball extends Particle {
   Oddball() {
    setmyX(0);
    setmyY(-100);
    setmyS((float)(Math.random()*3+3));
    setmyA((float)(Math.random()*2*Math.PI));
    setmyC(color((int)(Math.random()*80 +20), 0, (int)(Math.random()*80 +60)));
  }
  
   void move() {
    setmyX(getmyX() + getmyS()*cos(getmyA()));
    setmyY(getmyY() + getmyS()*sin(getmyA()));
  }
}
