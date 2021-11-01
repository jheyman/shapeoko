#include <AlignedJoy.h>
#include <Bounce2.h>
#include <Wire.h>
#include <Coordinates.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>

// Arduino analog IOs the joystick signals are connected to
#define PIN_JOY1_X   A3  
#define PIN_JOY1_Y   A4 
#define PIN_JOY1_Z   A5

// Arduino GPIOs the various buttons are connected to
#define BUTTON_XLEFT 13
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
const int nbButtons=10;
Bounce2::Button buttons[nbButtons];

#define JOYSTICK_MIN 0
#define JOYSTICK_MAX 1023
#define JOYSTICK_MID JOYSTICK_MAX / 2
#define JOYSTICK_MAX_R 512 // pot is actually square :\, so this is the max radius of X=0.
#define JOYSTICK_R_TOLERANCE 50
#define JOYSTICK_REPORTING_MS 100

AlignedJoy joystick_1(PIN_JOY1_X, PIN_JOY1_Y);
Coordinates point = Coordinates();
unsigned long lastJoystickPrintTime=0;

int rVal = 0;
int xVal = 0;
int yVal = 0;
int zVal = 0;
const float RAD_PER_SEG = M_PI / 8;

#define JOG_STEP_1mm 1.0
#define JOG_STEP_0mm1 0.1
#define JOG_STEP_0mm05 0.05
float currentJogStep = JOG_STEP_1mm;

#define SCREEN_WIDTH 128 // OLED display width, in pixels
#define SCREEN_HEIGHT 64 // OLED display height, in pixels
#define OLED_RESET     4 // Reset pin # (or -1 if sharing Arduino reset pin)
#define SCREEN_ADDRESS 0x3C

#define TEXT_SIZE 3
#define CHAR_XSIZE 6*TEXT_SIZE
#define CHAR_YSIZE 8*TEXT_SIZE

// declare an SSD1306 display object connected to I2C
Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

void setup() {

  for (uint8_t i = 0; i < nbButtons; i++) {
    buttons[i].attach(buttonPin[i], INPUT_PULLUP);
    buttons[i].setPressedState(LOW);
  }

  if(!display.begin(SSD1306_SWITCHCAPVCC, SCREEN_ADDRESS)) {
    Serial.println(F("SSD1306 allocation failed"));
    while(true);
  }
  display.clearDisplay();

  display.setTextSize(TEXT_SIZE);          // text size
  display.setTextColor(SSD1306_WHITE);     // text color
  //display.setCursor(0, 0);        // position to display
  //display.println("Hello World!"); // text to display
  //display.display();               // show on OLED

  Serial.begin(115200);
  
  displayCenteredMessage("1mm");
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
   delay(100); 
}

void keyPressed(int currentButton) {

  switch(currentButton) {
    case BUTTON_JOG1:
     currentJogStep = JOG_STEP_1mm;
     displayCenteredMessage("1mm");
     break;
    case BUTTON_JOG2:
     currentJogStep = JOG_STEP_0mm1;
     displayCenteredMessage("0.1mm");
     break;  
    case BUTTON_JOG3:
     currentJogStep = JOG_STEP_0mm05;
     displayCenteredMessage("0.05mm");
     break; 
    case Z_ENABLE:
     break;                              
    default: // if it's a button to be notified externally:
      Serial.print("BT|");
      switch(currentButton) {
        case BUTTON_XLEFT:
         Serial.print("XLEFT|");
         Serial.print(currentJogStep);
          break;
        case BUTTON_XRIGHT:
         Serial.print("XRIGHT|");
         Serial.print(currentJogStep);
         break;
        case BUTTON_YUP:
         Serial.print("YUP|");
         Serial.print(currentJogStep);
         break;
        case BUTTON_YDOWN:
         Serial.print("YDOWN|");
         Serial.print(currentJogStep);
         break;
        case BUTTON_ZUP:
         Serial.print("ZUP|");
         Serial.print(currentJogStep);  
         break;
        case BUTTON_ZDOWN:
         Serial.print("ZDOWN|");
         Serial.print(currentJogStep); 
         break;                       
        default:
         break;
      } 
      Serial.print("\n");   
      break;
   }    
}

void printJoystickData(int x, int y, int z, float angle, float r) {
  Serial.print("JD|");

  if(rVal < JOYSTICK_R_TOLERANCE) {
    Serial.print("CENTER");
  } else {
    if(angle < RAD_PER_SEG) {
      Serial.print("EAST");
    } else if(angle < 3*RAD_PER_SEG) {
      Serial.print("NORTHEAST");
    } else if(angle < 5*RAD_PER_SEG) {
      Serial.print("NORTH");
    } else if(angle < 7*RAD_PER_SEG) {
      Serial.print("NORTHWEST");
    } else if(angle < 9*RAD_PER_SEG) {
      Serial.print("WEST");
    } else if(angle < 11*RAD_PER_SEG) {
      Serial.print("SOUTHWEST");
    } else if(angle < 13*RAD_PER_SEG) {
      Serial.print("SOUTH");
    } else if(angle < 15*RAD_PER_SEG) {
      Serial.print("SOUTHEAST");
    } else if(angle <= 2*M_PI) {
      Serial.print("EAST");
    } else {
      Serial.print("DUNNO-");
      Serial.print(angle);
    }
  }

  Serial.print("|");
  Serial.print(angle);
  
  Serial.print("|");
  Serial.print(min(r / JOYSTICK_MAX_R, 1.0));

  Serial.print("|");
  Serial.print((z - JOYSTICK_MID)/float(JOYSTICK_MID));

  Serial.print("|");
  Serial.print(buttons[nbButtons-1].isPressed()); // send 0 or 1 depending on whether Z enable button is pressed

  Serial.print("\n");
}

void handleJoystick() {
    xVal = joystick_1.read(X);
    yVal = JOYSTICK_MAX - joystick_1.read(Y); // Y is in the opposite direction that way I wired it
    zVal = analogRead(PIN_JOY1_Z);

    xVal = JOYSTICK_MID - xVal;

    if(yVal >= JOYSTICK_MID) {
      yVal = 1 - (yVal - JOYSTICK_MID);
    } else {
      yVal = JOYSTICK_MID - yVal; 
    }

    point.fromCartesian(xVal, yVal);
    rVal = point.getR();

    unsigned long now = millis();
    
    if(now - lastJoystickPrintTime > JOYSTICK_REPORTING_MS) {
      printJoystickData(xVal, yVal, zVal, point.getAngle(), rVal);
      lastJoystickPrintTime = now;
    }
}

void loop() {
  for (uint8_t i = 0; i < nbButtons; i++) {
    if (buttons[i].update()) {
      if (buttons[i].pressed()) {
          keyPressed(buttonPin[i]);
      }
    }
 }
 
 handleJoystick();
}
