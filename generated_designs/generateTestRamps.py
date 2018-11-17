
retractHeight = 10 #mm
RPM = 12500
filename = "generated.nc"
nbLines =  5
cutDepth = -0.5 #mm
plungeRate = 228 #mm/min
feedRate = 457 #mm

with open(filename, "w") as output:
    output.write("xxx: %s , yyy %f" % (x, y))
	
	output.write("%")
	# Use mm as the units
	output.write("G21")
	# use absolute positions mode
	output.write("G90")
	# initial spindle retract
	output.write("G0X0.000Y0.000Z%f" % retractHeight)
	# stop and let user install/change tool 
	output.write("M6 T1")
	# use absolute positions mode
	output.write("M3 S%d" % RPM)

	xtart = 0
	ystart = 0
	for i in range(0, nbLines):
		# fast move to start position
		output.write("G0X%fY%f" % xstart, y start)
		# double check we are at the retract height
		output.write("G0Z%f" % retractHeight)
		# plunge into material
		output.write("G1Z%fF%f" % (cutDepth, plungeRate))
		# mill first slot, at the desired feedrate
		output.write("G1X%fF%f" % (xend, feedRate))

G0Z10.000								sortie de l'outil à retract height
G0Z10.000								inutile ?
G0Y20.000								bouge en Y=20
G0 										?
G1Z-0.600F228.6							plunge
G1X20.000F457.2							mill jusqu'à la 'autre bout'
G0Z10.000								retract
M5										arreter le spindle
M30										fin de programme.
(END)