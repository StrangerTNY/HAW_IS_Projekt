extends Area2D

var changeColor : bool = false
var rng = RandomNumberGenerator.new()
var randomNumber = 0
var gbValue = 1.0
var destinedNumber = 0

var counter = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate = Color(1,1,1,1)
	#randomNumber = rng.randi_range(1,4)
	#print(name)
	#print(randomNumber)
	changeColor = true
	
	if name == "Wall_Left":
		destinedNumber = 1
		print("Wall1")
	elif name == "Wall_Up":
		destinedNumber = 2
		print("Wall2")
	elif name == "Wall_Right":
		destinedNumber = 3
		print("Wall3")
	elif name == "Wall_Down":
		destinedNumber = 4
		print("Wall4")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	modulate = Color(1,gbValue,gbValue, 1)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.moveBack()
		gbValue = 1
		modulate = Color(1, 1, 1, 1)
#		changeColor = false	

func changingColor():
	gbValue = 0.3
#	changeColor = false

#func _on_conductor_beat(position) -> void:
#
#	if destinedNumber == counter:
#		changeColor = true
#		randomNumber = rng.randi_range(1,4)
#		print("IT CHANGED!!")
#	if counter >= 4:
#		counter = 1
#	else:
#		counter += 1
#	print(counter)
