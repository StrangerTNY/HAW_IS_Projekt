extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/TryAgainButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_try_again_button_pressed() -> void:
	get_tree().change_scene_to_file("res://src/scenes/level_1.tscn")


func _on_go_back_button_pressed() -> void:
	get_tree().change_scene_to_file("res://src/scenes/main.tscn")
