import matplotlib.pyplot as plt
import numpy as np
from matplotlib.patches import Ellipse

NUM = 50
ERROR_SCALE_FACTOR = 0.2

fig, ax = plt.subplots(subplot_kw={'aspect': 'equal'})

ax.set_xlim(40, 210)
ax.set_ylim(40, 160)

with open("results.csv", "r") as data:
	for cnt, line in enumerate(data):
		elems = line.split(';')
		measured_delta_X = int(elems[0])
		measured_delta_Y = int(elems[1])
		origin_X = int(elems[2])
		origin_Y = int(elems[3])
		delta_commanded = int(elems[4])*100
		direction_commanded = int(elems[5])
		
		#print measured_delta_X, measured_delta_Y, origin_X, origin_Y, delta_commanded, direction_commanded
		
		if (direction_commanded == 0):
			print "Error at pos " + str(origin_X) + "," +str(origin_Y) + " is " + str(delta_commanded-abs(measured_delta_X))
			arrow= plt.arrow(origin_X, origin_Y, ERROR_SCALE_FACTOR*(delta_commanded-abs(measured_delta_X)), 0, color='blue', width=0.05)
			print "Error ARROW at pos " + str(origin_X) + "," +str(origin_Y) + " length " + str(ERROR_SCALE_FACTOR*(delta_commanded-abs(measured_delta_X)))

			arrow.set_alpha(0.2)
			arrow.set_clip_box(ax.bbox)			
			ax.add_artist(arrow)
		elif (direction_commanded == 1):
			print "Error at pos " + str(origin_X) + "," +str(origin_Y) + " is " + str(delta_commanded-abs(measured_delta_X))
			arrow= plt.arrow(origin_X, origin_Y, -ERROR_SCALE_FACTOR*(delta_commanded-abs(measured_delta_X)), 0, color='red', width=0.05)
			arrow.set_alpha(0.2)
			arrow.set_clip_box(ax.bbox)						
			ax.add_artist(arrow)			
		elif (direction_commanded == 2):
			print "Error at pos " + str(origin_X) + "," +str(origin_Y) + " is " + str(delta_commanded-abs(measured_delta_Y))
			arrow= plt.arrow(origin_X, origin_Y, 0, ERROR_SCALE_FACTOR*(delta_commanded-abs(measured_delta_Y)), color='green', width=0.05)
			arrow.set_alpha(0.2)
			arrow.set_clip_box(ax.bbox)						
			ax.add_artist(arrow)
		else:
			print "Error at pos " + str(origin_X) + "," +str(origin_Y) + " is " + str(delta_commanded-abs(measured_delta_Y))
			arrow= plt.arrow(origin_X, origin_Y, 0, -ERROR_SCALE_FACTOR*(delta_commanded-abs(measured_delta_Y)), color='yellow', width=0.05)
			arrow.set_alpha(0.2)
			arrow.set_clip_box(ax.bbox)			
			ax.add_artist(arrow)


		
		
		#print("Line {}: {}".format(cnt, line))
	



plt.show()
