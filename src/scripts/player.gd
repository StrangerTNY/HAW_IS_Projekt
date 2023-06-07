extends CharacterBody2D

# Spieler Skript

# Um zu tracken wann der Spieler größer oder kleiner wird
var scaled : bool = false

# Tweens (Animation / Bewegung)
var tweenBounce
var tweenMove

# Auslesen von Input
func _process(_delta):
	if Input.is_action_just_pressed("ui_right"):
		moveTween("right")
	elif Input.is_action_just_pressed("ui_left"):
		moveTween("left")
	elif Input.is_action_just_pressed("ui_up"):
		moveTween("up")
	elif Input.is_action_just_pressed("ui_down"):
		moveTween("down")
		
	# mit Escape zurück zum Hauptmenü
	elif Input.is_action_just_pressed("ui_cancel"):
		Global.score = 0
		get_tree().change_scene_to_file("res://src/scenes/main.tscn")

# Tween zurück zur Mitte
# erst wenn Wand getroffen wird bewegt sich Spieler zurück
# wird in single_wall Skript ausgelöst
func moveBack():
	tweenMove.stop()
	# evtl überflüssig
	velocity = Vector2.ZERO
	tweenMove = create_tween()
	tweenMove.tween_property(self,"position", Vector2(500,500),0.06)
	
# Tween wird erstellt und in eingegebene Richtung wird ausgeführt
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


# Spieler wird on Beat skaliert
# ausgelöst aus Conductor Skript
func _on_conductor_measure(position) -> void:
	if !scaled:
		tweenBounce = create_tween()
		tweenBounce.tween_property(self, "scale", Vector2(0.38,0.38), 0.02)
	else:
		tweenBounce = create_tween()
		tweenBounce.tween_property(self, "scale", Vector2(0.3,0.3), 0.75/4)
	scaled = !scaled
