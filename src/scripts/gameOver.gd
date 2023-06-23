extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$VBoxContainer/TryAgainButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_accept"):
		$NavigationSound.play()


func _on_try_again_button_pressed() -> void:
	Global.score = 0
	get_tree().change_scene_to_file("res://src/scenes/level_1.tscn")


func _on_go_back_button_pressed() -> void:
	Global.score = 0
	get_tree().change_scene_to_file("res://src/scenes/main.tscn")
