extends Area2D

# Skript für einzelne Wand (aus one_Wall Szene)
# Verfärbung sind noch komisch und funktionieren ungünstig

# Boolean ob Wand getroffen werden soll
var hitMe = false

# Tween Animation
var tweenColorChange

# Tween erstellt und Farbe mit modulate eingestellt
func _ready() -> void:
	
	tweenColorChange = get_tree().create_tween()

	modulate = Color(1, 0.3, 0.3, 1)

# Wenn Spieler einzelne Wand trifft wird Spieler "zurückgeschickt" (moveBack)
# Wenn hitMe wird Verfärbung zurückgesetzt und Punkt plus, wenn nicht Punkt Abzug
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		body.moveBack()
		
		if hitMe:
			tweenColorChange.stop()
			Global.addScore()
			tweenColorChange = create_tween()
			tweenColorChange.tween_property($Sprite,"modulate",Color(1, 0.3, 0.3, 1),0.02)
			hitMe = false
		else:
			Global.subtractScore()

# Verfärbung in Farbe die getroffen werden soll
func changingColor():
	hitMe = true
	tweenColorChange = create_tween()
	tweenColorChange.tween_property($Sprite,"modulate",Color(0, 1, 1, 0.5),0.5454)
