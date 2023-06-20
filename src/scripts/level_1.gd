extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_conductor_finished() -> void:
	await get_tree().create_timer(2).timeout
	get_tree().change_scene_to_file("res://src/scenes/level_End.tscn")
