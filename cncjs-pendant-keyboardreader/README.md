# cncjs-pendant-keyboardreader
A CNCjs pendant for remote jogging using a keyboard

## Installation
After cloning the repository to your work directory, change into this directory and run
```
npm install
```

## Usage

Run `bin/cncjs-pendant-keyboardreader --socket-port XXXXX --port ZZZ` to start.

XXXX value: 

On Windows, if using the CNCjs standalone app, the value of XXXXX should be retrieved by going to "View" menu, click "View in brower", this should open a browser window to a URL that will look something like "http://127.0.0.1:57325/#/workspace". The number right after the "127.0.0.1:" part is the XXXXX to be passed along.

On Linux, if using the CNCjs server, the XXXXX value is normally 8000, unless specified otherwise.

ZZZ value: this is the name of the serial port that CNCjs uses to connect to the machine (see "Port" field in the "Connection" widget in CNCjs)

On Windows, ZZZ will often be something like "COM5"
On Linux, ZZZ will often be something like "/dev/ttyACM0"

Pass --help to `cncjs-pendant-keyboard` for more options.

Hotkeys:

![Hotkeys](https://github.com/jheyman/shapeoko/blob/master/cncjs-pendant-keyboardreader/docs/keysinfo.png)
