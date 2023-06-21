extends Area2D

# Skript für einzelne Wand (aus one_Wall Szene)
# Verfärbung sind noch komisch und funktionieren ungünstig

# Boolean ob Wand getroffen werden soll
var hitMeSoon : bool = false
var hitMeNow : bool = false

# Tween Animation
var tweenColorChange

signal localLoseLife

# Tween erstellt und Farbe mit modulate eingestellt
func _ready() -> void:
	
	tweenColorChange = get_tree().create_tween()

	modulate = Color(1, 1, 1, 1)

# Wenn Spieler einzelne Wand trifft wird Spieler "zurückgeschickt" (moveBack)
# Wenn hitMe wird Verfärbung zurückgesetzt und Punkt plus, wenn nicht Punkt Abzug
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.moveBack()
		
		if hitMeNow or hitMeSoon:
			tweenColorChange.stop()
			if hitMeNow:
				Global.addScore() 
			tweenColorChange = create_tween()
			tweenColorChange.tween_property($Sprite,"modulate",Color(1, 1, 1, 1),0.02)
			hitMeNow = false
			hitMeSoon = false
		else:
			$"../Fail_Sound".play()
			emit_signal("localLoseLife")
			Global.subtractScore()
			tweenColorChange.stop()
			tweenColorChange = create_tween()
			tweenColorChange.tween_property($Sprite,"modulate",Color(0.8, 0.2, 0.2, 1),0.02)
			tweenColorChange = create_tween()
			tweenColorChange.tween_property($Sprite,"modulate",Color(1, 1, 1, 1),0.5454)

# Verfärbung in Farbe die getroffen werden soll
func changingColor():
	# wenn ich hier noch ein Argument nachfrage kann ich gucken
	# ob sich die Wall gelb oder grün färben muss
	if hitMeSoon:
		hitMeNow = true
		tweenColorChange = create_tween()
		tweenColorChange.tween_property($Sprite,"modulate",Color(0.3, 0.6, 0.3, 1),0) # Timing war: 0.5454 neu: .44117
	else:
		hitMeSoon = true
		tweenColorChange = create_tween()
		tweenColorChange.tween_property($Sprite,"modulate",Color(0.8,0.8,0.5),0)
