extends Node2D

# Skript aus walls Szene um Level synchron zum Beat zu gestalten

# Momentan noch random
var randomList = [1,2,3,4]

var lastWall = 1

# Der mäßig funktionierende Versuch Timing anzupassen
# und schlußendlich Schwierigkeit anzupassen
# "hold" Boolean führt dazu, dass nur jeder 2te Beat Hit
# zu einem Wand Hit führt
var hold = false
var smallCounter = 0
var bigCounter = 0
var speedThreshold = 4

signal loseALife


# Liste wird gewürfelt
func _ready() -> void:
	randomize()
	randomList.shuffle()
	#get_node("wall_up").modulate = Color(1,0,0,1)	
	get_node("wall_up").changingColor()

# Bei jedem nicht ausgesetztem Beat (!hold) wird
# aus Liste ausgelesene passende Wand verfärbt
func _on_conductor_beat(position) -> void:
		
		
	# funzt noch nicht ganz
	# manchmal werden 2 gleichzeitig verändert
	if !hold:
		colorChanger(smallCounter)
		colorChanger(lastWall)
	
	lastWall = smallCounter
	
	if smallCounter >= 4:
		randomize()
		randomList.shuffle()
		while randomList[0] == lastWall:
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
	
func colorChanger(wallToChange):

	if wallToChange == randomList[0]:
		get_node("wall_up").changingColor()
		#print("Oben")
	elif wallToChange == randomList[1]:
		get_node("wall_right").changingColor()
		#print("Rechts")
	elif wallToChange == randomList[2]:
		get_node("wall_down").changingColor()
		#print("Unten")
	elif wallToChange == randomList[3]:
		get_node("wall_left").changingColor()
		#print("Links")

func _on_lose_handler_lose_a_life() -> void:
	emit_signal("loseALife")
