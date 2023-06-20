extends Control



# Damit ist automatisch der Button ausgewählt
# und kann mit Tastatur bestätigt werden
func _ready():
	$VBoxContainer/GoBackButton.grab_focus()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_go_back_button_pressed() -> void:
	Global.score = 0;
	get_tree().change_scene_to_file("res://src/scenes/main.tscn")
