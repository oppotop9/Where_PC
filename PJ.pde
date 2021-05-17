int x,y,Xm,Ym;
int Xpos=385; int Ypos=455;
int LastX,LastY;
int interact;
int MapNumber;
int N,S,E,W;
int backdoor;
int Key,KeyLoop,MouseItem,HeadItem,KeyboardItem,CPUItem,ScreenItem;
int Xbox1,Ybox1,Xbox2,Ybox2;
PImage PlayerN,PlayerE,PlayerS,PlayerW,LastPlayer,Sit;
PImage DoorN,DoorE,DoorS,DoorW,Ledder,Pipe,DoorLock,DoorLock2;
PImage Wall,MetalWall1,MetalWall2,MetalWall3;
PImage Box,NPC;
PImage Keyimage,Mouse,Headphone,Keyboard,CPU,Screen;
int G=0,B=0,O=0,P=0;
int Game=0;

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
     Sit=loadImage("CharacSit.png");
     
     DoorN=loadImage("DoorN.png");
     DoorE=loadImage("DoorE.png");
     DoorS=loadImage("DoorS.png");
     DoorW=loadImage("DoorW.png");
     Ledder=loadImage("ST.png");
     Pipe=loadImage("Pipe.png");
     DoorLock=loadImage("DoorLock.png");
     DoorLock2=loadImage("DoorLock2.png");
     
     Wall=loadImage("Wall.png");
     MetalWall1=loadImage("Mwall1.png");
     MetalWall2=loadImage("Mwall2.png");
     MetalWall3=loadImage("Mwall3.png");
     
     Box=loadImage("WBox.png");
     Xbox1=525; Ybox1=175; Xbox2=595; Ybox2=105;
     NPC=loadImage("NPC1.png");
     
     Keyimage=loadImage("KeyEX.png");
     Mouse=loadImage("Col3.png");
     Headphone=loadImage("Col5.png");
     Keyboard=loadImage("Col2.png");
     CPU=loadImage("Col4.png");
     Screen=loadImage("Col1N.png");
     
     Key=0;
     KeyLoop=0;
     imageMode(CENTER);
     image(PlayerN,Xpos,Ypos);
     image(DoorE,35,245);
}

void draw() {
  if(Game<5){
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
     else if(N==-1){
     image(Sit,Xpos,Ypos);
     }
     ClearDirection();
  }
  else if(Game==5){
  }
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
    N=-1;
  }
  else{
  N=-1; 
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
  else if(MapNumber==6){
   Map6(); 
  }
  else if(MapNumber==7){
   Map7(); 
  }
  else if(MapNumber==8){
   Map8(); 
  }
  else if(MapNumber==9){
   END(); 
  }
}
///////////////////////////////
void Map1(){
  Map1Block();
  KeyLoop=0;
  fill(#24FF1A);
  Ym=35;
  for(int i=1;i<=7;i++){
  noStroke();
  rect(665,Ym,70,70);
  image(Wall,665,Ym);
  Ym+=70;
  }
  if(Xpos==665){
    BlockMap();
  }
   if(Xpos<=35&&Ypos==245&&W==1){ //2
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
  image(Wall,35,Ym);
  Ym+=70;
  }
  
  if(Key==0){
  image(DoorLock,245,35);
  image(DoorLock2,385,455);
  }
  else if(Key==1){
    if(KeyLoop==0){
  image(DoorS,245,35);
  image(DoorN,385,455);
  KeyLoop=1;
    }
    else{
    if(Xpos==245&&Ypos<=35&&N==1){ //6
        backdoor=61;
        MapNumber=6;
        Xpos=245;
        Ypos=455;
        ClearField();
        image(DoorN,245,455);
        image(DoorS,105,35);
      }
      if(Xpos==385&&Ypos>=455&&S==1){ //8
        backdoor=81;
        MapNumber=8;
        Xpos=385;
        Ypos=35;
        ClearField();
        image(DoorS,385,35);
      }
    }
    
  }
  if(Xpos==35){
  BlockMap();
  }
   if(Xpos==595&&Ypos<=35&&N==1){ //3
  backdoor=32;
  MapNumber=3;
  Xpos=595;
  Ypos=455;
  ClearField();
  image(DoorN,595,455);
  image(Ledder,455,385);
  }
   if(Xpos>=665&&Ypos==245&&E==1){ //1
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
  Map3Dark();
  KeyLoop=0;
  fill(#24FF1A);
  noStroke();
  Ym=455;
  Xm=455;
  for(int i=1;i<=4;i++){
  rect(385,Ym,70,70);
  image(Wall,385,Ym);
  Ym-=70;
  }
  for(int i=1;i<=4;i++){
  rect(Xm,245,70,70);
  image(Wall,Xm,245);
  Xm+=70;
  }
  
  if(Xpos==385||Ypos==245){
   BlockMap(); 
  }
   if(Xpos<=455&&Ypos==385){ //4
  MapNumber=4;
  Xpos=385;
  Ypos=385;
  ClearField();
  fill(#030303);
  rect(455,385,70,70,50);
  image(Ledder,455,385);
  }
   if(Xpos==595&&Ypos>=455&&S==1){ //2
  backdoor=31;
  MapNumber=2;
  Xpos=595;
  Ypos=35;
  ClearField();
  image(DoorW,665,245);
  image(DoorS,595,35);
  }
  x=35;
  y=35;
  
}
///////////////////////////////
void Map4(){
  KeyLoop=0;
  Map4Maze();
  image(Pipe,35,455);
  if(MouseItem==0){
   image(Mouse,665,315);
   if(Xpos==665&&Ypos==315){
     BlockMap();
   }
  }
  if(Key==0){
  image(Keyimage,665,455);
  }
  if(Xpos==455&&Ypos==385){ //3
  MapNumber=3;
  Xpos=525;
  Ypos=385;
  ClearField();
  image(DoorN,595,455);
  image(Ledder,455,385);
  }
  else if(Xpos==35&&Ypos==455){ //5
  MapNumber=5;
  Xpos=105;
  Ypos=455;
  ClearField();
  noStroke();
  if(Key==0){
  image(Keyimage,665,455);
  }
  fill(#030303,127);
  rect(665,455,70,70,50);
  
  
  }
  else if(interact == 1){
  if(Xpos==595&&Ypos==315){
    MouseItem=1;
    fill(#1f262e);
    rect(665,315,60,60);//Mouse get
    Item();
    
  }
  }
}
////////////////////////////////////////////
void Map5(){
  Map5Dark();
  
  noStroke();
  Xm=175;
  for(int i=1;i<=6;i++){
  image(MetalWall2,Xm,455);
  Xm+=70;
  }
  Xm=105;
  for(int i=1;i<=8;i++){
  image(MetalWall1,Xm,315);
  Xm+=70;
  }
  image(MetalWall3,35,385);
  image(MetalWall3,665,385);
  image(Pipe,35,455);
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
  fill(#030303);
  rect(455,385,70,70,50);
  image(Ledder,455,385);
  }
  else if(Xpos==665&&Ypos==455){ //4
  MapNumber=4;
  Xpos=665;
  Ypos=455;
  ClearField();
  Key=1;  //Keyget
  fill(#030303);
  rect(455,385,70,70,50);
  image(Ledder,455,385);
  Item();
  
  }
}
////////////////////////////////////////////
void Map6(){
  KeyLoop=0;
  Map6box();
  if(HeadItem==0){
   image(Headphone,665,105);
   if(Xpos==665&&Ypos==105){
     BlockMap();
   }
  }
  
  if((Xpos==385&&Ypos<=455&&Ypos>=245)||(Ypos==245&&Xpos>=385&&Xpos<=655)){
   BlockMap(); 
  }
  if((Xpos==385&&Ypos<=175&&Ypos>=105)||(Xpos==525&&Ypos>=35&&Ypos<=105)){
   BlockMap(); 
  }
  if(Xpos==175&&Ypos==35){
   BlockMap(); 
  }
  else if(interact == 1){
  if(Xpos==595&&Ypos==105){
    HeadItem=1;
    fill(#1f262e);
    rect(665,105,60,60);//Headphone get
    Item();
  }
  }
  else if(Xpos==245&&Ypos>=455&&S==1){ //2
  backdoor=62;
  MapNumber=2;
  Xpos=245;
  Ypos=35;
  ClearField();
  image(DoorW,665,245);
  image(DoorS,595,35);
  }
  else if(Xpos==105&&Ypos<=35&&N==1){ //7
  backdoor=71;
  MapNumber=7;
  Xpos=105;
  Ypos=455;
  ClearField();
  image(DoorN,105,455);
  
  }
  
}
////////////////////////////////////////////
void Map7(){
  KeyLoop=0;
  Map7color();
  if(Xpos==105&&Ypos>=455&&S==1){ //6
  backdoor=72;
  MapNumber=6;
  Xpos=105;
  Ypos=35;
  ClearField();
  image(DoorN,245,455);
  image(DoorS,105,35);
  }
  if (KeyboardItem==0){
  image(Keyboard,35,35);
  if(Xpos==35&&Ypos==35){
   BlockMap(); 
  }
  }
  if(interact == 1){
  if(Xpos==105&&Ypos==35){
    KeyboardItem=1;
    fill(#1f262e);
    rect(35,35,60,60);//Keyboard get
    Item();
  }
  }
}
////////////////////////////////////////////
void Map8(){
  KeyLoop=0;
  Map8puzzle();
  if(Xpos==385&&Ypos<=35&&N==1){ //2
  backdoor=82;
  MapNumber=2;
  Xpos=385;
  Ypos=455;
  ClearField();
  image(DoorW,665,245);
  image(DoorS,595,35);
  }
  if (CPUItem==0){
  image(CPU,385,455);
  
  }
  if(interact == 1){
  if(Xpos==385&&Ypos==385){
    CPUItem=1;
    fill(#1f262e);
    rect(385,455,60,60);//CPU get
    Item();
  }
  }
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
N=0; E=0; S=0; W=0; interact=0;
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
    else if(backdoor==61){
    image(DoorN,245,455);
    backdoor=0;
    }
    else if(backdoor==62){
    image(DoorS,245,35);
    backdoor=0;
    }
    else if(backdoor==71){
    image(DoorN,105,455);
    backdoor=0;
    }
    else if(backdoor==72){
    image(DoorS,105,35);
    backdoor=0;
    }
    else if(backdoor==81){
    image(DoorS,385,35);
    backdoor=0;
    }
    else if(backdoor==82){
    image(DoorN,385,455);
    backdoor=0;
    }
}
void Item(){
  fill(#FFF25A);
if(MouseItem==1){
  
  ellipse(665,545,40,40);
  image(Mouse,665,545);
  }
if(HeadItem==1){
    ellipse(595,545,40,40);
   image(Headphone,595,545); 
}
if(KeyboardItem==1){
 ellipse(665,595,40,40);
 image(Keyboard,665,595);
}
if(CPUItem==1){
 ellipse(595,595,45,45);
 image(CPU,595,597);
}
if(ScreenItem==1){
  ellipse(630,635,50,50);
  image(Screen,630,635);
}
if(Key==1){
  image(Keyimage,35,650);
  
}
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////////
void Map1Block(){
  
  image(Wall,35,35);
  image(Wall,175,35);
  image(Wall,175,105);
  image(Wall,35,105);
  if((MouseItem==1)&&(HeadItem==1)&&(KeyboardItem==1)&&(CPUItem==1)&&(ScreenItem==1)){
  Game=4;
  }
  if(Game<3){
  image(DoorLock,385,35);
  }
  if(Game==4){
  if(KeyLoop==0){
    stroke(#050505);
   fill(#1f262e);
    rect(385,35,70,70);
  image(DoorS,385,35);
  KeyLoop=1;
  }
  if(Xpos==385&&Ypos<=35)
  MapNumber=9;
  }
  if(Key==0){
    image(DoorLock,105,175);
    image(NPC,385,35);
    if((Ypos==105&&Xpos==105)||(Xpos==385&&Ypos==35)){
    BlockMap();
    }
  }
  if(Key==1){
  image(NPC,525,35);
  if(Xpos==525&&Ypos==35){
    BlockMap();
    }
  }
  if((Ypos==35&&Xpos>=35&&Xpos<=175)||(Ypos==105&&Xpos==35)||(Ypos==105&&Xpos==175)){
    BlockMap();
  }
  if(ScreenItem==0){
    image(Screen,105,35);
    if(Xpos==105&&Ypos==35){
     BlockMap(); 
    }
  }
  if(interact == 1){
  if(Xpos==105&&Ypos==105){
    ScreenItem=1; //Screen get
    fill(#1f262e);
    rect(105,35,60,60);
    Item();
  }
  }
}

void Map3Dark(){
  x=35;
  y=35;
  noStroke();
  fill(#1F1B1B,90); //rgb (31,38,46)
  for(int g=1;g<=3;g++){
    x=35;
  for(int i=1;i<=10;i++){
    rectMode(CENTER);
    rect(x,y,70,70);
    x+=70;
    }
    y+=70;
  }
  x=35;
  y=245;
  noStroke();
  fill(#1F1B1B,90); //rgb (31,38,46)
  for(int g=1;g<=4;g++){
    x=35;
  for(int i=1;i<=5;i++){
    rectMode(CENTER);
    rect(x,y,70,70);
    x+=70;
    }
    y+=70;
  }
}

void Map4Maze(){
  fill(#24FF1A);
  noStroke();
  Ym=315;
  for(int i=1;i<=2;i++){
  rect(525,Ym,70,70);
  image(Wall,525,Ym);
  Ym-=70;
  }
  Xm=455;
  for(int i=1;i<=3;i++){
  rect(Xm,455,70,70);
  image(Wall,Xm,455);
  Xm-=70;
  }
  Ym=455;
  for(int i=1;i<=4;i++){
  rect(175,Ym,70,70);
  image(Wall,175,Ym);
  Ym-=70;
  }
  Xm=455;
  for(int i=1;i<=3;i++){
  rect(Xm,315,70,70);
  image(Wall,Xm,315);
  Xm-=70;
  }
  Ym=105;
  for(int i=1;i<=2;i++){
  rect(525,Ym,70,70);
  image(Wall,525,Ym);
  Ym-=70;
  }
  Xm=315;
  for(int i=1;i<=3;i++){
  rect(Xm,175,70,70);
  image(Wall,Xm,175);
  Xm-=70;
  }
  Xm=665;
  for(int i=1;i<=2;i++){
  rect(Xm,105,70,70);
  image(Wall,Xm,105);
  Xm-=70;
  }
  Xm=595;
  for(int i=1;i<=2;i++){
  rect(Xm,385,70,70);
  image(Wall,Xm,385);
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
  image(Wall,105,245);
  rect(35,105,70,70);
  image(Wall,35,105);
  rect(35,385,70,70);
  image(Wall,35,385);
  rect(665,245,70,70);
  image(Wall,665,245);
}

void Map5Dark(){
 x=35;
  y=x;
  noStroke();
  fill(#1F1B1B,90); //rgb (31,38,46)
  for(int g=1;g<=4;g++){
    x=35;
  for(int i=1;i<=10;i++){
    rectMode(CENTER);
    rect(x,y,70,70);
    x+=70;
    }
    y+=70;
  }
  rectMode(CENTER);
  rect(35,315,70,70);
  rect(665,315,70,70);
}

void Map6box(){
  noStroke();
  Ym=455;
  Xm=455;
  for(int i=1;i<=4;i++){
  image(Wall,385,Ym);
  Ym-=70;
  }
  for(int i=1;i<=4;i++){
  image(Wall,Xm,245);
  Xm+=70;
  }
  Ym=105;
  for(int i=1;i<=2;i++){
  
  image(Wall,385,Ym);
  Ym+=70;
  }
  Ym=35;
  for(int i=1;i<=2;i++){
  
  image(Wall,525,Ym);
  Ym+=70;
  }
  image(Wall,175,35);
  image(Box,Xbox1,Ybox1);
  image(Box,Xbox2,Ybox2);
  if(interact==1){
    if(Xpos==455&&Ypos==175){
   Xbox1=595; 
   stroke(#050505);
   fill(#1f262e);
    rect(525,175,70,70);
    }
    else if(Xpos==525&&Ypos==175){
      Xbox1=665; 
   stroke(#050505);
   fill(#1f262e);
    rect(595,175,70,70);
    }
    else if(Xpos==595&&Ypos==175){
      Ybox2=35; 
     stroke(#050505);
     fill(#1f262e);
    rect(595,105,70,70);
    }
    
  }
  if((Xpos==Xbox1&&Ypos==Ybox1)||(Xpos==Xbox2&&Ypos==Ybox2)){
  BlockMap();
  }
  x=455;
  y=315;
  noStroke();
  fill(#1F1B1B,90); //rgb (31,38,46)
  for(int g=1;g<=3;g++){
    x=455;
  for(int i=1;i<=4;i++){
    rectMode(CENTER);
    rect(x,y,70,70);
    x+=70;
    }
    y+=70;
  }
  
}

void Map7color(){
 fill(#9F08FF); //purple
 rect(525,315,60,60);
 rect(245,315,60,60);
 rect(315,175,60,60);
 rect(455,35,60,60);
 rect(175,35,60,60);
 ellipse(455,455,60,60);
 fill(#13FF08); //Green
 rect(315,315,60,60);
 rect(315,35,60,60);
 rect(35,105,60,60);
 rect(525,175,60,60);
 rect(595,315,60,60);
 ellipse(525,455,60,60);
 fill(#FF6A0D); //Orange
 rect(665,315,60,60);
 rect(105,315,60,60);
 rect(385,245,60,60);
 rect(175,105,60,60);
 ellipse(595,455,60,60);
 fill(#5AFFFE); //Bluesky
 rect(35,245,60,60);
 rect(175,245,60,60);
 rect(455,175,60,60);
 rect(665,105,60,60);
 ellipse(665,455,60,60);
 if(Ypos==455&&Xpos>=455&&Xpos<=665){
  BlockMap(); 
 }
 if(Ypos==315&&Xpos<=665&&Xpos>=525){
 Xpos=455;
 Ypos=385;
 }
 if(Ypos==315&&Xpos<=315&&Xpos>=245){
 Xpos=455;
 Ypos=385;
 }
 if(Ypos==175&&Xpos<=525&&Xpos>=455){
 Xpos=455;
 Ypos=385;
 }
 if(Xpos==175&&Ypos<=105&&Ypos>=35){
 Xpos=455;
 Ypos=385;
 }
 if((Xpos==385&&Ypos==245)||(Xpos==105&&Ypos==315)||(Xpos==35&&Ypos==245)||(Xpos==175&&Ypos==245)||(Xpos==315&&Ypos==175)){
 Xpos=455;
 Ypos=385;
 }
 if((Xpos==665&&Ypos==105)||(Xpos==455&&Ypos==35)||(Xpos==315&&Ypos==35)||(Xpos==35&&Ypos==105)){
 Xpos=455;
 Ypos=385;
 }
}
void Map8puzzle(){
  noStroke();
  Xm=245;
  for(int i=1;i<=4;i++){
  image(Pipe,Xm,315);
  Xm+=70;
  }
  Xm=245;
  for(int i=1;i<=4;i++){
  image(Pipe,Xm,175);
  Xm+=70;
  }
 fill(#9F08FF); //purple
 //#4D0081
 ellipse(525,315,60,60);
 
 fill(#13FF08); //Green
 //#068E00
 ellipse(175,175,60,60);
 
 fill(#FF6A0D); //Orange
 //#983800
 ellipse(175,315,60,60);
 
 fill(#5AFFFE); //Bluesky
 //#00908F
 ellipse(525,175,60,60);
 image(MetalWall1,175,105);
 image(MetalWall1,525,105);
 image(MetalWall1,525,385);
 image(MetalWall1,175,385);
 image(MetalWall2,315,455);
 image(MetalWall2,455,455);
 image(MetalWall2,525,245);
 image(MetalWall2,175,245);
 
 if(Xpos>174&&Xpos<526&&Ypos>174&&Ypos<316){
 BlockMap();
 }
 if((Xpos==175&&Ypos==105)||(Xpos==525&&Ypos==105)||(Xpos==175&&Ypos==385)||(Xpos==525&&Ypos==385)){
 BlockMap();
 }
 if(Xpos>=315&&Xpos<=455&&Ypos==455){
    BlockMap();
  }
 if((Xpos==35&&Ypos==455)||(Xpos==35&&Ypos==35)||(Xpos==665&&Ypos==35)||(Xpos==665&&Ypos==455)){
   BlockMap();
 }
 if(Game==0){
   image(MetalWall3,245,385);
   
  if(Xpos==245&&Ypos==385){
    BlockMap();
  }
  
 }
 if(interact==1){
   if(Xpos==595&&Ypos==315){
     if(G==0&&B==0&&O==0){
      P=1; 
      fill(#4D0081);
      rect(665,455,50,50,60);
     }
     else{
      
     }
   }
   else if(Xpos==105&&Ypos==175){
     if(P==1&&B==0&&O==0){
      G=1; 
      fill(#068E00);
      rect(35,35,50,50,60);
     }
     else{
      
     }
   }
   else if(Xpos==105&&Ypos==315){
     if(P==1&&B==0&&G==1){
      O=1; 
      fill(#983800);
      rect(35,455,50,50,60);
     }
     else{
      
     }
   }
   else if(Xpos==595&&Ypos==175){
     if(P==1&&O==1&&G==1){
      B=1;
      fill(#00908F);
      rect(665,35,50,50,60);
     }
     else{
      
     }
   }
 }
 
 if (B==1&&G==1&&P==1&&O==1){
   if(Game==2){
     fill(#00908F);
      rect(665,35,50,50,60);
      fill(#983800);
      rect(35,455,50,50,60);
      fill(#068E00);
      rect(35,35,50,50,60);
      fill(#4D0081);
      rect(665,455,50,50,60);
   }
   else if(Game==0){
    Game=1; 
   }
 }
 if(Game==1){
   stroke(#050505);
    fill(#1f262e);
    rect(245,385,70,70);
    Game=2;
 }
 //println(P+" "+G+" "+O+" "+B+" ");
}

void END(){
 Game=5;
 ClearField(); 
}
