extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/NormalButton.grab_focus()

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_up") or Input.is_action_just_pressed("ui_down") or Input.is_action_just_pressed("ui_accept"):
		$NavigationSound.play()

func _on_normal_button_pressed():
	Global.globalBPM = 68
	get_tree().change_scene_to_file("res://src/scenes/level_1.tscn")


func _on_hard_button_pressed():
	Global.globalBPM = 68*2
	get_tree().change_scene_to_file("res://src/scenes/level_1.tscn")


func _on_go_back_button_pressed():
	get_tree().change_scene_to_file("res://src/scenes/main.tscn")
