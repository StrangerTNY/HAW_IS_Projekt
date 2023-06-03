extends Node2D

var counter = 0
var hold = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_conductor_measure(position) -> void:
	
	pass
	


func _on_conductor_beat(position) -> void:
	
	if !hold:
		if counter == 1:
			get_node("wall_up").changingColor()
		elif counter == 2:
			get_node("wall_right").changingColor()
		elif counter == 3:
			get_node("wall_down").changingColor()
		elif counter == 4:
			get_node("wall_left").changingColor()
			counter = 0
		counter += 1
	hold = !hold
