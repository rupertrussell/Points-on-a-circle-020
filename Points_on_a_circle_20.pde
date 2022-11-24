// Points on a circle 020
// Circle filling method by Rupert Russell
// 20 September 2018
// code on Github at: 
// artwork on redbubble at: https://www.redbubble.com/people/rupertrussell/works/34034228-points-on-a-circle-016?asc=u

// pallet http://colorbrewer2.org/?type=qualitative&scheme=Set1&n=7


color[] rainbow = {#000000, #ff0000, #AA1100, #FF7700, #FF4400, #FFDD00, #FFBB11, #00FF00, #55AA00, #0000FF, #000055, #8A2BE2, #310062, #C77DF3, #4B0082};

color[] greens = {#edf8fb, #b2e2e2, #66c2a4, #2ca25f, #006d2c};
color[] magentas = {#edf8fb, #b3cde3, #8c96c6, #8856a7, #810f7c};
color[] oranges = {#ffffb2, #fecc5c, #fd8d3c, #f03b20, #bd0026};
color[] purples =  {#feebe2, #fbb4b9, #f768a1, #c51b8a, #7a0177};


int sizeOfColourArray = 15;

boolean collision  = false;

color c ;
color firstColour;

double step = 2 * PI/50;

float h = 300;
float k = 300;

float randX = 0;
float randY = 0;
float randDiameter = 0;
float shrink = 0.001;
int counter = 0;
int saveCount = 0;
int max = 1000;
float radius = max;

void setup() {
  background(255);
  strokeWeight(1); // Thicker
  size(1920, 1080);
  smooth(8);
  // noLoop();
  strokeWeight(10);
  noStroke();
  background(rainbow[0]);
   println("Starting ");
  
}



void draw() {

  randX = random(0, width);
  randY = random(0, width);
  randDiameter = random(0, radius);
  radius = radius - shrink;
  
  if(radius < 10){
    save("last.png");
    println("Ended ");
    exit();
  }
  


  if (check(randX, randY, randDiameter)) {

    fill(rainbow[int(random(1, sizeOfColourArray))]);
    ellipse(randX, randY, randDiameter, randDiameter);
  }
  // ellipse(randX, randY, randDiameter, randDiameter);

  if (counter == 10000) {
    save("save20_" + saveCount + ".png");
    println("saving " + saveCount);
    saveCount ++;
    counter = 0;
  }
  counter ++;
}


boolean check(float x, float y, float r) {
  boolean draw = true;

  noFill();

  for (float theta=0; theta < 2 * PI; theta += step) {
    x = randX + randDiameter /2 * cos(theta);
    y = randY + randDiameter /2 * sin(theta); 
    c = get(int(x), int(y));

    if (theta == 0) {
      firstColour = c;
    }

    if (c != firstColour) {
      draw = false;
    }
  }

  return draw;
}

void mouseClicked() {
  save("save_" + saveCount + ".png");
  println("saving_018_ " + saveCount);
  saveCount ++;
}
