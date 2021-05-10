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
int backdoor;
PImage PlayerN,PlayerE,PlayerS,PlayerW,LastPlayer;
PImage DoorN,DoorE,DoorS,DoorW;


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
     PlayerN=loadImage("CharacterN.png");
     PlayerE=loadImage("CharacterE.png");
     PlayerS=loadImage("CharacterS.png");
     PlayerW=loadImage("CharacterW.png");
     DoorN=loadImage("DoorN.png");
     DoorE=loadImage("DoorE.png");
     DoorS=loadImage("DoorS.png");
     DoorW=loadImage("DoorW.png");
     
     imageMode(CENTER);
     image(PlayerN,Xpos,Ypos);
     image(DoorE,35,245);
}

void draw() {
     Map();
     LimitMap();
     LastX=Xpos;
     LastY=Ypos;
     imageMode(CENTER);
     if(N==1){
     image(PlayerN,Xpos,Ypos);
     }
     else if(E==1){
     image(PlayerE,Xpos,Ypos);
     }
     else if(S==1){
     image(PlayerS,Xpos,Ypos);
     }
     else if(W==1){
     image(PlayerW,Xpos,Ypos);
     }
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
    
    println(Xpos);
    println(Ypos);
    fill(#1f262e);
    rect(LastX,LastY,60,60);
    backdoor();
    
}
////////////////////////////////////////////
void Map(){
  if(MapNumber==1){
  Map1();
  }
  else if(MapNumber==2){
  Map2();
  }
  else if(MapNumber==3){
  Map3();
  }
  else if(MapNumber==4){
  Map4(); 
  }
  else if(MapNumber==5){
  Map5(); 
  }
  
}
///////////////////////////////
void Map1(){
  
  fill(#24FF1A);
  Ym=35;
  for(int i=1;i<=7;i++){
  noStroke();
  rect(665,Ym,70,70);
  Ym+=70;
  }
  if(Xpos==665){
    BlockMap();
  }
  else if(Xpos<=35&&Ypos==245&&W==1){ //2
  backdoor=12;
  MapNumber=2;
  Xpos=665;
  Ypos=245;
  ClearField();
  image(DoorW,665,245);
  image(DoorS,595,35);
  }
  
}
///////////////////////////////
void Map2(){
  
  fill(#24FF1A);
  Ym=35;
  for(int i=1;i<=7;i++){
  noStroke();
  rect(35,Ym,70,70);
  Ym+=70;
  }

  if(Xpos==35){
  BlockMap();
  }
  else if(Xpos==595&&Ypos<=35&&N==1){ //3
  backdoor=32;
  MapNumber=3;
  Xpos=595;
  Ypos=455;
  ClearField();
  image(DoorN,595,455);
  }
else if(Xpos>=665&&Ypos==245&&E==1){ //1
  backdoor=11;
  MapNumber=1;
  Xpos=35;
  Ypos=245;
  ClearField();
  image(DoorE,35,245);
  }
}
///////////////////////////////
void Map3(){
  fill(#24FF1A);
  noStroke();
  Ym=455;
  Xm=455;
  for(int i=1;i<=4;i++){
  rect(385,Ym,70,70);
  Ym-=70;
  }
  for(int i=1;i<=4;i++){
  rect(Xm,245,70,70);
  Xm+=70;
  }
  fill(#F70CE0);
  
  rect(455,385,60,60);
  if(Xpos==385||Ypos==245){
   BlockMap(); 
  }
  else if(Xpos<=455&&Ypos==385){ //4
  MapNumber=4;
  Xpos=385;
  Ypos=385;
  ClearField();
  }
  else if(Xpos==595&&Ypos>=455&&S==1){ //2
  backdoor=31;
  MapNumber=2;
  Xpos=595;
  Ypos=35;
  ClearField();
  image(DoorW,665,245);
  image(DoorS,595,35);
  }
}
///////////////////////////////
void Map4(){
  Map4Maze();
  fill(#F70CE0);
  rect(455,385,60,60);
  rect(35,455,60,60);
  
  if(Xpos==455&&Ypos==385){ //3
  MapNumber=3;
  Xpos=525;
  Ypos=385;
  ClearField();
  image(DoorN,595,455);
  }
  else if(Xpos==35&&Ypos==455){ //5
  MapNumber=5;
  Xpos=105;
  Ypos=455;
  ClearField();
  }
}
////////////////////////////////////////////
void Map5(){
  
  fill(#24FF1A);
  noStroke();
  Xm=175;
  for(int i=1;i<=6;i++){
  rect(Xm,455,70,70);
  Xm+=70;
  }
  Xm=105;
  for(int i=1;i<=8;i++){
  rect(Xm,315,70,70);
  Xm+=70;
  }
  rect(35,385,70,70);
  rect(665,385,70,70);
  fill(#F70CE0);
  rect(35,455,60,60);
  rect(665,455,60,60);
  if(Xpos>=175&&Xpos<=525&&Ypos==455){
  BlockMap();
  }
  if(Xpos>=105&&Xpos<=595&&Ypos==315){
  BlockMap();
  }
  if((Xpos==35&&Ypos==385)||(Xpos==665&&Ypos==385)){
  BlockMap(); 
  }
  
  else if(Xpos==35&&Ypos==455){ //4
  MapNumber=4;
  Xpos=105;
  Ypos=455;
  ClearField();
  }
  else if(Xpos==665&&Ypos==455){ //4
  MapNumber=4;
  Xpos=665;
  Ypos=455;
  ClearField();
  }
}
////////////////////////////////////////////
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

void backdoor(){
    if(backdoor==11){
    image(DoorE,35,245);
    backdoor=0;
    }
    else if(backdoor==12){
    image(DoorW,665,245);
    backdoor=0;
    }
    else if(backdoor==31){
    image(DoorS,595,35);
    backdoor=0;
    }
    else if(backdoor==32){
    image(DoorN,595,455);
    backdoor=0;
    }
}

void Map4Maze(){
  fill(#24FF1A);
  noStroke();
  Ym=315;
  for(int i=1;i<=2;i++){
  rect(525,Ym,70,70);
  Ym-=70;
  }
  Xm=455;
  for(int i=1;i<=3;i++){
  rect(Xm,455,70,70);
  Xm-=70;
  }
  Ym=455;
  for(int i=1;i<=4;i++){
  rect(175,Ym,70,70);
  Ym-=70;
  }
  Xm=455;
  for(int i=1;i<=3;i++){
  rect(Xm,315,70,70);
  Xm-=70;
  }
  Ym=105;
  for(int i=1;i<=2;i++){
  rect(525,Ym,70,70);
  Ym-=70;
  }
  Xm=315;
  for(int i=1;i<=3;i++){
  rect(Xm,175,70,70);
  Xm-=70;
  }
  Xm=665;
  for(int i=1;i<=2;i++){
  rect(Xm,105,70,70);
  Xm-=70;
  }
  Xm=595;
  for(int i=1;i<=2;i++){
  rect(Xm,385,70,70);
  Xm+=70;
  }
  if((Xpos==35&&Ypos==105)||(Xpos==35&&Ypos==385)){
  BlockMap();
  }
  if((Xpos==105&&Ypos==245)||(Xpos==665&&Ypos==245)){
  BlockMap();
  }
  if(Xpos==175&&Ypos>=175&&Ypos<=455){
  BlockMap();
  }
  if((Ypos==175&&Xpos==245)||(Ypos==175&&Xpos==315)){
  BlockMap();
  }
  if((Xpos==525&&Ypos==35)||(Xpos==525&&Ypos==105)||(Xpos==525&&Ypos>=245&&Ypos<=320)){
  BlockMap();
  }
  if((Xpos>=315&&Xpos<=455&&Ypos==315)||(Xpos>=315&&Xpos<=455&&Ypos==455)){
  BlockMap();
  }
  if((Xpos>=595&&Xpos<=665&&Ypos==105)||(Xpos>=595&&Xpos<=665&&Ypos==385)){
  BlockMap();
  }
  rect(105,245,70,70);
  rect(35,105,70,70);
  rect(35,385,70,70);
  rect(665,245,70,70);
}
