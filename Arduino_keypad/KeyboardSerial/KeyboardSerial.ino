#include "Keyboard.h"

//#define SERIAL
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
#define LED_JOG1 5
#define LED_JOG2 4
#define LED_JOG3 2
#define LED_JOG4 3
const int buttonPin[] = {BUTTON_XLEFT, BUTTON_XRIGHT, BUTTON_YUP, BUTTON_YDOWN, BUTTON_ZUP, BUTTON_ZDOWN, BUTTON_JOG1, BUTTON_JOG2, BUTTON_JOG3, BUTTON_JOG4};

int pinCount = 10;
int buttonState[] = {0,0,0,0,0,0,0,0,0,0};
int prevButtonState[] = {HIGH, HIGH, HIGH, HIGH, HIGH, HIGH, HIGH, HIGH, HIGH, HIGH};
long lastDebounceTime[] = {0,0,0,0,0,0,0,0,0,0};
long debounceDelay = 10;

// LED left to right
const int ledPin[] = {LED_JOG1, LED_JOG2, LED_JOG3, LED_JOG4};
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

#ifdef SERIAL
  Serial.begin(9600);
#endif

  Keyboard.begin();
}

void logSerial(char* msg)
{
#ifdef KEYBOARD
  Serial.println(msg);
#endif
}

int pressKey(int currentButton) {

  switch(currentButton) {
    case BUTTON_XLEFT:
     Keyboard.press(KEY_LEFT_ARROW);
     delay(5);
     Keyboard.releaseAll();
     logSerial("keypressed: XLEFT");
      break;
    case BUTTON_XRIGHT:
     Keyboard.press(KEY_RIGHT_ARROW);
     delay(5);
     Keyboard.releaseAll(); 
     logSerial("keypressed: XRIGHT");
     break;
    case BUTTON_YUP:
     Keyboard.press(KEY_UP_ARROW);
     delay(5);
     Keyboard.releaseAll();  
     logSerial("keypressed: YUP");
     break;
    case BUTTON_YDOWN:
     Keyboard.press(KEY_DOWN_ARROW);
     delay(5);
     Keyboard.releaseAll();  
     logSerial("keypressed: YDOWN"); 
     break;
    case BUTTON_ZUP:
     Keyboard.press(KEY_PAGE_UP);
     delay(5);
     Keyboard.releaseAll(); 
     logSerial("keypressed: ZUP");  
     break;
    case BUTTON_ZDOWN:
     Keyboard.press(KEY_PAGE_UP);
     delay(5);
     Keyboard.releaseAll(); 
     logSerial("keypressed: ZDOWN"); 
     break;
    case BUTTON_JOG1:
     Keyboard.press('1');
     delay(5);
     Keyboard.releaseAll(); 
     logSerial("keypressed: JOG1");    
     digitalWrite(LED_JOG1, HIGH);
     digitalWrite(LED_JOG2, LOW);
     digitalWrite(LED_JOG3, LOW);
     digitalWrite(LED_JOG4, LOW);
     break;
    case BUTTON_JOG2:
     Keyboard.press('2');
     delay(5);
     Keyboard.releaseAll(); 
     logSerial("keypressed: JOG2");    
     digitalWrite(LED_JOG1, LOW);
     digitalWrite(LED_JOG2, HIGH);
     digitalWrite(LED_JOG3, LOW);
     digitalWrite(LED_JOG4, LOW);
     break;  
    case BUTTON_JOG3:
     Keyboard.press('3');
     delay(5);
     Keyboard.releaseAll(); 
     logSerial("keypressed: JOG3");    
     digitalWrite(LED_JOG1, LOW);
     digitalWrite(LED_JOG2, LOW);
     digitalWrite(LED_JOG3, HIGH);
     digitalWrite(LED_JOG4, LOW);        
     break;  
    case BUTTON_JOG4:
     Keyboard.press('4');
     delay(5);
     Keyboard.releaseAll(); 
     logSerial("keypressed: JOG4");    
     digitalWrite(LED_JOG1, LOW);
     digitalWrite(LED_JOG2, LOW);
     digitalWrite(LED_JOG3, LOW);
     digitalWrite(LED_JOG4, HIGH);      
     break;                             
    default:
     break;
  }
}

int releaseKey(int currentButton) {
}

void loop() {
  for (int pin = 0; pin < pinCount; pin++) {
    
    buttonState[pin] = digitalRead(buttonPin[pin]);

    if ((buttonState[pin] != prevButtonState[pin])) {
      if ((millis() - lastDebounceTime[pin]) > debounceDelay) {

        if (buttonState[pin] == LOW){
          pressKey(buttonPin[pin]);
        } else {
          releaseKey(buttonPin[pin]);
        }
       
        lastDebounceTime[pin] = millis();
      }
    }

    prevButtonState[pin] = buttonState[pin];
  }
  
}


