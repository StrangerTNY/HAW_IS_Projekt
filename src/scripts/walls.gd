extends Node2D

# Skript aus walls Szene um Level synchron zum Beat zu gestalten

# Momentan noch random
var randomList = [1,2,3,4]

# Der mäßig funktionierende Versuch Timing anzupassen
# und schlußendlich Schwierigkeit anzupassen
# "hold" Boolean führt dazu, dass nur jeder 2te Beat Hit
# zu einem Wand Hit führt
var hold = false
var smallCounter = 0
var bigCounter = 0
var speedThreshold = 4

# Liste wird gewürfelt
func _ready() -> void:
	randomize()
	randomList.shuffle()

# Bei jedem nicht ausgesetztem Beat (!hold) wird
# aus Liste ausgelesene passende Wand verfärbt
func _on_conductor_beat(position) -> void:
	
	if !hold:
		if smallCounter == randomList[0]:
			get_node("wall_up").changingColor()
		elif smallCounter == randomList[1]:
			get_node("wall_right").changingColor()
		elif smallCounter == randomList[2]:
			get_node("wall_down").changingColor()
		elif smallCounter == randomList[3]:
			get_node("wall_left").changingColor()

	# Idee war, dass jede Wand einmal dran ist bevor die erste
	# nochmal dran ist. Funzt so aber nicht
	if smallCounter >= 4:
		randomize()
		randomList.shuffle()

	smallCounter = (smallCounter % 4) + 1

	hold = true

	# Hilflose Versuche die Schnelligkeit over time anzupassen
	if smallCounter == speedThreshold:
		hold = false

	bigCounter += 1

	if bigCounter >= 32:
		speedThreshold = 2

	if bigCounter >= 32+16:
		bigCounter = 0
		speedThreshold = 4
	
