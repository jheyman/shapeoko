import json
import uuid
import random
import math

def getUUID():
	return "{"+str(uuid.uuid4())+"}"

data = {
    "CIRCLE_OBJECTS": [
    ],
    "CURVE_OBJECTS": [
    ],
    "DOCUMENT_VALUES": {
        "BACKGROUND_IMAGE": "AAAAAA==",
        "BACKGROUND_OPACITY": 0.5,
        "BACKGROUND_POSITION_X": 0,
        "BACKGROUND_POSITION_Y": 0,
        "BACKGROUND_ROTATION": 0,
        "BACKGROUND_SCALE": 1,
        "BACKGROUND_VISIBLE": False,
        "DISPLAYMM": True,
        "HEIGHT": 300,
        "MACHINE": "Shapeoko 3",
        "MATERIAL": "MDF",
        "RETRACT": 10,
        "THICKNESS": 19,
        "WIDTH": 300,
        "ZERO_X": 0,
        "ZERO_Y": 0,
        "ZERO_Z": 0,
        "grid_enabled": True,
        "grid_spacing": 5,
        "version": 1
    },
    "RECT_OBJECTS": [],
    "REGULAR_POLYGON_OBJECTS": [],
    "TEXT_OBJECTS": [],
    "TOOLPATH_OBJECTS": []
}

cols=16
rows=16
cell_height_in_mm = 9.52
cell_width_in_mm = 9.52
inter_cell_space = 3.2
pocket_margin = 1.5

thickness = 30
base = 5
bottom_depth = -(thickness - base)

data["DOCUMENT_VALUES"]["THICKNESS"] = thickness
data["DOCUMENT_VALUES"]["WIDTH"] = inter_cell_space+cols*(inter_cell_space+cell_width_in_mm)
data["DOCUMENT_VALUES"]["HEIGHT"] = inter_cell_space+rows*(inter_cell_space+cell_height_in_mm)

for x in range(0, cols+1):

	print "Generating vertical slot " + str(x)

	randomgeneratedUUID = getUUID()
	newObj =  {
        "corner_type": 0,
        "group_id": [],
        "height": 5,
        "id": "",
        "position": [],
        "radius": 15,
        "rotation": 0,
        "width": 5
    }
	
	spacer_height = inter_cell_space + rows *(cell_height_in_mm+inter_cell_space)
	spacer_width = inter_cell_space
	newObj["height"] = spacer_height
	newObj["width"] = inter_cell_space
	newObj["id"] = randomgeneratedUUID
	newObj["position"] = [0.5*spacer_width + x*(spacer_width+cell_width_in_mm),0.5*spacer_height]

	if x == 0 :
		newObj["width"] = inter_cell_space+2
		newObj["height"] = spacer_height+2
		newObj["position"] = [0.5*spacer_width + x*(spacer_width+cell_width_in_mm)-1,0.5*spacer_height-1]
	if x == cols :
		newObj["width"] = inter_cell_space+2
		newObj["height"] = spacer_height+2
		newObj["position"] = [0.5*spacer_width + x*(spacer_width+cell_width_in_mm)+1,0.5*spacer_height+1]

	data["RECT_OBJECTS"].append(newObj)
	

	newToolpath = {
        "automatic_parameters": True,
        "elements": [
            {
                "tab_index": [],
                "tab_u": [],
                "uuid": ""
            }
        ],
        "enabled": True,
        "end_depth": 0,
        "name": "",
        "ofset_dir": 2, #0 = no offset, 2 = inside
        "speeds": {
            "feedrate": 586.74,
            "plungerate": 146.685,
            "rpm": 9375
        },
        "start_depth": 0,
        "stepdown": 0.883,
        "stepover": 1.429,
        "tab_height": 5,
        "tab_width": 8,
        "tolerance": 0.01,
        "tool": {
            "angle": 0,
            "corner_radius": 0,
            "diameter": 3.175,
            "display_mm": False,
            "flutes": 2,
            "length": 19.049999999999997,
            "name": "",
            "number": 102,
            "overall_length": 0,
            "uuid": "{00000000-0000-0000-0000-000000000102}"
        },
        "uuid": ""
    }

	newToolpath["uuid"] = getUUID()
	newToolpath["elements"][0]["uuid"] = randomgeneratedUUID
	newToolpath["name"] = "vert_slot "+ str(x)
	newToolpath["end_depth"] = bottom_depth
	data["TOOLPATH_OBJECTS"].append(newToolpath)


for y in range(0, rows+1):

	print "Generating horizontal slot " + str(y)

	randomgeneratedUUID = getUUID()
	newObj =  {
        "corner_type": 0,
        "group_id": [],
        "height": 5,
        "id": "",
        "position": [],
        "radius": 15,
        "rotation": 0,
        "width": 5
    }
	
	spacer_width = inter_cell_space + cols *(cell_width_in_mm+inter_cell_space)
	spacer_height = inter_cell_space
	newObj["height"] = spacer_height
	newObj["width"] = spacer_width
	newObj["id"] = randomgeneratedUUID
	newObj["position"] = [0.5*spacer_width, 0.5*spacer_height+ y*(spacer_height+cell_height_in_mm)]
	
	if y == 0:
		newObj["height"] = spacer_height+2
		newObj["width"] = spacer_width+2
		newObj["position"] = [0.5*spacer_width-1, 0.5*spacer_height+ y*(spacer_height+cell_height_in_mm)-1]
	if y == rows:
		newObj["height"] = spacer_height+2
		newObj["width"] = spacer_width+2
		newObj["position"] = [0.5*spacer_width+1, 0.5*spacer_height+ y*(spacer_height+cell_height_in_mm)+1]

	data["RECT_OBJECTS"].append(newObj)
	
	newToolpath = {
        "automatic_parameters": True,
        "elements": [
            {
                "tab_index": [],
                "tab_u": [],
                "uuid": ""
            }
        ],
        "enabled": True,
        "end_depth": 0,
        "name": "",
        "ofset_dir": 2, #0 = no offset, 2 = inside
        "speeds": {
            "feedrate": 586.74,
            "plungerate": 146.685,
            "rpm": 9375
        },
        "start_depth": 0,
        "stepdown": 0.883,
        "stepover": 1.429,
        "tab_height": 5,
        "tab_width": 8,
        "tolerance": 0.01,
        "tool": {
            "angle": 0,
            "corner_radius": 0,
            "diameter": 3.175,
            "display_mm": False,
            "flutes": 2,
            "length": 19.049999999999997,
            "name": "",
            "number": 102,
            "overall_length": 0,
            "uuid": "{00000000-0000-0000-0000-000000000102}"
        },
        "uuid": ""
    }


	newToolpath["uuid"] = getUUID()
	newToolpath["elements"][0]["uuid"] = randomgeneratedUUID
	newToolpath["name"] = "vert_slot "+ str(x)
	newToolpath["end_depth"] = bottom_depth
	data["TOOLPATH_OBJECTS"].append(newToolpath)


for x in range(0, cols):
	for y in range(0, rows):    

		print "Generating element " + str(x)  + "," + str(y)

		randomgeneratedUUID = getUUID()
		newObj =  {
            "corner_type": 0,
            "group_id": [],
            "height": 5,
            "id": "",
            "position": [],
            "radius": 15,
            "rotation": 0,
            "width": 5
        }
		
		newObj["height"] = cell_height_in_mm + pocket_margin
		newObj["width"] = cell_width_in_mm + pocket_margin
		newObj["id"] = randomgeneratedUUID
		newObj["position"] = [inter_cell_space+0.5*cell_width_in_mm+x*(cell_width_in_mm+inter_cell_space),inter_cell_space+0.5*cell_height_in_mm+y*(cell_height_in_mm+inter_cell_space)]
		data["RECT_OBJECTS"].append(newObj)
		
		print "Generating toolpath " + str(x)  + "," + str(y)
		
		newToolpath = {
            "automatic_parameters": True,
            "elements": [
                {
                    "tab_index": [],
                    "tab_u": [],
                    "uuid": ""
                }
            ],
            "enabled": True,
            "end_depth": -1.234,
            "name": "",
            "ofset_dir": 2, #0 = no offset, 2 = inside
            "speeds": {
                "feedrate": 586.74,
                "plungerate": 146.685,
                "rpm": 9375
            },
            "start_depth": 0,
            "stepdown": 0.883,
            "stepover": 1.429,
            "tab_height": 5,
            "tab_width": 8,
            "tolerance": 0.01,
            "tool": {
                "angle": 0,
                "corner_radius": 0,
                "diameter": 3.175,
                "display_mm": False,
                "flutes": 2,
                "length": 19.049999999999997,
                "name": "",
                "number": 102,
                "overall_length": 0,
                "uuid": "{00000000-0000-0000-0000-000000000102}"
            },
            "uuid": ""
        }


		newToolpath["uuid"] = getUUID()
		newToolpath["elements"][0]["uuid"] = randomgeneratedUUID
		newToolpath["name"] = "toolpath "+ str(x) + "," + str(y)
		newToolpath["end_depth"] = 0.5*bottom_depth+0.5*bottom_depth*math.sin(0.06*x*y+5.5)*math.sin(0.2*x+1)
	
		data["TOOLPATH_OBJECTS"].append(newToolpath)

# Write output c2d file
with open('generated.c2d', 'w') as outfile:
    json.dump(data, outfile)