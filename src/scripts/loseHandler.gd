extends Node

signal loseALife



func _on_wall_up_local_lose_life() -> void:
	emit_signal("loseALife")


func _on_wall_down_local_lose_life() -> void:
	emit_signal("loseALife")


func _on_wall_right_local_lose_life() -> void:
	emit_signal("loseALife")


func _on_wall_left_local_lose_life() -> void:
	emit_signal("loseALife")
