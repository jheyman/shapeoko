# cncjs-pendant-keyboardreader
A CNCjs pendant for remote jogging using a keyboard. Implements GRBL's "smooth jogging" ($J commands).

## Pre-requisite

`Node.JS` and `npm` must have been installed.
This version of the pendant was tested using Node.JS [v7.10.1](https://nodejs.org/en/blog/release/v7.10.1/)

## Installation

After cloning the repository to your work directory, change into this directory and run
```
npm install
```

## Usage

CNCjs must be running (either the standalone app, or as a server)

From a shell/command window, go to `cncjs-pendant-keyboardreader` directory, and run: 

`node bin/cncjs-pendant-keyboardreader --socket-port XXXXX --port ZZZ`

To determine XXXXX value: 

* On Windows, if using the CNCjs standalone app, go to the "View" menu, click "View in browser", this should open a browser window to a URL that will look something like "http://127.0.0.1:57325/#/workspace". The number right after the "127.0.0.1:" part is the XXXXX to be passed along.

* On Linux, if using the CNCjs server, the XXXXX value is normally 8000, unless specified otherwise.

To determine ZZZ value: 

This is the name of the serial port that CNCjs uses to connect to the machine (see "Port" field in the "Connection" widget in CNCjs)

* On Windows, ZZZ will often be something like "COM5"

* On Linux, ZZZ will often be something like "/dev/ttyACM0"

Pass --help to `cncjs-pendant-keyboard` for more options.

If execution is successful, you should see something like this:

>Connected to ws://{loooong string of characters here}

>Connected to port ZZZ (Baud rate: 115200)

At this point, the pendant will react to the following keys:

![Hotkeys](https://github.com/jheyman/shapeoko/blob/master/cncjs-pendant-keyboardreader/docs/keysinfo.png)

* pressing the left,right,up,down,pageUp,pageDown keys will jog the machine by the FINE step size, along X/Y/Z
* holding the **Alt** key while pressing these jog keys will jog by the MEDIUM step size
* holding the **Ctrl** key while pressing these jog keys will jog by the LARGE step size

The distances for FINE, MEDIUM and LARGE can be modified in the source code, they are 0.1mm, 1mm, and 10mm by default.

* /!\ holding the **Shift** key while pressing a jog key will trig a **CONTINUOUS** smooth jog along the selected axis (no need to hold the key). Pressing the jog key again WHILE still holding the Shift key will **STOP** the movement.


