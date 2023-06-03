extends CharacterBody2D

@export var SPEED = 600.0
var moving : bool = false
# var direction = Vector2.ZERO
var scaled : bool = false

var tweenBounce
var tweenMove

func _ready() -> void:
	tweenBounce = get_tree().create_tween()
	tweenMove = get_tree().create_tween()


func _process(delta):

	if !moving:
		if Input.is_action_pressed("ui_right"):
			moveTween("right")
		elif Input.is_action_pressed("ui_left"):
			moveTween("left")
		elif Input.is_action_pressed("ui_up"):
			moveTween("up")
		elif Input.is_action_pressed("ui_down"):
			moveTween("down")
		elif Input.is_action_pressed("ui_cancel"):
			get_tree().change_scene_to_file("res://src/scenes/main.tscn")

func moveBack():
	tweenMove.stop()
	velocity = Vector2.ZERO
	tweenMove = create_tween()
	tweenMove.tween_property(self,"position", Vector2(500,500),0.06)
	moving = false
	
func moveTween(direction):
	tweenMove = create_tween()
	if direction == "right":
		tweenMove.tween_property(self,"position", Vector2(1000-120,self.position.y),0.1)
		tweenMove.tween_property(self,"position", Vector2(500,500),0.06)
	elif direction == "left":
		tweenMove.tween_property(self,"position", Vector2(120,self.position.y),0.1)
		tweenMove.tween_property(self,"position", Vector2(500,500),0.06)
	elif direction == "up":
		tweenMove.tween_property(self,"position", Vector2(self.position.x,120),0.1)
		tweenMove.tween_property(self,"position", Vector2(500,500),0.06)
	elif direction == "down":
		tweenMove.tween_property(self,"position", Vector2(self.position.x,1000-120),0.1)
		tweenMove.tween_property(self,"position", Vector2(500,500),0.06)
		
func _on_timer_timeout() -> void:	
#	if !scaled:
#		tweenBounce = create_tween()
#		tweenBounce.tween_property(self, "scale", Vector2(0.34,0.34), 0.02)
#	else:
#		tweenBounce = create_tween()
#		tweenBounce.tween_property(self, "scale", Vector2(0.3,0.3), 0.75/4)
#	scaled = !scaled
	pass



func _on_conductor_beat(position) -> void:
	pass


func _on_conductor_measure(position) -> void:
	if !scaled:
		tweenBounce = create_tween()
		tweenBounce.tween_property(self, "scale", Vector2(0.34,0.34), 0.02)
	else:
		tweenBounce = create_tween()
		tweenBounce.tween_property(self, "scale", Vector2(0.3,0.3), 0.75/4)
	scaled = !scaled
