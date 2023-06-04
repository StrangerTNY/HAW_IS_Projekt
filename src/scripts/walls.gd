extends Node2D

var smallCounter = 0
var bigCounter = 0
var hold = false
var randomList = [1,2,3,4]
var speedThreshold = 4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	randomList.shuffle()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_conductor_measure(position) -> void:
	
	pass
	


func _on_conductor_beat(position) -> void:
	
	if !hold:
		if smallCounter == randomList[0]:
			get_node("wall_up").changingColor()
		elif smallCounter == randomList[1]:
			get_node("wall_right").changingColor()
		elif smallCounter == randomList[2]:
			get_node("wall_down").changingColor()
		elif smallCounter == randomList[3]:
			get_node("wall_left").changingColor()
	
	if smallCounter >= 4:
		randomize()
		randomList.shuffle()
	
	smallCounter = (smallCounter % 4) + 1
	
	hold = true
	
	if smallCounter == speedThreshold:
		hold = false
		
	bigCounter += 1

	if bigCounter >= 32:
		speedThreshold = 2
		
	if bigCounter >= 32+16:
		bigCounter = 0
		speedThreshold = 4
	
