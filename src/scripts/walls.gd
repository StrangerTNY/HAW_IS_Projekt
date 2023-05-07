extends Area2D

var changeColor : bool = false
var rng = RandomNumberGenerator.new()
var randomNumber = 0
var gbValue = 1.0
var destinedNumber = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	modulate = Color(1,1,1,1)
	#randomNumber = rng.randi_range(1,4)
	#print(name)
	#print(randomNumber)
	changeColor = true
	
	if name == "Wall_Left":
		destinedNumber = 1
	elif name == "Wall_Up":
		destinedNumber = 2
	elif name == "Wall_Right":
		destinedNumber = 3
	elif name == "Wall_Down":
		destinedNumber = 4

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	modulate = Color(1,gbValue,gbValue, 1)
	
	if changeColor:
		if randomNumber == destinedNumber:
			gbValue = 0.3
			#print("changed")
			changeColor = false
#			while gbValue > 0:
#				gbValue -= 0.001 * delta

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.moveAndBack()
		gbValue = 1
		modulate = Color(1, 1, 1, 1)
		changeColor = false	

func _on_timer_timeout() -> void:
	#print("Timer Tick")
	changeColor = true
	randomNumber = rng.randi_range(1,4)
	#print(randomNumber)
