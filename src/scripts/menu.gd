extends Control


# Skript für das Startmenü

# Damit ist automatisch der Button ausgewählt
# und kann mit Tastatur bestätigt werden
func _ready():
	$VBoxContainer/StartButton.grab_focus()

# Erstes Level wird geladen
func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://src/scenes/test_level.tscn")

# Steuerungsmenü wird geladen
func _on_control_button_pressed():
	get_tree().change_scene_to_file("res://src/scenes/controls.tscn")

# Spiel wird beendet
func _on_quit_button_pressed():
	get_tree().quit()
