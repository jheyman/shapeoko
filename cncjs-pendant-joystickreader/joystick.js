const SMOOTH_JOG_COMMAND_INTERVAL = 10; // period in ms at which the $J jogging commands are sent to the machine
// const SMOOTH_JOG_COMMAND_INTERVAL = 100; // period in ms at which the $J jogging commands are sent to the machine
const MIN_SPEED = 1000;
const MAX_SPEED = 10000;
const ROTATION_THRESHOLD = 0.1

const Directions = {
    Center: "CENTER",
    North: "NORTH",
    NorthEast: "NORTHEAST",
    NorthWest: "NORTHWEST",
    South: "SOUTH",
    SouthEast: "SOUTHEAST",
    SouthWest: "SOUTHWEST",
    East: "EAST",
    West: "WEST",
}

class Controller {
    constructor(machine) {
        this.machine = machine;
        this.state = {
            direction: null,
            jog: null,
            rotation: 0,
            throwPercent: 0,
        };
    }

    printState() {
        console.log("JOYSTICK CONTROLLER STATE", this.state);
    }

    updateState({ direction, rotation, throwPercent }) {
        this.state.direction = direction;
        this.state.rotation = rotation;
        this.state.throwPercent = throwPercent;

        if(Math.abs(this.state.rotation) >= ROTATION_THRESHOLD) {
            this.startSmoothJogging("Z");

            return;
        } else if(this.isSmoothJoggingZ) {
            this.stopSmoothJogging();
        }

        switch(this.state.direction) {
            case Directions.Center:
                this.stopSmoothJogging();
                break;

            case Directions.North:
                this.startSmoothJogging("Y")
                break;

            case Directions.South:
                this.startSmoothJogging("Y-")
                break;

            case Directions.East:
                this.startSmoothJogging("X")
                break;

            case Directions.West:
                this.startSmoothJogging("X-")
                break;

            case Directions.NorthEast:
                this.startSmoothJogging("X", "Y")
                break;

            case Directions.NorthWest:
                this.startSmoothJogging("X-", "Y")
                break;

            case Directions.SouthEast:
                this.startSmoothJogging("X", "Y-")
                break;

            case Directions.SouthWest:
                this.startSmoothJogging("X-", "Y-")
                break;
        }
    }

    get canStartJogging() {
        return !this.machine.waitingOnOK
    }

    get isSmoothJogging() {
        return Boolean(this.state.jog);
    }

    get isSmoothJoggingZ() {
        return this.isSmoothJogging && this.state.jog.axis.includes("Z");
    }

    startSmoothJogging(...selectedAxis) {
        if(this.state.jog) {
            this.state.jog.axis = selectedAxis;

            return;
        }

        if(!this.canStartJogging) {
            console.log("CAN'T START JOGGING, WAITING ON OK");
            return;
        }

        console.log("START SMOOTH JOGGING", selectedAxis);

        this.state.jog = {
            axis: selectedAxis,
        };

        this.state.jog.interval = setInterval(() => {
            if(!this.state.jog) {
                console.log('JOGGING WAS CANCELLED');
                return;
            }

            if(this.machine.waitingOnOK) {
                console.log('skipping jog, waiting on OK');
                return;
            }

            let jogCommand = "";

            if(this.isSmoothJoggingZ) {
                jogCommand = GetJogCommandZ(this.state.rotation);
            } else {
                jogCommand = GetJogCommandXY(this.state.jog.axis, this.state.throwPercent);
            }

            this.machine.writeToCNC(jogCommand);
            this.machine.waitOnOK();
        }, SMOOTH_JOG_COMMAND_INTERVAL);
    }

    stopSmoothJogging() {
        if(!this.isSmoothJogging) {
            return;
        }

        if(this.state.jog && this.state.jog.interval) {
            clearInterval(this.state.jog.interval);
        }

        this.state.jog = null;

        let writeToMachine = () => {
            console.log("STOPPED SMOOTH JOGGING");
            // this.machine.writeToCNC(GetJogCancelCommand());
            this.machine.jogCancel();
        };

        if(!this.machine.waitingOnOK) {
            writeToMachine(); // immediately
        } else {
            console.log("WAITING ON OK BEFORE STOPPING SMOOTH JOGGING");

            let interval = null;

            interval = setInterval(() => {
                if(this.machine.waitingOnOK) {
                    return;
                }

                clearInterval(interval)

                writeToMachine();
            }, 10);
        }
    }
}

const GetJogCancelCommand = () => {
    return "\x85";
}

const GetJogCommandXY = (axis, joystickThrow) => {
    // GOD THIS IS A MESSSSSSSSSS
    // i need to clean this up, this was hacked together at the cnc

    let movement = GetMovementXY(joystickThrow);
    let currentSpeed = movement.speed;
    let step = movement.step;

    currentSpeed = MAX_SPEED * joystickThrow;

    let v = currentSpeed / 60;
    const accel = 300; // mm/sec^2
    let dt = (MAX_SPEED/60) / (2 * accel * 14);

    step = v * dt;

    var axisString = axis.map(a => a + step).join(" ");

    return `$J=G91 G21 ${axisString} F${currentSpeed}\n`;
};

const GetMovementXY = (joystickThrow) => {
    const windows = [
        {t: 0.2, speed: 1000, step: 0.5},
        {t: 0.3, speed: 2000, step: 0.75},
        {t: 0.4, speed: 2500, step: 1},
        {t: 0.5, speed: 3500, step: 1.5},
        {t: 0.6, speed: 4500, step: 1.5},
        {t: 0.7, speed: 5500, step: 2},
        {t: 0.8, speed: 6500, step: 2.5},
        {t: 0.9, speed: 7500, step: 3},
        {t: 1, speed: 8000, step: 3.5},
    ];

    for(const window of windows) {
        if(joystickThrow <= window.t) {
            return {
                speed: window.speed,
                step: window.step,
            }
        }
    }

    return {
        speed: 0,
        step: 0,
    }
};

const GetJogCommandZ = (rotation) => {
    var movement = GetMovementZ(Math.abs(rotation));
    let currentSpeed = movement.speed;
    let step = movement.step;

    if(rotation < 0) {
        step = -step;
    }

    return `$J=G91 G21 Z${step} F${currentSpeed}\n`;
};

const GetMovementZ = (joystickRotation) => {
    const windows = [
        {t: 0.2, speed: 300, step: 0.2},
        {t: 0.5, speed: 500, step: 0.2},
        {t: 0.7, speed: 700, step: 0.2},
        {t: 1, speed: 1000, step: 0.5},
    ];

    for(const window of windows) {
        if(joystickRotation <= window.t) {
            return {
                speed: window.speed,
                step: window.step,
            }
        }
    }

    return {
        speed: 0,
        step: 0,
    }
};

module.exports = {
    Controller,
    Directions,
};
