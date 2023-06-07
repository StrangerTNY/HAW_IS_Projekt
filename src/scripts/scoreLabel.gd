extends Node

# Für die Score Anzeige im Level
# Liest aus Global Skript
func _process(delta: float) -> void:
	self.text = str(Global.score)



	
