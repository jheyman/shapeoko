// INCLUDE LIBRARY
#include <AlignedJoy.h>
#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include "Keyboard.h"

#define PIN_JOY1_X   A3  
#define PIN_JOY1_Y   A4 
#define PIN_JOY2_Z   A5  

#define BUTTON_XLEFT 4
#define BUTTON_XRIGHT 7
#define BUTTON_YUP 3
#define BUTTON_YDOWN 5
#define BUTTON_ZUP 6
#define BUTTON_ZDOWN 9
#define BUTTON_JOG1 1
#define BUTTON_JOG2 2
#define BUTTON_JOG3 8 
#define Z_ENABLE 0 
const int buttonPin[] = {BUTTON_XLEFT, BUTTON_XRIGHT, BUTTON_YUP, BUTTON_YDOWN, BUTTON_ZUP, BUTTON_ZDOWN, BUTTON_JOG1, BUTTON_JOG2, BUTTON_JOG3, Z_ENABLE};

int pinCount = 10;
int buttonState[] = {0,0,0,0,0,0,0,0,0,0};
int prevButtonState[] = {HIGH, HIGH, HIGH, HIGH, HIGH, HIGH, HIGH, HIGH, HIGH, HIGH};
long lastDebounceTime[] = {0,0,0,0,0,0,0,0,0,0};
long debounceDelay = 10;

AlignedJoy joystick_1(PIN_JOY1_X, PIN_JOY1_Y);
AlignedJoy joystick_2(PIN_JOY2_Z, PIN_JOY2_Z);

#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels
#define OLED_RESET     4 // Reset pin # (or -1 if sharing Arduino reset pin)
#define SCREEN_ADDRESS 0x3C

#define TEXT_SIZE 2
#define CHAR_XSIZE 6*TEXT_SIZE
#define CHAR_YSIZE 8*TEXT_SIZE

// declare an SSD1306 display object connected to I2C
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

void setup() {

  for (int pin = 0; pin < pinCount; pin++) {
    pinMode(buttonPin[pin], INPUT_PULLUP);
  }


 //Serial.println(F("STARTING!"));

 // initialize OLED display with address 0x3C for 128x64
  if(!display.begin(SSD1306_SWITCHCAPVCC, SCREEN_ADDRESS)) {
    Serial.println(F("SSD1306 allocation failed"));
    while(true);
  }
//Serial.println(F("SCREEN OK!"));
  display.clearDisplay();

  display.setTextSize(TEXT_SIZE);          // text size
  display.setTextColor(SSD1306_WHITE);     // text color
  displayCenteredMessage("Check USB");
  //display.setCursor(0, 0);        // position to display
  //display.println("Hello World!"); // text to display
  //display.display();               // show on OLED

 // SERIAL SETUP FOR DEBUG
 Serial.begin(115200);
 //while(!Serial){} 
 

  Keyboard.begin();

  displayCenteredMessage("Ready");
}

void displayCenteredMessage(char* msg) {  
    int cursorX;
    int cursorY;
  
    cursorX = (SCREEN_WIDTH - (strlen(msg))*CHAR_XSIZE)/2;
    cursorY = (SCREEN_HEIGHT - CHAR_YSIZE)/2;
   display.clearDisplay();
   display.setCursor(cursorX, cursorY);
   display.println(msg);
   display.display(); 
}

void logSerial(char* msg)
{
  Serial.println(msg);
  //displayCenteredMessage(msg);
}

int pressKey(int currentButton) {

  switch(currentButton) {
    case BUTTON_XLEFT:
     //Keyboard.press(KEY_LEFT_ARROW);
     //delay(5);
     //Keyboard.releaseAll();
     logSerial("keypressed: XLEFT");
      break;
    case BUTTON_XRIGHT:
     //Keyboard.press(KEY_RIGHT_ARROW);
     //delay(5);
     //Keyboard.releaseAll(); 
     logSerial("keypressed: XRIGHT");
     break;
    case BUTTON_YUP:
     //Keyboard.press(KEY_UP_ARROW);
     //delay(5);
     //Keyboard.releaseAll();  
     logSerial("keypressed: YUP");
     break;
    case BUTTON_YDOWN:
     //Keyboard.press(KEY_DOWN_ARROW);
     //delay(5);
     //Keyboard.releaseAll();  
     logSerial("keypressed: YDOWN"); 
     break;
    case BUTTON_ZUP:
     //Keyboard.press(KEY_PAGE_UP);
     //delay(5);
     //Keyboard.releaseAll(); 
     logSerial("keypressed: ZUP");  
     break;
    case BUTTON_ZDOWN:
     //Keyboard.press(KEY_PAGE_UP);
     //delay(5);
     //Keyboard.releaseAll(); 
     logSerial("keypressed: ZDOWN"); 
     break;
    case BUTTON_JOG1:
     //Keyboard.press('1');
     //delay(5);
     //Keyboard.releaseAll(); 
     logSerial("keypressed: JOG1");    
     break;
    case BUTTON_JOG2:
     //Keyboard.press('2');
     //delay(5);
     //Keyboard.releaseAll(); 
     logSerial("keypressed: JOG2");    
     break;  
    case BUTTON_JOG3:
     //Keyboard.press('3');
     //delay(5);
     //Keyboard.releaseAll(); 
     logSerial("keypressed: JOG3");     
     break;  
    case Z_ENABLE:
     //Keyboard.press('4');
     //delay(5);
     //Keyboard.releaseAll(); 
     logSerial("keypressed: Z_ENABLE");    
     break;                             
    default:
     break;
  }
}

int releaseKey(int currentButton) {
  switch(currentButton) {
    case BUTTON_XLEFT:
     //Keyboard.press(KEY_LEFT_ARROW);
     //delay(5);
     //Keyboard.releaseAll();
     logSerial("keyreleased: XLEFT");
      break;
    case BUTTON_XRIGHT:
     //Keyboard.press(KEY_RIGHT_ARROW);
     //delay(5);
     //Keyboard.releaseAll(); 
     logSerial("keyreleased: XRIGHT");
     break;
    case BUTTON_YUP:
     //Keyboard.press(KEY_UP_ARROW);
     //delay(5);
     //Keyboard.releaseAll();  
     logSerial("keyreleased: YUP");
     break;
    case BUTTON_YDOWN:
     //Keyboard.press(KEY_DOWN_ARROW);
     //delay(5);
     //Keyboard.releaseAll();  
     logSerial("keyreleased: YDOWN"); 
     break;
    case BUTTON_ZUP:
     //Keyboard.press(KEY_PAGE_UP);
     //delay(5);
     //Keyboard.releaseAll(); 
     logSerial("keyreleased: ZUP");  
     break;
    case BUTTON_ZDOWN:
     //Keyboard.press(KEY_PAGE_UP);
     //delay(5);
     //Keyboard.releaseAll(); 
     logSerial("keyreleased: ZDOWN"); 
     break;
    case BUTTON_JOG1:
     //Keyboard.press('1');
     //delay(5);
     //Keyboard.releaseAll(); 
     logSerial("keyreleased: JOG1");    
     break;
    case BUTTON_JOG2:
     //Keyboard.press('2');
     //delay(5);
     //Keyboard.releaseAll(); 
     logSerial("keyreleased: JOG2");    
     break;  
    case BUTTON_JOG3:
     //Keyboard.press('3');
     //delay(5);
     //Keyboard.releaseAll(); 
     logSerial("keyreleased: JOG3");     
     break;  
    case Z_ENABLE:
     //Keyboard.press('4');
     //delay(5);
     //Keyboard.releaseAll(); 
     logSerial("keyreleased: Z_ENABLE");    
     break;                             
    default:
     break;
  }
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
  
 // print joystick 1 axes value
 /*
 Serial.print("joystick_1 X -> ");
 Serial.print(joystick_1.read(X));
 Serial.print(" | Y -> ");
 Serial.println(joystick_1.read(Y));
 Serial.print(" | Z -> ");
 Serial.println(joystick_2.read(X));
 delay(500);
 */
}
