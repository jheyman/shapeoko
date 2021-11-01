class Machine {
    constructor(socket, port) {
        this.port = port;
        this.socket = socket;
        this.state = {
            waitingOnOK: false,
        };

        this.socket.on('serialport:read', (data) => {
            data = data.trim();

            if(data === 'ok' && this.state.waitingOnOK) {
                this.state.waitingOnOK = false;
            }
        });
    }

    get waitingOnOK() {
        return Boolean(this.state.waitingOnOK);
    }

    receivedOK() {
        this.state.waitingOnOK = false;
    }

    waitOnOK() {
        this.state.waitingOnOK = true;
    }

    jogCancel() {
        console.log('COMMAND', 'jogCancel');

        this.socket.emit('jogCancel');
    }

    writeToCNC(gcode) {
        let dataToDisplay = gcode.trim()

        dataToDisplay = dataToDisplay.replace(/[^\x20-\x7E]/g, (m) => {
            return '\\x' + m.charCodeAt(0).toString(16);
        });

        console.log('GCODE', dataToDisplay);

        this.socket.emit('write', this.port, gcode);
    }
}

module.exports = Machine;
