extends Control

# Skript für Steuerung ("control") Szene

# Damit ist automatisch der Button ausgewählt
# und kann mit Tastatur bestätigt werden
func _ready() -> void:
	$VBoxContainer/BackButton.grab_focus()

# Weiterführung zum Hauptmenü
func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://src/scenes/main.tscn")
