/*11571044 清原昂希*/

//マウスの軌跡
int n=30;
int[]x=new int[n];
int[]y=new int[n];

//１ステージ
float x1=75;
float x2=75;
float x3=75;
float speed=1.5;
int d1=1;
int d2=1;
int d3=1;

//２ステージ
float angle=0.0;
float Angle=0.0;

//３ステージ
int ex=650, ey=100, Ex=950, Ey=125, diameter=20;
int vx=1, vy=1, Vx=2, Vy=2;

//４ステージ
float[]rx=new float[100];
float[]ry=new float[100];

void setup() {
  size(1200, 700);
  //GAMEOVER,CLEAR用
  textSize(75);
  textAlign(CENTER);

  //４ステージ用
  for (int i=0; i<rx.length; i++) {
    rx[i]=random(675, 1075);
    ry[i]=random(250, 350);
  }

  background(204);
}

void draw() {
  //右クリックで背景を灰色にする（リスタートする）
  if (mouseButton==RIGHT) {
    background(204);
  }

  //当たり判定.マウスの位置の色が黒の時.背景が赤になってＧＡＭＥＯＶＥＲと表示される。
  //右下のゴール地点についたとき背景が黄色になってＣＬＥＡＲと表示される。
  if (mouseButton==LEFT) {
    color c = get(mouseX, mouseY);//マウス位置の色を取る
    if ((c & 0xFFFFFF) == 0x000000) {
      noStroke();
      fill(255, 0, 0);
      rect(0, 0, 1200, 750);
      fill(255, 255, 0);
      text("GAMEOVER", 600, 300);
      text("RIGHT CLICK", 600, 500);
    } else if ((c & 0xFFFFFF) == 0x9A9A9A) {
      background(255, 255, 0);
      fill(255, 0, 0);
      text("CLEAR!!", 600, 300);
      text("RIGHT CLICK", 600, 500);
    }
  }

  //座標(1,1)背景は灰色でステージが表示される。
  color C = get(1, 1);//座標(1,1)の色を取る
  if ((C & 0xFFFFFF) == 0xCCCCCC) {
    background(204);


    //マウスの軌跡を表示する（配列＋繰り返し）
    noStroke();
    for (int i=x.length-1; i>0; i--) {
      x[i]=x[i-1];
      y[i]=y[i-1];
    }
    x[0]=mouseX;
    y[0]=mouseY;
    for (int i=0; i<x.length; i++) {
      fill(i*7+1);
      ellipse(x[i], y[i], 3, 3);
    }

    fill(0);
    stroke(0);
    strokeWeight(3);

    //３ステージ
    //一つ目の跳ね返る玉
    ellipse(ex, ey, diameter, diameter);
    if (ex+diameter/2>815) {
      vx=-vx;
    }
    if (ex-diameter/2<625) {
      vx=-vx;
    }
    if (ey+diameter/2>150) {
      vy=-vy;
    }
    if (ey-diameter/2<75) {
      vy=-vy;
    }
    ex+=vx;
    ey+=vy;

    //二つ目の跳ね返る玉
    ellipse(Ex, Ey, diameter, diameter);
    if (Ex+diameter/2>1025) {
      Vx=-Vx;
    }
    if (Ex-diameter/2<835) {
      Vx=-Vx;
    }
    if (Ey+diameter/2>150) {
      Vy=-Vy;
    }
    if (Ey-diameter/2<75) {
      Vy=-Vy;
    }
    Ex+=Vx;
    Ey+=Vy;

    //１ステージ
    //一つ目の横に動く四角形
    x1+=speed*d1;
    if (x1<25||x1>225) {
      d1=-d1;
    }
    rect(x1, 425, 25, 50);

    //二つ目の横に動く四角形
    x2+=speed*d2;
    if (x2<25||x2>300) {
      d2=-d2;
    }
    rect(x2, 525, 25, 40);

    //三つ目の横に動く四角形
    x3+=speed*d3;
    if (x3<25||x3>400) {
      d3=-d3;
    }
    rect(x3, 600, 25, 30);

    //４ステージ
    for (int i=0; i<rx.length; i++) {
      ellipse(rx[i], ry[i], 5, 5);
    }

    noFill();

    //スタート地点
    arc(35, 35, 60, 60, PI*2/3, TWO_PI+PI*1/3);

    //１ステージまでの道
    line(20, 60, 20, 150);
    line(50, 60, 50, 150);

    arc(75, 150, 110, 110, 0, PI);
    arc(75, 150, 50, 50, 0, PI);

    line(100, 150, 100, 65);
    line(130, 150, 130, 65);

    arc(150, 65, 100, 100, PI, TWO_PI);
    arc(150, 65, 40, 40, PI, TWO_PI);

    line(170, 65, 170, 275);
    line(200, 65, 200, 250);

    arc(200, 300, 100, 100, PI+PI/2, 3*PI);
    arc(200, 300, 50, 50, PI+PI/2, 3*PI);

    line(125, 275, 200, 275);
    line(175, 275, 175, 300);
    line(100, 300, 150, 300);
    line(100, 275, 100, 300);

    arc(75, 275, 100, 100, PI, TWO_PI);
    arc(75, 275, 50, 50, PI, TWO_PI);

    line(25, 275, 25, 325);
    line(50, 275, 50, 325);
    line(50, 325, 100, 325);
    line(50, 350, 100, 350);

    arc(50, 325, 50, 50, PI/2, PI);
    arc(100, 350, 50, 50, PI*3/2, TWO_PI);

    line(100, 350, 100, 425);
    line(125, 350, 125, 425);

    //１ステージ
    line(25, 425, 100, 425);
    line(125, 425, 250, 425);
    line(25, 425, 25, 475);
    line(25, 475, 225, 475);


    line(225, 475, 225, 525);
    line(250, 425, 250, 525);

    line(25, 525, 225, 525);
    line(25, 525, 25, 565);
    line(25, 565, 75, 565);
    line(250, 525, 325, 525);
    line(325, 525, 325, 565);
    line(100, 565, 325, 565);

    line(75, 565, 75, 600);
    line(100, 565, 100, 600);

    line(25, 600, 75, 600);
    line(25, 600, 25, 630);
    line(25, 630, 425, 630);
    line(425, 630, 425, 600);
    line(400, 600, 425, 600);
    line(100, 600, 375, 600);

    //１ステージから２ステージまでの道
    line(375, 450, 375, 600);
    line(400, 450, 400, 600);

    //２ステージ
    arc(387, 375, 150, 150, PI+7*PI/12, 2*PI+5*PI/12);
    arc(387, 375, 150, 150, 7*PI/12, PI+5*PI/12);

    line(375, 250, 375, 300);
    line(400, 250, 400, 300);

    arc(387, 175, 150, 150, 7*PI/12, PI+11*PI/12);
    arc(387, 175, 150, 150, PI/12, 5*PI/12);

    //２ステージから３ステージまでの道
    line(460, 160, 625, 100);
    line(460, 190, 625, 130);

    //３ステージ
    line(625, 75, 625, 100);
    line(625, 130, 625, 150);
    line(625, 75, 1025, 75);
    line(625, 150, 1025, 150);
    line(1025, 75, 1025, 100);
    line(1025, 125, 1025, 150);

    fill(0);
    rect(815, 75, 20, 25);
    rect(815, 125, 20, 25);

    //３ステージから４ステージまでの道
    noFill();
    line(1025, 100, 1175, 100);
    line(1025, 125, 1150, 125);
    line(1175, 100, 1175, 315);
    line(1150, 125, 1150, 285);
    line(1150, 285, 1100, 285);
    line(1175, 315, 1100, 315);

    //４ステージ
    line(1100, 250, 1100, 285);
    line(650, 250, 1100, 250);
    line(650, 250, 650, 285);
    line(1100, 315, 1100, 350);
    line(650, 350, 1100, 350);
    line(650, 315, 650, 350);

    //４ステージから５ステージまでの道
    line(545, 285, 650, 285);
    line(575, 315, 650, 315);
    line(545, 285, 545, 540);
    line(575, 315, 575, 510);
    line(575, 510, 675, 510);
    line(545, 540, 675, 540);


    //５ステージとゴール地点までの道
    arc(800, 525, 250, 250, 0, 19*PI/20);
    arc(800, 525, 250, 250, 21*PI/20, PI+14*PI/15);
    arc(800, 525, 200, 200, PI/10, PI);
    arc(800, 525, 200, 200, PI+PI/10, 2*PI);
    arc(800, 525, 150, 150, 0, 7*PI/8);
    arc(800, 525, 150, 150, PI, PI+7*PI/8);
    arc(800, 525, 100, 100, PI/6, PI);
    arc(800, 525, 100, 100, PI+PI/6, 2*PI);
    arc(800, 525, 50, 50, 0, PI/2);
    arc(800, 525, 50, 50, PI, PI+PI/2);
    line(675, 510, 700, 525);
    line(700, 525, 775, 525);
    line(825, 525, 1050, 525);
    line(923, 500, 1050, 500);

    //ゴール地点
    arc(1087.5, 512.5, 75, 75, PI+PI/8, 2*PI+7*PI/8);
    noStroke();
    fill(154);
    ellipse(1087.5, 512.5, 75, 75);

    stroke(0);
    strokeWeight(25);
    //一つ目の回転する棒
    translate(387.5, 375);
    rotate(angle);//回転
    line(-60, 0, 60, 0);
    line(0, -60, 0, 60);

    //二つ目の回転する棒
    resetMatrix();//座標系を元に戻す
    translate(387.5, 175);
    rotate(angle);//回転
    line(-60, 0, 60, 0);
    line(0, -60, 0, 60);
    angle+=0.03;
  }
}
