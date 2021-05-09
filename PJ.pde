float r1 = 20;
float r2 = 60;
float x_tran,y_tran,r;
color c = color(int(random(0-255)),int(random(0-255)),int(random(0-255)));
float theta = 0;
int x,y,Xm,Ym;
int Xpos=385; int Ypos=455;
int LastX,LastY;
int start =0;
int interact;
int MapNumber;
int N,S,E,W;
void setup() {
  size(700, 900);
  background(255);
  ClearField();
  
  fill(0); //chat box
  rect(350,590,700,180);
  
  fill(#f7be4d); //rgb(247,190,77)
     beginShape(TRIANGLES);
     vertex(210,750);
     vertex(140,750); //N
     vertex(175,685);
     
     vertex(210,750);
     vertex(210,820); //E
     vertex(275,785);
     
     vertex(210,820);
     vertex(140,820); //S
     vertex(175,880);
     
     vertex(140,820);
     vertex(140,750); //W
     vertex( 75,785);
     endShape();
     
     fill(#FF0000);
     ellipseMode(CENTER);  //interact
     ellipse(490,785,150,150);
     MapNumber=1;
}

void draw() {
     Map();
     LimitMap(); 
     fill(#F6FF08);
     ellipse(Xpos,Ypos,50,50);
     LastX=Xpos;
     LastY=Ypos;
     ClearDirection();
   }
   
  
  

void mousePressed(){
  fill(0);
  if(mouseX>=140&&mouseX<=210&&mouseY>=685&&mouseY<=750)
  {
    //UP
    println("N");
    Ypos-=70;
    N=1;
  }
  else if(mouseX>=140&&mouseX<=210&&mouseY>=820&&mouseY<=880)
  {
    //Down
    println("S");
    Ypos+=70;
    S=1;
  }
  else if(mouseX>=75&&mouseX<=140&&mouseY>=750&&mouseY<=820)
  {
    //Left
    println("W");
    Xpos-=70;
    W=1;
  }
  else if(mouseX>=210&&mouseX<=275&&mouseY>=750&&mouseY<=820)
  {
    //Right
    println("E");
    Xpos+=70;
    E=1;
  }
  else if(mouseX>=410&&mouseX<=570&&mouseY>=710&&mouseY<=860)
  {
    //interact
    println("P U S H");
    interact = 1;
  }
    noStroke(); 
    fill(#1f262e);
    rect(LastX,LastY,55,55);
    println(Xpos);
    println(Ypos);
}

void Map(){
  if(MapNumber==1){
  Map1();
  }
  else if(MapNumber==2){
  Map2();
  }
}

void Map1 (){
  fill(#24FF1A);
  Ym=35;
  for(int i=1;i<=7;i++){
  rect(665,Ym,70,70);
  Ym+=70;
  }
  fill(#F70CE0);
  rect(35,245,60,60);
  
  if(Xpos==665){
    BlockMap();
  }
  else if(Xpos<=35&&Ypos==245&&W==1){
  MapNumber=2;
  Xpos=665;
  Ypos=245;
  ClearField();
  }
  
}
 
void Map2 (){
  
  fill(#24FF1A);
  Ym=35;
  for(int i=1;i<=7;i++){
  rect(35,Ym,70,70);
  Ym+=70;
  }
  fill(#F70CE0);
  rect(665,245,60,60);
  
  if(Xpos==35){
  BlockMap();
  }
else if(Xpos>=665&&Ypos==245&&E==1){
  MapNumber=1;
  Xpos=35;
  Ypos=245;
  ClearField();
  }
}
  
  
void ClearField(){
  x=35;
  y=x;
  stroke(#050505);
  fill(#1f262e); //rgb (31,38,46)
  for(int g=1;g<=7;g++){
    x=35;
  for(int i=1;i<=10;i++){
    rectMode(CENTER);
    rect(x,y,70,70);
    x+=70;
    }
    y+=70;
  }
}
void ClearDirection(){
N=0; E=0; S=0; W=0;
}
  
void BlockMap(){
  Xpos =LastX;
  Ypos =LastY;
}

void LimitMap(){
  if(Xpos>665||Xpos<35||Ypos<35||Ypos>490){
  Xpos =LastX;
  Ypos =LastY;
  }
}
