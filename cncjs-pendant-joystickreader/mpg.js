class Controller {
    constructor(machine) {
        this.machine = machine;
        this.state = {
            axis: null,
            clicks: 0,
            distance: 0,
        };
    }

    updateState({ axis, clicks, distance }) {
        this.state.axis = axis;
        this.state.clicks = clicks;
        this.state.distance = distance;

        this.machine.writeToCNC(this.moveGCODE);
    }

    printState() {
        console.log("MPG CONTROLLER STATE", this.state);
    }

    get moveGCODE() {
        let { axis, distance } = this.state;

        if(this.state.clicks > 0) {
            return `G91 ${axis}${distance}\n`;
        } else {
            return `G91 ${axis}-${distance}\n`;
        }
    }
}

module.exports = {
    Controller,
};
