#include "Keyboard.h"

// buttons in that order:
// left, right, up, down, zup, zdown, jogstepsmallest, jogstepsmall, jogsteplarge, jogstep fast

#define BUTTON_XLEFT 16
#define BUTTON_XRIGHT 14
#define BUTTON_YUP 15
#define BUTTON_YDOWN 10
#define BUTTON_ZUP A0
#define BUTTON_ZDOWN A2
#define BUTTON_JOG1 9
#define BUTTON_JOG2 8
#define BUTTON_JOG3 7 
#define BUTTON_JOG4 6
const int buttonPin[] = {BUTTON_XLEFT, BUTTON_XRIGHT, BUTTON_YUP, BUTTON_YDOWN, BUTTON_ZUP, BUTTON_ZDOWN, BUTTON_JOG1, BUTTON_JOG2, BUTTON_JOG3, BUTTON_JOG4};

int pinCount = 10;
int buttonState[] = {0,0,0,0,0,0,0,0,0,0};
int prevButtonState[] = {HIGH, HIGH, HIGH, HIGH, HIGH, HIGH, HIGH, HIGH, HIGH, HIGH};
long lastDebounceTime[] = {0,0,0,0,0,0,0,0,0,0};
long debounceDelay = 10;

// LED left to right
const int ledPin[] = {5, 4, 2, 3};
int ledpinCount = 4;

void setup() {
  for (int pin = 0; pin < pinCount; pin++) {
    pinMode(buttonPin[pin], INPUT_PULLUP);
  }
  
  for (int ledpin = 0; ledpin < ledpinCount; ledpin++) {
    pinMode(ledPin[ledpin], OUTPUT);
    digitalWrite(ledPin[ledpin], HIGH);
    delay(100);
    digitalWrite(ledPin[ledpin], LOW);
  }

  Serial.begin(9600);
  //Keyboard.begin();
}

int pressKey(int currentButton) {
    if (currentButton == 0) {
      //Keyboard.press(ctrlKey);
      Keyboard.press('a');
      delay(100);
    }
    else if (currentButton  == 1) {
      //Keyboard.press(ctrlKey);
      Keyboard.press('b');
      delay(100);
    }
    else if (currentButton  == 2) {
      //Keyboard.press(ctrlKey);
      Keyboard.press('c');
      delay(100);
    }
    else if (currentButton  == 3) {
      //Keyboard.press(ctrlKey);
      Keyboard.press('d');
      delay(100);
    }
}

int releaseKey(int currentButton) {
    if (currentButton == 0) {
      //Keyboard.press(ctrlKey);
      Keyboard.release('a');
    }
    else if (currentButton  == 1) {
      //Keyboard.press(ctrlKey);
      Keyboard.release('b');
    }
    else if (currentButton  == 2) {
      //Keyboard.press(ctrlKey);
      Keyboard.release('c');
    }
    else if (currentButton  == 3) {
      //Keyboard.press(ctrlKey);
      Keyboard.release('d');
    }
}
void loop() {
  for (int pin = 0; pin < pinCount; pin++) {
    
    buttonState[pin] = digitalRead(buttonPin[pin]);

    if ((buttonState[pin] != prevButtonState[pin])) {
      if ((millis() - lastDebounceTime[pin]) > debounceDelay) {

        if (buttonState[pin] == LOW){
          //pressKey(pin);
          Serial.print("keypressed:");
          Serial.println(pin);

          switch(pin) {
            case 3:
              digitalWrite(ledPin[3], HIGH);
              delay(200);
              digitalWrite(ledPin[3], LOW);
              break;
            case 2:
              digitalWrite(ledPin[2], HIGH);
              delay(200);
              digitalWrite(ledPin[2], LOW);            
             break;
            case 1:
              digitalWrite(ledPin[1], HIGH);
              delay(200);
              digitalWrite(ledPin[1], LOW);
             break;
            case 0:
              digitalWrite(ledPin[0], HIGH);
              delay(200);
              digitalWrite(ledPin[0], LOW);
             break;
            default:
             break;
          }
        } else {
          //releaseKey(pin);
          Serial.print("keyreleased:");
          Serial.println(pin);
        }
        
        lastDebounceTime[pin] = millis();
      }
    }

    prevButtonState[pin] = buttonState[pin];
  }
  
}


