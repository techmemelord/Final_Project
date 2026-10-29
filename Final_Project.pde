/*
Oliver Amisano
 Final Processing project
 TODO: Add brief description of final project here
 Description:
 This game is a game similar to cookie clicker, but you use your keyboard to gain points rather than clicking the mouse on a screen, the game itself revolves around keyboards rather than cookies.
 This means that the points are classified as "keys" rather than cookies.
 */

/*
Image Citations:
 https://webstockreview.net/images/keyboard-clipart-transparent-background-4.png
 https://pngtree.com/freepng/hand-palms_8837556.html
 */

PImage keyboard;
PImage typerImage;
PImage keyboardProImage;
PImage builderImage;
char previousKey;
boolean playingGame = false;
boolean keyTyped = false;
boolean keyboardIsBig = false;
float keysTyped = 0;
float typingMultiplier = 1;
float typersOwned = 0;
float typerCost;
float typerKPS;
float keysPerSecond;
float keyboardProKPS;
float keyboardProsOwned = 0;
float keyboardProCost;
float keyboardBuilderKPS;
float keyboardBuildersOwned = 0;
float keyboardBuilderCost;
float keyboardSizeX = 225;
float keyboardSizeY = 100;
float keyboardPosX = 12;
float keyboardPosY = 250;

int minStartButtonX = 250;
int minStartButtonY = 250;
int maxStartButtonX = minStartButtonX  + 200;
int maxStartButtonY = minStartButtonY + 75;

int minUpgradeButtonX = 410;
int maxUpgradeButtonX = minUpgradeButtonX + 75;

int minTypersButtonY = 118;
int maxTypersButtonY = minTypersButtonY + 75;

int minProButtonY = 193;
int maxProButtonY = minProButtonY + 75;
void setup() {
  size(700, 500);
  keyboard = loadImage("keyboard.png");
  typerImage = loadImage("hand.png");
  keyboardProImage = loadImage("personTyping.png");
  builderImage = loadImage("hammer.png");
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
    if ((mouseX >= minStartButtonX && mouseX <= maxStartButtonX) && (mouseY >= minStartButtonY && mouseY <= maxStartButtonY)) {
      fill(0, 200, 0);
    } else {
      fill(0, 128, 0);
    }
    rect(250, 250, 200, 75);
    fill(255, 255, 255);
    textSize(56);
    text("Play", 300, 300);
  } else if (playingGame == true) {
    stroke(50, 50, 50);
    typerKPS = (typersOwned * 0.1);
    keyboardProKPS = keyboardProsOwned;
    keyboardBuilderKPS = keyboardBuildersOwned * 10;
    typerCost = 50 + (typersOwned * 50 * 0.2);
    keyboardProCost = 100 + (keyboardProsOwned * 100 * 0.3);
    keysPerSecond = typerKPS + keyboardProKPS + keyboardBuilderKPS;
    background(116, 120, 129);
    fill(255, 255, 255);
    strokeWeight(0);
    textSize(32);
    text(int(keysTyped) + " Keys", 75, 45);
    textSize(24);
    text("Keys per second " + keysPerSecond, 25, 90);
    textSize(32);
    fill(50, 50, 50);
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
      if ((mouseX >= minUpgradeButtonX && mouseX <= maxUpgradeButtonX) && (mouseY >= minTypersButtonY && mouseY <= maxTypersButtonY)) {
        fill(0, 200, 0);
      }
    } else {
      fill(128, 0, 0);
      if ((mouseX >= minUpgradeButtonX && mouseX <= maxUpgradeButtonX) && (mouseY >= minTypersButtonY && mouseY <= maxTypersButtonY)) {
        fill(200, 0, 0);
      }
    }
    rect(410, 118, 75, 75);
    if (keysTyped >= keyboardProCost) {
      fill(0, 128, 0);
      if ((mouseX >= minUpgradeButtonX && mouseX <= maxUpgradeButtonX) && (mouseY >= minProButtonY && mouseY <= maxProButtonY)) {
        fill(0, 200, 0);
      }
    } else {
      fill(128, 0, 0);
      if ((mouseX >= minUpgradeButtonX && mouseX <= maxUpgradeButtonX) && (mouseY >= minProButtonY && mouseY <= maxProButtonY)) {
        fill(200, 0, 0);
      }
    }
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
    image(keyboard, keyboardPosX, keyboardPosY, keyboardSizeX, keyboardSizeY);
    image(typerImage, 625, 120, 70, 70);
    image(keyboardProImage, 625, 185, 90, 90);
    image(builderImage,625, 270, 75,75);
    fill(0, 0, 0);
    textSize(22);
    text("Auto Typers", 495, 140);
    text("Keyboard Pros", 495, 215);
    textSize(20);
    text("Price: " + int(typerCost) + " Keys", 495, 185);
    text("Price: " + int(keyboardProCost) + " Keys", 495, 260);
    if (keysPerSecond > 0) {
      keysTyped = keysTyped + (keysPerSecond / frameRate); //frameRate outputs to the amount of frames that the processing sketch is currently running at
    }
    if (keyTyped == true && keyboardSizeX <= 250 && keyboardSizeY <= 125 && keyboardPosX >= 0 && keyboardPosY >= 225 && keyboardIsBig == false) {
      keyboardSizeX += (25 / frameRate * 10);
      keyboardSizeY += (25 / frameRate * 10);
      keyboardPosX -= (12 / frameRate * 10);
      keyboardPosY -= (25 / frameRate * 10);
      if (keyboardSizeX >= 250 && keyboardSizeY >= 125 && keyboardPosX <= 0 && keyboardPosY <= 225 ) {
        keyboardIsBig = true;
      }
    } else if (keyTyped == true && keyboardSizeX >= 225 && keyboardSizeY >= 100 && keyboardPosX <= 12 && keyboardPosY <= 250 && keyboardIsBig == true) {
      keyboardSizeX -= (25 / frameRate * 10);
      keyboardSizeY -= (25 / frameRate * 10);
      keyboardPosX += (12 / frameRate * 10);
      keyboardPosY += (25 / frameRate * 10);
    } else {
      keyTyped = false;
      keyboardIsBig = false;
    }
  }
}

void mousePressed() {
  if ((playingGame == false) && (mouseX >= minStartButtonX && mouseX <= maxStartButtonX) && (mouseY >= minStartButtonY && mouseY <= maxStartButtonY)) {
    playingGame = true;
  } else if ((keysTyped >= typerCost) && (mouseX >= minUpgradeButtonX && mouseX <= maxUpgradeButtonX) && (mouseY >= minTypersButtonY && mouseY <= maxTypersButtonY)) {
    keysTyped = keysTyped - typerCost;
    typersOwned = typersOwned + 1;
  } else if ((keysTyped >= keyboardProCost) && (mouseX >= minUpgradeButtonX && mouseX <= maxUpgradeButtonX) && (mouseY >= minProButtonY && mouseY <= maxProButtonY)) {
    keysTyped = keysTyped - keyboardProCost;
    keyboardProsOwned = keyboardProsOwned + 1;
  }
}
void keyPressed() {
  if (key != previousKey && playingGame == true) {
    keysTyped = keysTyped  + typingMultiplier;
    previousKey = key;
    keyTyped = true;
    keyboardSizeX = 225;
    keyboardSizeY = 100;
    keyboardPosX = 12;
    keyboardPosY = 250;
  }
}
