extends Control

var lifeLeft = 3


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_walls_lose_a_life() -> void:
	
	if lifeLeft == 3:
		$HBoxContainer/Life1.modulate = Color(1,1,1,0)
	elif lifeLeft == 2:
		$HBoxContainer/Life2.modulate = Color(1,1,1,0)
		pass
	if lifeLeft == 1:
		$HBoxContainer/Life3.modulate = Color(1,1,1,0)
		get_tree().change_scene_to_file("res://src/scenes/gameOver.tscn")
		pass
	lifeLeft -= 1
