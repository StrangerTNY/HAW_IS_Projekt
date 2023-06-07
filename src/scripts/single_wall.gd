extends Area2D

var changeColor : bool = false
var rng = RandomNumberGenerator.new()
var randomNumber = 0
var gbValue = 1.0
var destinedNumber = 0
var hitMe = false

var tweenColorChange

var counter = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	tweenColorChange = get_tree().create_tween()
	
	modulate = Color(1,1,1,1)
	#randomNumber = rng.randi_range(1,4)
	#print(name)
	#print(randomNumber)
	changeColor = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	
	#modulate = Color(1,gbValue,gbValue, 1)
	pass
	


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.moveBack()
		# gbValue = 1
		
		if hitMe:
			tweenColorChange.stop()
			get_node("/root/Gobal").pointScore()
			tweenColorChange = create_tween()
			tweenColorChange.tween_property($Sprite,"modulate",Color(1, 1, 1, 1),0.02)
			hitMe = false
		else:
			Gobal.score -= 1
		# modulate = Color(1, 1, 1, 1)
#		changeColor = false	

func changingColor():
	hitMe = true
	tweenColorChange = create_tween()
	tweenColorChange.tween_property($Sprite,"modulate",Color(1, 0.3, 0.3, 1),0.5454)
	# gbValue = 0.3
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
