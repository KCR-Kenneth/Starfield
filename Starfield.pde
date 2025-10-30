//Differences: Removed triangles() and rotate(rotate) in lucky[i].show();
// Hypothesis: Constant rotation is leading to freeze

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
      //rotate(rotate);
      lucky[i].move();
      lucky[i].show();
    popMatrix();
  }
  for (int i = lucky.length-1; i > lucky.length-1-oddballs; i--) {
      lucky[i].redirect();
      lucky[i].move();
      lucky[i].show();
  }
  stroke(0);
  /*for (int i = 0; i < 8; i++) {
    rotate(PI/4*i);
    pushMatrix();
      translate(0,-200*scale,0);
      rotateX(PI/2);
      fill(200);
      rect(-200*tan(PI/8)*scale, 0,400*tan(PI/8)*scale,50*scale);
    popMatrix();
  }*/
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
  //triangles();
}

public void triangles() {
  //rotate(rotate);
  
  
  for (int i = 0; i < 8; i++) {
    //rotate(PI/4);
    fill (255);
    triangle(0,0,tan(PI/8)*200*scale, -200*scale, -tan(PI/8)*200*scale, -200*scale);
  }
}
