/*
Oliver Amisano
 Final Processing project
 TODO: Add brief description of final project here
 */

/*
Image Citations:
 https://webstockreview.net/images/keyboard-clipart-transparent-background-4.png
 https://pngtree.com/freepng/hand-palms_8837556.html
 */

PImage keyboard;
PImage typerImage;
PImage keyboardProImage;
char previousKey;
boolean playingGame = false;
float keysTyped = 0;
float typingMultiplier = 1;
float typersOwned = 0;
float typerCost;
float typerKPS;
float keysPerSecond;
void setup() {
  size(700, 500);
  keyboard = loadImage("keyboard.png");
  typerImage = loadImage("hand.png");
  keyboardProImage = loadImage("personTyping.png");
}

void draw() {
  if (playingGame == false) {
    background(0, 0, 0);
    textSize(32);
    fill(255, 255, 255);
    text("Keyboard Typer", 250, 75);
    textSize(18);
    text("A game about keyboards and typing", 225, 100);
    textSize(32);
    text("Click the button to start playing", 150, 200);
    fill(0, 128, 0);
    rect(250, 250, 200, 75);
    fill(255, 255, 255);
    textSize(56);
    text("Play", 300, 300);
  } else if (playingGame == true) {
    typerKPS = typersOwned;
    typerCost = 50 + (typersOwned * 50 * 0.2);
    keysPerSecond = typerKPS * 0.1;
    background(81, 89, 131);
    fill(255, 255, 255);
    strokeWeight(0);
    textSize(32);
    text(int(keysTyped) + " Keys", 75, 45);
    textSize(24);
    text("Keys per second " + keysPerSecond, 25, 90);
    image(keyboard, 12, 250, 225, 100);
    textSize(32);
    fill(0, 0, 0);
    rect(0, 100, 700, 10);
    rect(250, 0, 10, 500);
    rect(400, 100, 10, 400);
    fill(255, 255, 255);
    strokeWeight(3);
    rect(410, 118, 300, 75);
    rect(410, 193, 300, 75);
    rect(410, 268, 300, 75);
    rect(410, 343, 300, 75);
    rect(410, 418, 300, 75);
    if (keysTyped >= typerCost) {
      fill(0, 128, 0);
    } else {
      fill(128, 0, 0);
    }
    rect(410, 118, 75, 75);
    rect(410, 193, 75, 75);
    rect(410, 268, 75, 75);
    rect(410, 343, 75, 75);
    rect(410, 418, 75, 75);
    fill(255, 255, 255);
    text("Buy", 420, 165);
    text("Buy", 420, 240);
    text("Buy", 420, 315);
    text("Buy", 420, 390);
      text("Buy", 420, 465);
      image(typerImage, 625, 120, 70, 70);
            image(keyboardProImage, 625, 185, 90, 90);
    fill(0, 0, 0);
    textSize(22);
    text("Auto Typers", 495, 140);
    text("Keyboard Pros", 495, 215);
    textSize(20);
    text("Price: " + int(typerCost) + " Keys", 495, 185);
        text("Price: " + int(typerCost) + " Keys", 495, 260);
    if (keysPerSecond > 0) {
      keysTyped = keysTyped + (keysPerSecond / frameRate); //frameRate outputs to the amount of frames that the processing sketch is currently running at
    }
  }
}

void mousePressed() {
  int minButtonX = 250;
  int minButtonY = 250;
  int maxButtonX = minButtonX + 200;
  int maxButtonY = minButtonY + 75;
  int minTypersButtonX = 410;
  int minTypersButtonY = 118;
  int maxTypersButtonX = minTypersButtonX + 75;
  int maxTypersButtonY = minTypersButtonY + 75;
  if ((playingGame == false) && (mouseX >= minButtonX && mouseX <= maxButtonX) && (mouseY >= minButtonY && mouseY <= maxButtonY)) {
    playingGame = true;
  } else if ((keysTyped >= typerCost) && (mouseX >= minTypersButtonX && mouseX <= maxTypersButtonX) && (mouseY >= minTypersButtonY && mouseY <= maxTypersButtonY)) {
    keysTyped = keysTyped - typerCost;
    typersOwned = typersOwned + 1;
  }
}
void keyPressed() {
  if (key != previousKey && playingGame == true) {
    keysTyped = keysTyped  + typingMultiplier;
    previousKey = key;
  }
}
