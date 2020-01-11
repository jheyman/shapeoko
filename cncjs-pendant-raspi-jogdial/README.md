# cncjs-pendant-raspi-jogdial
Pendant control for CNCjs interfacing a jogdial. Initially based on cncjs-pendant-raspi-gpio repo.

## Usage
Run `node bin/cncjs-pendant-raspi-jogdial` to start. Pass --help for more options.

#### Auto Start

###### Install [Production Process Manager [PM2]](http://pm2.io)
```
# Install PM2
sudo npm install -g pm2

# Setup PM2 Startup Script
# sudo pm2 startup  # To Start PM2 as root
pm2 startup  # To start PM2 as pi / current user
  #[PM2] You have to run this command as root. Execute the following command:
  sudo env PATH=$PATH:/usr/bin /usr/lib/node_modules/pm2/bin/pm2 startup systemd -u pi --hp /home/pi

# Start CNCjs on port 8000 with PM2
## pm2 start ~/.cncjs/cncjs-pendant-raspi-gpio/bin/cncjs-pendant-raspi-gpio -- --port /dev/ttyUSB0
pm2 start $(which cncjs-pendant-raspi-gpio) -- --port /dev/ttyUSB0

# Set current running apps to startup
pm2 save

# Get list of PM2 processes
pm2 list
```


## Wiring 

![wiring](https://raw.githubusercontent.com/jheyman/shapeoko/master/cncjs-pendant-raspi-jogdial/docs/wiring.png)
