extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/StartButton.grab_focus()


func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://src/scenes/test_level.tscn")


func _on_control_button_pressed():
	get_tree().change_scene_to_file("res://src/scenes/controls.tscn")


func _on_quit_button_pressed():
	get_tree().quit()
