extends CharacterBody2D

@export var SPEED = 600.0
var moving : bool = false
# var direction = Vector2.ZERO

func _process(delta):
	
	if !moving:
		if Input.is_action_pressed("ui_right"):
			velocity.x += SPEED
			moving = true
		if Input.is_action_pressed("ui_left"):
			velocity.x -= SPEED
			moving = true
		if Input.is_action_pressed("ui_up"):
			velocity.y -= SPEED
			moving = true
		if Input.is_action_pressed("ui_down"):
			velocity.y += SPEED
			moving = true
			
	move_and_slide()
	
#	if (position.x >= 950 || position.x <= 50
#	|| position.y >= 950 || position.y <= 50):
#		velocity = Vector2.ZERO
#		position = Vector2(500,500)
#		moving = false
	
func moveAndBack():
	velocity = Vector2.ZERO
	moving = false
	position = Vector2(500,500)
	
	

#func _physics_process(delta):
#	velocity = Vector2.ZERO
#
#	if Input.is_action_pressed("ui_right"):
#		velocity.x += SPEED
#	elif Input.is_action_pressed("ui_left"):
#		velocity.x -= SPEED
#	elif Input.is_action_pressed("ui_up"):
#		velocity.y -= SPEED
#	elif Input.is_action_pressed("ui_down"):
#		velocity.y += SPEED
#
#	move_and_slide()
#
#	if velocity != Vector2.ZERO:
#		var direction = velocity.normalized()
#		var target_position = position + direction * 100
#		var distance = (target_position - position).length()
#		if distance <= SPEED * delta:
#			position = target_position
#			velocity = -direction * SPEED
