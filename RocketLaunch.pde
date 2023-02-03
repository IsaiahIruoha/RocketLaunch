
//Variables Declared
int screen; //allows the screens to be switched
PImage background; //background image
String Welcome; //welcome text
String GameName; //game name text
PImage AlienShip; //alien ship bouncing image
PImage skull; //skull bouncing imaghe
PImage trophy; //trophy bouncing imaghe
Bouncing AlienImage; //alien declared with properties
Bouncing SkullImage; //skull declared with properties
Bouncing TrophyImage; //trophy declared with properties
PImage earth; //earth image
Bar Bottom; //bottom bar class
float launchCount; //countdown to allow seconds
float timer; //used launchCount to countdown from 10
boolean startCount; //to decide when the countdown begins
float flashingCount; //allows the count to flash
Launch green, yellow, red; //draws the different boxes that register where the barLine ends
float barLineX, barLineY, barLineSX, barLineSY; //the barLine that determines the lightyears added or removed
boolean stopBar; //determines whether the bar stops or starts
int colourChange1, colourChange2, colourChange3; //changes the colour of the bar when it lands in a zone
float lightYears; //the numerical value assigned to the distance the ship must travel
PImage astImage; //the asteroid image
float marsY, marsSY; //the coordinates of the final destination which awards a victory
Mars marsBar; //marsBar is assigned directions and attached to the Mars class
PImage ship; //the ship image is created
float shipW, shipH; //Ship width and height are recorded
Button retry1, retry2, Start, Exit;  //butons are drawn using a class, allows simplicity and a clicking function

ArrayList<Background> backgrounds = new ArrayList<Background>(); //arraylist for background particles
ArrayList<Asteroid> asteroids = new ArrayList<Asteroid>(); //arraylist for asteroids spawning

void setup () { //everything in this function takes place once
  for (int i = 0; i < 150; i ++) {
    backgrounds.add(new Background()); //adds the initial particles
  }
  for (int i = 0; i < 20; i ++) {
    asteroids.add(new Asteroid()); //adds the initial asteroids
  }
  size(640, 480); //screen size
  frameRate(30); //framerate
  screen = 0; //sets screen to main menu

  //below the variables declared above Setup are assigned values
  Welcome = "Welcome to";
  GameName = "Space Explorers";
  background = loadImage("background.jpg");
  AlienShip = loadImage("AlienShip.png");
  skull = loadImage("skull.png");
  trophy = loadImage("trophy.png");
  earth = loadImage("earth.jpg");
  astImage = loadImage("astImage.png");
  ship = loadImage("ship.png");
  Start = new Button(39, 250, 200, 40, 20, "Start Game");
  Exit = new Button(39, 300, 200, 40, 20, "Exit");
  marsY = -2500;
  marsBar = new Mars(0, marsY, width, 40, 20, "Finish Line");
  AlienImage = new Bouncing(50 + random(width - 150), 50 + random(height - 150), 100, 75, AlienShip);
  SkullImage = new Bouncing(50 + random(width - 150), 50 + random(height - 150), 100, 75, skull);
  TrophyImage = new Bouncing(50 + random(width - 150), 50 + random(height - 150), 100, 75, trophy);
  Bottom = new Bar(126, 340, 400, 100);
  green = new Launch(130, 342.5, 140, 95, 0, 255, 0);
  yellow = new Launch(260, 342.5, 130, 95, 255, 255, 0);
  red = new Launch(382, 342.5, 140, 95, 255, 0, 0);
  retry1 = new Button(15, 418, 54, 48, 20, "Retry");
  retry2 = new Button(15, 418, 54, 48, 20, "Retry");
  startCount = false;
  timer = 30;
  launchCount = 10;
  flashingCount = 30;
  barLineX = 140;
  barLineY = 352.5;
  barLineSX = 50;
  stopBar = false;
  colourChange1 = 255;
  colourChange2 = 255;
  colourChange3 = 255;
  lightYears = 1000;
  marsSY = 0.1;
  shipW = 80;
  shipH = 60;
}

void draw () { //things in this function run in a cycle

  if (screen == 0 ) { //menu screen
    background(background); //sets background image
    fill(238, 0, 116);
    textSize(38);
    text(Welcome, 39, 173); //draws the text
    text(GameName, 39, 215);
    Start.sketch(); //runs the start button
    Exit.sketch(); //runs the exit button
    AlienImage.sketch(); //runs the bouncing alien
  }

  if (screen == 1) { //launch screen
    background(earth); //earth background
    Bottom.sketch(); //bottom bar
    //use boolean clicking to make the bar start moving

    if (startCount == true) { //if startcount is true, runs the timer which launches the rocket and changes screen upon completion
      timer--;
      if (timer == 1) launchCount--;
      if (timer == 0) timer = 30;
      if (launchCount == -1) {
        screen = 2;
        marsBar.y = marsBar.y + (-1 *lightYears);
      }
    }

    flashingCount--;
    if (flashingCount < 30 && flashingCount > 10) { //flashing enabled for the countdown
      textSize(60);
      fill(255);
      text( "T-" + floor(launchCount) + "s", 32, 75);
      textSize(25);
    }
    if (flashingCount < 0) {
      flashingCount = 30;
    }
    if (startCount == false) {
      fill(0);
      text("Press 'Space' To Time Your Flight", 155, 330);
    }

    strokeWeight(2);
    green.sketch(); //draws the  3 boxes for the bar at the bottom of the screen
    red.sketch();
    yellow.sketch2();
    barLineX = barLineX + barLineSX;
    fill(colourChange1, colourChange2, colourChange3);
    rect(barLineX, barLineY, 20, 75);
    if (barLineX >= 480) barLineSX = barLineSX * -1; //keeps the line in between the ends of the bar
    if (barLineX <= 140) barLineSX = barLineSX * -1;

    if (stopBar == true) {
      barLineSX = 0;
      if (barLineX > 130 && barLineX <= 260 && barLineY >= 345 && barLineY < 440) { //if the bar stops on the green box
        colourChange1 = 0;
        colourChange2 = 255;
        colourChange3 = 0;
        lightYears = -1000; //reduces flight time
        fill(255);
        textSize(35);
        text(floor(lightYears) + " Light Years", 365, 68);
      }
      if (barLineX > 260 && barLineX < 390 && barLineY > 345 && barLineY < 440) { //if the bar stops on the yellow box
        colourChange1 = 255;
        colourChange2 = 255;
        colourChange3 = 0;
        lightYears = 0; //keeps consistent flight time
        fill(255);
        textSize(35);
        text("+ " + floor(lightYears) + " Light Years", 365, 68);
      }
      if (barLineX >= 390 && barLineX <= 520 && barLineY > 345 && barLineY < 440) { //if the bar stops on the red box
        colourChange1 = 255;
        colourChange2 = 0;
        colourChange3 = 0;
        lightYears = 1000; //increases flight time
        fill(255);
        textSize(35);
        text("+ " + floor(lightYears) + " Light Years", 365, 68);
      }
    }
  }

  if (screen == 2) { //in the air screen
    background(0);

    for (int i = 0; i < backgrounds.size(); i ++) {
      backgrounds.get(i).render(); //runs the background particles
      backgrounds.get(i).sketch();
    }

    for (int i = 0; i < asteroids.size(); i ++) {
      asteroids.get(i).render(); //runs the asteroids
      asteroids.get(i).sketch();
      fill(255, 0, 0);
      marsBar.y += marsSY;
      marsBar.sketch(); //runs the final destination bar the reaches the screen when lightyears == 0

      if (mouseY - shipH/2 < marsBar.y) { //if the shjip reaches the bar the win screen appears
        screen = 3;
      }
    }
    image(ship, mouseX - shipW/2, mouseY - shipH/2, shipW, shipH); //ship movement created, follows cursor

    for (int i = 0; i < asteroids.size(); i++) {
      if (dist(mouseX-shipW/2, mouseY - shipH/2, asteroids.get(i).x - 15, asteroids.get(i).y - 15) < 35) { //hit detection between the asteroid and the ship
        screen = 4;
      }
    }
  }

  if (screen == 3) { //win screen
    background(0, 229, 0);
    fill(0, 150);
    rect(100, 92, 438, 290, 8);
    textSize(75);
    text("You Won!", 139, 256);
    retry1.sketch();  //retry button run
    TrophyImage.sketch(); //runs the bouncing skull image
  }


  if (screen == 4) { //lose screen
    background(200, 0, 25);
    fill(0, 150);
    rect(100, 92, 438, 290, 8);
    textSize(75);
    text("Game Over!", 139, 256);
    retry2.sketch(); //retry button run
    SkullImage.sketch(); //runs tbe bouncing trophy image
  }
}

void reset() { //a reset function created to run when the rest button clicked, sets the game to restart with base variables
  screen = 0;
  startCount = false;
  timer = 30;
  launchCount = 10;
  flashingCount = 30;
  stopBar = false;
  lightYears = 1000;
  marsSY = 0.1;
}
