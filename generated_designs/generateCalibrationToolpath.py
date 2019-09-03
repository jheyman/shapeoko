filename = "generated.nc"
feedRate = 2000 #mm/min
pause_time = 1 #/seconds
X_DIM = 250.0 #width of calib area in mm
Y_DIM = 200.0 #height of calib area in mm
X_STEPS = 5 #nb of positions, horizontally
Y_STEPS = 5 #nb of positions, vertically

with open(filename, "w") as output:

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

	for i in range(0, Y_STEPS):

		# compute horizontal moves
		for i in range(0, X_STEPS):

			xPos = xPos + xOffset

			# move to next point, at the desired feedrate
			output.write("G1X%fF%f\n" % (xPos, feedRate))

			# Activate PWM during 50ms to trig measurement then turn it back off
			# and wait a bit to let the arduino grab the data ad reset the DRO 
			output.write("M3S10000\n")
			output.write("G4P0.05\n")
			output.write("M5\n")
			output.write("G4P%f\n" % pause_time)
			
		yPos = yPos + yOffset	
		
		# move to next row, at the desired feedrate
		output.write("G1Y%fF%f\n" % (yPos, feedRate))

		# Activate PWM during 50ms to trig measurement then turn it back off
		# and wait a bit to let the arduino grab the data ad reset the DRO 
		output.write("M3S10000\n")
		output.write("G4P0.05\n")
		output.write("M5\n")
		output.write("G4P%f\n" % pause_time)

		# revert X direction for new row
		xOffset = -xOffset

	# Complete the last row 
	for i in range(0, X_STEPS):

		xPos = xPos + xOffset

		# move to next point, at the desired feedrate
		output.write("G1X%fF%f\n" % (xPos, feedRate))
	
		# Activate PWM during 50ms to trig measurement then turn it back off
		# and wait a bit to let the arduino grab the data ad reset the DRO 
		output.write("M3S10000\n")
		output.write("G4P0.05\n")
		output.write("M5\n")
		output.write("G4P%f\n" % pause_time)

		
	# Return to home position in reverse zigzag
	for i in range(0, Y_STEPS):

		# compute horizontal moves
		for i in range(0, X_STEPS):

			xPos = xPos - xOffset

			# move to next point, at the desired feedrate
			output.write("G1X%fF%f\n" % (xPos, feedRate))

			# Activate PWM during 50ms to trig measurement then turn it back off
			# and wait a bit to let the arduino grab the data ad reset the DRO 
			output.write("M3S10000\n")
			output.write("G4P0.05\n")
			output.write("M5\n")
			output.write("G4P%f\n" % pause_time)

		yPos = yPos - yOffset	
		
		# move to next row, at the desired feedrate
		output.write("G1Y%fF%f\n" % (yPos, feedRate))

		# Activate PWM during 50ms to trig measurement then turn it back off
		# and wait a bit to let the arduino grab the data ad reset the DRO 
		output.write("M3S10000\n")
		output.write("G4P0.05\n")
		output.write("M5\n")
		output.write("G4P%f\n" % pause_time)

		# revert X direction for new row
		xOffset = -xOffset		

	# Complete the last row 
	for i in range(0, X_STEPS):

		xPos = xPos - xOffset

		# move to next point, at the desired feedrate
		output.write("G1X%fF%f\n" % (xPos, feedRate))

		# Activate PWM during 50ms to trig measurement then turn it back off
		# and wait a bit to let the arduino grab the data ad reset the DRO 
		output.write("M3S10000\n")
		output.write("G4P0.05\n")
		output.write("M5\n")
		output.write("G4P%f\n" % pause_time)		
				
	# End of program
	output.write("M30\n")

	output.close()

