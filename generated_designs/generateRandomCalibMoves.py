from random import *
filename = "random.nc"
logfile = "log.txt"
feedRate = 2000 #mm/min
pause_time = 1 #/seconds
X_MIN = 50
X_MAX = 200
Y_MIN = 50
Y_MAX = 150
X_DIM = 250.0 #width of calib area in mm
Y_DIM = 200.0 #height of calib area in mm
X_STEPS = 5 #nb of positions, horizontally
Y_STEPS = 5 #nb of positions, vertically

with open(filename, "w") as output, open(logfile, "w") as log:

	# Use XY as the working plane
	output.write("G17\n")
	# Use mm as the units
	output.write("G21\n")
	# use absolute positions mode
	output.write("G90\n")
	# speed in units per minute
	output.write("G94\n")
	# WCS for 1st workpiece
	output.write("G54\n")

	xPos = 0
	yPos = 0
	xOffset = X_DIM / X_STEPS
	yOffset = Y_DIM / Y_STEPS
			
	for k in range(0,500):
	
		# pick random X/Y position to calibrate
		xPos = randint(X_MIN, X_MAX)
		yPos = randint(Y_MIN, Y_MAX)
			
		# move there
		output.write("G1X%fF%f\n" % (xPos, feedRate))
		output.write("G1Y%fF%f\n" % (yPos, feedRate))

		# DEBUG: trig at start position to reset DRO
		# Activate PWM during 50ms to trig measurement then turn it back off
		# and wait a bit to let the arduino grab the data ad reset the DRO 
		output.write("M3S10000\n")
		output.write("G4P0.05\n")
		output.write("M5\n")
		output.write("G4P%f\n" % pause_time)
		
		
		move = randint(10, 50)
		direction = randint(0,3)
		
		log.write("%f,%f,%d,%d\n" % (xPos, yPos, move, direction))
		
		# positive X
		if (direction == 0):
			xPos = xPos + move
			output.write("G1X%fF%f\n" % (xPos, feedRate))
		# negative X
		elif(direction ==1):
			xPos = xPos - move
			output.write("G1X%fF%f\n" % (xPos, feedRate))
		# positive Y
		elif(direction==2):
			yPos = yPos + move
			output.write("G1Y%fF%f\n" % (yPos, feedRate))
		# negative Y
		else:
			yPos = yPos - move
			output.write("G1Y%fF%f\n" % (yPos, feedRate))	
	
		# Activate PWM during 50ms to trig measurement then turn it back off
		# and wait a bit to let the arduino grab the data ad reset the DRO 
		output.write("M3S10000\n")
		output.write("G4P0.05\n")
		output.write("M5\n")
		output.write("G4P%f\n" % pause_time)		
				
	# End of program
	output.write("M30\n")

	output.close()

