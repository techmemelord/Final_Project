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
 https://www.svgheart.com/product/hammer-silhouette-free-svg-file-mechanic-tool-hammer-clipart/?srsltid=AYCX9vJqd8LfqBl1km6tGosHExVthtuh0Grt6zBK54Lsc2tM9iP_boL3
 https://www.flaticon.com/free-icon/factory_4297439
 https://www.pngkey.com/maxpic/u2e6r5w7w7u2t4e6/
 https://iconscout.com/3d-icon/keycap-a-3d-icon_9741287
 */

PImage keyboard;
PImage typerImage;
PImage keyboardProImage;
PImage builderImage;
PImage factoryImage;
PImage advertiserImage;
PImage achievementIco;
PImage keyboardUpgradeIco;
PImage checkIco;
char previousKey;

boolean playingGame = false;
boolean achievementsUiOpen = false;
boolean keyTyped = false;
boolean keyboardIsBig = false;
boolean keyboardUpgradeBought = false;
boolean achievementsOpen = false;
boolean startAchievementEarned = false;
boolean sentenceAchievementEarned = false;
boolean earningAchievement = false;
boolean typingLessonUpgradeOwned = false;
boolean typingAmateurAchievementEarned = false;
boolean automationAchievementEarned = false;
boolean paycheckOnScreen = false;
boolean boostInUse = false;
boolean typerUpgradeOwned = false;
String achievementName = "";
String boostName = "";
String boostDescription = "";
int kpsBoostMult = 1;
int typingBoostMult = 1;
float keysTyped = 0;
float keysTypedEver = 0;
float keysFromKeyboard = 0;
float typingMultiplier = 1;
float keysPerSecond;

float typersOwned = 0;
float typerMultiplier = 1;
float typerCost;
float typerKPS;

float keyboardProKPS;
float keyboardProsOwned = 0;
float keyboardProCost;

float keyboardBuilderKPS;
float keyboardBuildersOwned = 0;
float keyboardBuilderCost;

float keyboardFactoryKPS;
float keyboardFactoriesOwned = 0;
float keyboardFactoryCost;

float keyboardAdvertiserKPS;
float keyboardAdvertisersOwned = 0;
float keyboardAdvertiserCost;

float keyboardSizeX = 225;
float keyboardSizeY = 100;
float keyboardPosX = 12;
float keyboardPosY = 250;

int timeWithBoost;
int timeSinceStart;
int timeInMenu;
int timePlayingGame;
int typingLessonUpgradeCost = 250;
int typerUpgradeCost = 100;
int timeAccumlated;
int timePaycheckOnScreen;
int timeBeforeBoost;
int paycheckPosX;
int paycheckPosY;

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

int minBuilderButtonY = 268;
int maxBuilderButtonY = minBuilderButtonY + 75;

int minFactoryButtonY = 343;
int maxFactoryButtonY = minFactoryButtonY + 75;

int minAdvertiserButtonY = 418;
int maxAdvertiserButtonY = minAdvertiserButtonY + 75;

int minAchievementButtonX = 500;
int minAchievementButtonY = 60;
int maxAchievementButtonX = minAchievementButtonX + 200;
int maxAchievementButtonY = minAchievementButtonY + 50;

int minStartAchievementButtonX = 100;
int maxStartAchievementButtonX = minStartAchievementButtonX + 50;
int minStartAchievementButtonY = 175;
int maxStartAchievementButtonY = minStartAchievementButtonY + 50;

int minSentenceAchievementButtonX = 160;
int maxSentenceAchievementButtonX = minSentenceAchievementButtonX + 50;
int minSentenceAchievementButtonY = 175;
int maxSentenceAchievementButtonY = minSentenceAchievementButtonY + 50;

int minAmateurAchievementButtonX = 220;
int maxAmateurAchievementButtonX = minAmateurAchievementButtonX + 50;
int minAmateurAchievementButtonY = 175;
int maxAmateurAchievementButtonY = minAmateurAchievementButtonY + 50;

int minAutomationAchievementButtonX = 280;
int maxAutomationAchievementButtonX = minAutomationAchievementButtonX + 50;
int minAutomationAchievementButtonY = 175;
int maxAutomationAchievementButtonY = minAutomationAchievementButtonY + 50;

int minKeyboardUpgradeX = 260;
int minKeyboardUpgradeY = 120;
int maxKeyboardUpgradeX = minKeyboardUpgradeX + 50;
int maxKeyboardUpgradeY = minKeyboardUpgradeY + 50;

int minTyperUpgradeX = 310;
int minTyperUpgradeY = 120;
int maxTyperUpgradeX = minTyperUpgradeX + 50;
int maxTyperUpgradeY = minTyperUpgradeY + 50;

void setup() {
  size(700, 500);
  keyboard = loadImage("keyboard.png");
  typerImage = loadImage("hand.png");
  keyboardProImage = loadImage("personTyping.png");
  builderImage = loadImage("hammer.png");
  factoryImage = loadImage("factory.png");
  advertiserImage = loadImage("manInSuit.png");
  achievementIco = loadImage("trophy.png");
  keyboardUpgradeIco = loadImage("keycapUpgIco.png");
  checkIco = loadImage("paycheck.png");
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
    if (boostInUse == true) {
      timeWithBoost = millis() - timeBeforeBoost;
      if (timeWithBoost >= 30000) {
        boostInUse = false;
        kpsBoostMult = 1;
        typingBoostMult = 1;
      }
    }
    if (earningAchievement == false) {
      timeSinceStart = millis(); //the millis function calculates how many milliseconds the program has been running for since it started up
    }
    stroke(50, 50, 50);
    typerKPS = (typersOwned * typerMultiplier * 0.1);
    keyboardProKPS = keyboardProsOwned;
    keyboardBuilderKPS = keyboardBuildersOwned * 10;
    keyboardFactoryKPS = keyboardFactoriesOwned * 75;
    keyboardAdvertiserKPS = keyboardAdvertisersOwned * 150;
    typerCost = 50 + (typersOwned * 50 * 0.2);
    keyboardProCost = 100 + (keyboardProsOwned * 100 * 0.3);
    keyboardBuilderCost = 750 + (keyboardBuildersOwned * 750 * 0.3);
    keyboardFactoryCost = 5000 + (keyboardFactoriesOwned * 5000 * 0.4);
    keyboardAdvertiserCost = 8000 + (keyboardAdvertisersOwned * 8000 * 0.4);
    keysPerSecond = (typerKPS + keyboardProKPS + keyboardBuilderKPS + keyboardFactoryKPS + keyboardAdvertiserKPS) * kpsBoostMult;
    background(116, 120, 129);
    fill(255, 255, 255);
    strokeWeight(0);
    textSize(32);
    text(int(keysTyped) + " Keys", 75, 45);
    textSize(24);
    text("Keys per second " + keysPerSecond, 25, 90);
    textSize(32);
    fill(50, 50, 50);
    rect(400, 110, 10, 400);
    rect(250, 0, 10, 500);
    rect(250, 110, 450, 10);
    rect(0, 490, 700, 10);
    fill(255, 255, 255);
    strokeWeight(3);
    rect(410, 118, 300, 75);
    rect(410, 193, 300, 75);
    rect(410, 268, 300, 75);
    rect(410, 343, 300, 75);
    rect(410, 418, 300, 75);

    if (keysTypedEver >= 50 && startAchievementEarned == false) {
      startAchievementEarned = true;
      earningAchievement = true;
      achievementName = "Fresh Start";
    } else if (keysTypedEver >= 250 && sentenceAchievementEarned == false) {
      sentenceAchievementEarned = true;
      earningAchievement = true;
      achievementName = "Written Sentence";
    } else if (typingAmateurAchievementEarned == false && keysFromKeyboard >= 100) {
      typingAmateurAchievementEarned = true;
      earningAchievement = true;
      achievementName = "Amateur Typing";
    } else if (automationAchievementEarned == false && keysPerSecond >= 1) {
      automationAchievementEarned = true;
      earningAchievement = true;
      achievementName = "Casual Automation";
    }

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
    if (keysTyped >= keyboardBuilderCost) {
      fill(0, 128, 0);
      if ((mouseX >= minUpgradeButtonX && mouseX <= maxUpgradeButtonX) && (mouseY >= minBuilderButtonY && mouseY <= maxBuilderButtonY)) {
        fill(0, 200, 0);
      }
    } else {
      fill(128, 0, 0);
      if ((mouseX >= minUpgradeButtonX && mouseX <= maxUpgradeButtonX) && (mouseY >= minBuilderButtonY && mouseY <= maxBuilderButtonY)) {
        fill(200, 0, 0);
      }
    }
    rect(410, 268, 75, 75);
    if (keysTyped >= keyboardFactoryCost) {
      fill(0, 128, 0);
      if ((mouseX >= minUpgradeButtonX && mouseX <= maxUpgradeButtonX) && (mouseY >= minFactoryButtonY && mouseY <= maxFactoryButtonY)) {
        fill(0, 200, 0);
      }
    } else {
      fill(128, 0, 0);
      if ((mouseX >= minUpgradeButtonX && mouseX <= maxUpgradeButtonX) && (mouseY >= minFactoryButtonY && mouseY <= maxFactoryButtonY)) {
        fill(200, 0, 0);
      }
    }
    rect(410, 343, 75, 75);
    if (keysTyped >= keyboardAdvertiserCost) {
      fill(0, 128, 0);
      if ((mouseX >= minUpgradeButtonX && mouseX <= maxUpgradeButtonX) && (mouseY >= minAdvertiserButtonY && mouseY <= maxAdvertiserButtonY)) {
        fill(0, 200, 0);
      }
    } else {
      fill(128, 0, 0);
      if ((mouseX >= minUpgradeButtonX && mouseX <= maxUpgradeButtonX) && (mouseY >= minAdvertiserButtonY && mouseY <= maxAdvertiserButtonY)) {
        fill(200, 0, 0);
      }
    }
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
    image(builderImage, 650, 290, 50, 50);
    image(factoryImage, 650, 368, 50, 50);
    image(advertiserImage, 650, 445, 50, 50);
    fill(0, 0, 0);
    textSize(22);
    text("Auto Typers", 495, 140);
    text("Keyboard Pros", 495, 215);
    text("Keyboard Builders", 495, 290);
    text("Keyboard Factories", 495, 365);
    text("Keyboard Advertisers", 495, 440);
    textSize(20);
    text("Price: " + int(typerCost) + " Keys", 495, 185);
    text("Price: " + int(keyboardProCost) + " Keys", 495, 260);
    text("Price: " + int(keyboardBuilderCost) + " Keys", 495, 335);
    text("Price: " + int(keyboardFactoryCost) + " Keys", 495, 410);
    text("Price: " + int(keyboardAdvertiserCost) + " Keys", 495, 485);
    fill(255, 255, 255);
    if (boostInUse == true) {
      textSize(18);
      text(boostName + "!", 65, 400);
      textSize(16);
      text(boostDescription + " for " + (((timeWithBoost / 1000) * -1) + 30) + " seconds", 10, 450);
    }
    rect(500, 60, 200, 50);
    fill(0, 0, 0);
    text("Achievements", 545, 95);
    if (automationAchievementEarned == true && typerUpgradeOwned == false) {
      fill(255, 255, 255);
      rect(310, 120, 50, 50);
      image(typerImage, 310, 120, 50, 50);
      if ((mouseX >= minTyperUpgradeX && mouseX <= maxTyperUpgradeX) && (mouseY >= minTyperUpgradeY && mouseY <= maxTyperUpgradeY)) {
        rect(375, 100, 250, 75);
        textSize(18);
        fill(0, 0, 0);
        text("Faster Typing Software", 385, 120);
        textSize(16);
        text("Doubles keys earned from typers", 385, 140);
        text("Price " + typerUpgradeCost + " Keys", 385, 160);
      }
    }
    if (typingAmateurAchievementEarned == true && typingLessonUpgradeOwned == false) {
      fill(255, 255, 255);
      rect(260, 120, 50, 50);
      image(keyboardUpgradeIco, 260, 120, 50, 50);
      if ((mouseX >= minKeyboardUpgradeX && mouseX <= maxKeyboardUpgradeX) && (mouseY >= minKeyboardUpgradeY && mouseY <= maxKeyboardUpgradeY)) {
        rect(325, 100, 250, 75);
        textSize(18);
        fill(0, 0, 0);
        text("Keyboard Lessons", 335, 120);
        textSize(16);
        text("Doubles keys earned from typers", 335, 140);
        text("Price " + typingLessonUpgradeCost + " Keys", 335, 160);
      }
    }
    if (earningAchievement == true) {
      int duration = 2000;
      int timeVisible = millis() - timeSinceStart;
      if (timeVisible < duration) {
        fill(255, 255, 255);
        stroke(50, 50, 50);
        rect(250, 430, 200, 75);
        textSize(18);
        fill(0, 0, 0);
        text("Achievement Earned:", 275, 460);
        text(achievementName, 275, 480);
      } else {
        earningAchievement = false;
        achievementName = "";
      }
    }
    if (achievementsOpen == true) {
      fill(116, 120, 129);
      stroke(50, 50, 50);
      rect(100, 100, 500, 300);
      if (automationAchievementEarned == true) {
        image(achievementIco, 280, 175, 50, 50);
        if ((mouseX >= minAutomationAchievementButtonX && mouseX <= maxAutomationAchievementButtonX) && (mouseY >= minAutomationAchievementButtonY && mouseY <= maxAutomationAchievementButtonY)) {
          fill(255, 255, 255);
          rect(330, 150, 200, 75);
          textSize(18);
          fill(0, 0, 0);
          text("Casual automation", 340, 175);
          text("Earn 1 key per second", 340, 210);
        }
      }
      if (typingAmateurAchievementEarned == true) {
        image(achievementIco, 220, 175, 50, 50);
        if ((mouseX >= minAmateurAchievementButtonX && mouseX <= maxAmateurAchievementButtonX) && (mouseY >= minAmateurAchievementButtonY && mouseY <= maxAmateurAchievementButtonY)) {
          fill(255, 255, 255);
          rect(270, 150, 225, 75);
          textSize(18);
          fill(0, 0, 0);
          text("Typing Amateur", 280, 175);
          text("Earn 100 keys from typing", 280, 210);
        }
      }
      if (sentenceAchievementEarned == true) {
        image(achievementIco, 160, 175, 50, 50);
        if ((mouseX >= minSentenceAchievementButtonX && mouseX <= maxSentenceAchievementButtonX) && (mouseY >= minSentenceAchievementButtonY && mouseY <= maxSentenceAchievementButtonY)) {
          fill(255, 255, 255);
          rect(210, 150, 150, 75);
          textSize(18);
          fill(0, 0, 0);

          text("Written Sentence", 220, 175);
          text("Earn 250 keys", 220, 210);
        }
      }
      if (startAchievementEarned == true) {
        image(achievementIco, 100, 175, 50, 50);
        if ((mouseX >= minStartAchievementButtonX && mouseX <= maxStartAchievementButtonX) && (mouseY >= minStartAchievementButtonY && mouseY <= maxStartAchievementButtonY)) {
          fill(255, 255, 255);
          rect(150, 150, 150, 75);
          textSize(18);
          fill(0, 0, 0);
          text("Fresh Start", 160, 175);
          text("Earn 50 keys", 160, 210);
        }
      }
      textSize(32);
      fill(255, 255, 255);
      text("Achievements", 260, 140);
    }
    timePlayingGame = millis() - timeAccumlated - timeInMenu - timePaycheckOnScreen;
    if (timePlayingGame >= 5000 && paycheckOnScreen == false && boostInUse == false) {
      timeAccumlated = millis() - timeInMenu;
      int boostSpawnChance = int(random(1, 2));
      if (boostSpawnChance == 1) {
        paycheckPosX = int(random(150, 551));
        paycheckPosY = int(random(150, 551));
        paycheckOnScreen = true;
      }
    }

    if (paycheckOnScreen == true) {
      image(checkIco, paycheckPosX, paycheckPosY, 50, 50);
      timePaycheckOnScreen = millis() - timeAccumlated - timeInMenu;
      if (timePaycheckOnScreen >= 5000 && paycheckOnScreen == true) {
        paycheckOnScreen = false;
        timePaycheckOnScreen = 0;
      }
    }
    if (keysPerSecond > 0) {
      keysTyped = keysTyped + (keysPerSecond / frameRate); //frameRate outputs to the amount of frames that the processing sketch is currently running at
      keysTypedEver = keysTypedEver + (keysPerSecond / frameRate);
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
  int maxPaycheckX = paycheckPosX + 50;
  int maxPaycheckY = paycheckPosY + 50;
  if ((playingGame == false) && (mouseX >= minStartButtonX && mouseX <= maxStartButtonX) && (mouseY >= minStartButtonY && mouseY <= maxStartButtonY)) {
    playingGame = true;
    timeInMenu = millis();
  } else if ((keysTyped >= typerCost) && (mouseX >= minUpgradeButtonX && mouseX <= maxUpgradeButtonX) && (mouseY >= minTypersButtonY && mouseY <= maxTypersButtonY)) {
    keysTyped = keysTyped - typerCost;
    typersOwned = typersOwned + 1;
  } else if ((keysTyped >= keyboardProCost) && (mouseX >= minUpgradeButtonX && mouseX <= maxUpgradeButtonX) && (mouseY >= minProButtonY && mouseY <= maxProButtonY)) {
    keysTyped = keysTyped - keyboardProCost;
    keyboardProsOwned = keyboardProsOwned + 1;
  } else if ((keysTyped >= keyboardBuilderCost) && (mouseX >= minUpgradeButtonX && mouseX <= maxUpgradeButtonX) && (mouseY >= minBuilderButtonY && mouseY <= maxBuilderButtonY)) {
    keysTyped = keysTyped - keyboardBuilderCost;
    keyboardBuildersOwned = keyboardBuildersOwned + 1;
  } else if ((keysTyped >= keyboardFactoryCost) && (mouseX >= minUpgradeButtonX && mouseX <= maxUpgradeButtonX) && (mouseY >= minFactoryButtonY && mouseY <= maxFactoryButtonY)) {
    keysTyped = keysTyped - keyboardFactoryCost;
    keyboardFactoriesOwned = keyboardFactoriesOwned + 1;
  } else if ((keysTyped >= keyboardAdvertiserCost) && (mouseX >= minUpgradeButtonX && mouseX <= maxUpgradeButtonX) && (mouseY >= minAdvertiserButtonY && mouseY <= maxAdvertiserButtonY)) {
    keysTyped = keysTyped - keyboardAdvertiserCost;
    keyboardAdvertisersOwned = keyboardAdvertisersOwned + 1;
  } else if ((mouseX >= minAchievementButtonX && mouseX <= maxAchievementButtonX) && (mouseY >= minAchievementButtonY && mouseY <= maxAchievementButtonY)) {
    if (achievementsOpen == false) {
      achievementsOpen = true;
    } else {
      achievementsOpen = false;
    }
  } else if ((typingAmateurAchievementEarned == true && typingLessonUpgradeOwned == false && keysTyped >= typingLessonUpgradeCost) && ((mouseX >= minKeyboardUpgradeX && mouseX <= maxKeyboardUpgradeX) && (mouseY >= minKeyboardUpgradeY && mouseY <= maxKeyboardUpgradeY))) {
    keysTyped = keysTyped - typingLessonUpgradeCost;
    typingMultiplier = typingMultiplier * 2;
    typingLessonUpgradeOwned = true;
  } else if ((automationAchievementEarned == true && typerUpgradeOwned == false && keysTyped >= typerUpgradeCost) && ((mouseX >= minTyperUpgradeX && mouseX <= maxTyperUpgradeX) && (mouseY >= minTyperUpgradeY && mouseY <= maxTyperUpgradeY))) {
    keysTyped = keysTyped - typerUpgradeCost;
    typerMultiplier = typerMultiplier * 2;
    typerUpgradeOwned = true;
  } else if ((mouseX >= paycheckPosX && mouseX <= maxPaycheckX) && (mouseY >= paycheckPosY && mouseY <= maxPaycheckY)) {
    paycheckOnScreen = false;
    if (keysPerSecond > 0) {
      int boostChoiceNum = int(random(1, 6));
      if (boostChoiceNum == 1) {
        keysTyped = keysTyped + (15 + (15 * keysPerSecond));
        keysTypedEver = keysTypedEver + (15 + (15 * keysPerSecond));
      } else if (boostChoiceNum == 2) {
        typingBoostMult = typingBoostMult * 2;
        timeBeforeBoost = millis();
        boostInUse = true;
        boostName = "Dual Typing";
        boostDescription = "x2 keys from typing";
      } else if (boostChoiceNum == 3) {
        typingBoostMult = 3;
        boostName = "Triple Typing";
        boostDescription = "x3 keys from typing";
        boostInUse = true;
        timeBeforeBoost = millis();
      } else if (boostChoiceNum == 4) {
        timeBeforeBoost = millis();
        boostInUse = true;
        kpsBoostMult = 2;
        boostName = "Double Production";
        boostDescription = "x2 KPS";
      } else if (boostChoiceNum == 5) {
        timeBeforeBoost = millis();
        boostInUse = true;
        kpsBoostMult = 3;
        boostName = "Triple Production";
        boostDescription = "x3 KPS";
      }
    } else {
      int boostChoiceNum = int(random(1, 4));
      if (boostChoiceNum == 1) {
        keysTyped = keysTyped + 30;
        keysTypedEver = keysTypedEver + 30;
      } else if (boostChoiceNum == 2) {
        typingBoostMult = 2;
        boostName = "Dual Typing";
        boostDescription = "x2 keys from typing";
        boostInUse = true;
        timeBeforeBoost = millis();
      } else if (boostChoiceNum == 3) {
        typingBoostMult = 3;
        boostName = "Triple Typing";
        boostDescription = "x3 keys from typing";
        boostInUse = true;
        timeBeforeBoost = millis();
      }
    }
  }
}
  void keyPressed() {
    if (key != previousKey && playingGame == true) {
      keysTyped = keysTyped  + (typingMultiplier * typingBoostMult);
      keysFromKeyboard = keysFromKeyboard + (typingMultiplier * typingBoostMult);
      keysTypedEver = keysTypedEver + (typingMultiplier * typingBoostMult);
      previousKey = key;
      keyTyped = true;
      keyboardSizeX = 225;
      keyboardSizeY = 100;
      keyboardPosX = 12;
      keyboardPosY = 250;
    }
  }
