extends Node2D

# Skript aus walls Szene um Level synchron zum Beat zu gestalten

# Momentan noch random
var randomList = [1,2,3,4]
var lastRandomList = [1,2,3,4]
var latestRandomList = [1,2,3,4]
var listToUse = [1,2,3,4]

# inkrementale Zähler
var lastWall = 0
var lateWall = 0

var justStarted = true

# Der mäßig funktionierende Versuch Timing anzupassen
# und schlußendlich Schwierigkeit anzupassen
# "hold" Boolean führt dazu, dass nur jeder 2te Beat Hit
# zu einem Wand Hit führt
var hold = false
var smallCounter = 1
var bigCounter = 0
var speedThreshold = 4

signal loseALife


# Liste wird gewürfelt
func _ready() -> void:
	print("READYING")
	randomize()
	randomList.shuffle()
	#lastRandomList = randomList
	lastRandomList = renewList(randomList, lastRandomList)
	#latestRandomList = randomList
	latestRandomList = renewList(randomList, latestRandomList)
	print(randomList)
	get_node("wall_up").changingColor(1)
	get_node("wall_up").changingColor(2)

# Bei jedem nicht ausgesetztem Beat (!hold) wird
# aus Liste ausgelesene passende Wand verfärbt
func _on_conductor_beat(position) -> void:
		
	print(smallCounter,", ", lastWall,", ", lateWall)
	print("ältere Liste: ",lastRandomList)	
		
	# funzt noch nicht ganz
	# manchmal werden 2 gleichzeitig verändert
	if !hold:
		colorChanger(1, smallCounter)
		#colorChanger(randomList[smallCounter-1])
		#print("Gelb: " , smallCounter)
		#if !justStarted:
		colorChanger(2, lastWall)
		#colorChanger(randomList[lastWall-1])
		#print("Grün: ", lastWall)
		backColorChanger(lateWall)
		#print("Y: ", smallCounter, ", G: ", lastWall, ", T: ", lateWall)
		
	
	if lateWall >= 4:
		print("neue zu späte Liste: ", lastRandomList)
		#latestRandomList = lastRandomList
		latestRandomList = renewList(lastRandomList, latestRandomList)
	if lastWall >= 4:
		print("neue grün werdende Liste: ", randomList)
		#lastRandomList = randomList
		lastRandomList = renewList(randomList, lastRandomList)
		#lastRandomList = [1,2,3,4]
	
	if smallCounter >= 4:
		randomize()
		randomList.shuffle()
		# Damit eine Wand nicht doppel hintereinander vorkommt
		while randomList[0] == lastRandomList[3]:
			randomize()
			randomList.shuffle()
		print("neueste Liste: ", randomList, " und letzte Liste: ",lastRandomList)
		
	lateWall = lastWall
	lastWall = smallCounter
	
	
#	lateWall = (lateWall % 4) + 1
#	lastWall = (lastWall % 4) + 1
	smallCounter = (smallCounter % 4) + 1

	#hold = true

	# Hilflose Versuche die Schnelligkeit over time anzupassen
	if smallCounter == speedThreshold:
		hold = false

#	bigCounter += 1
#
#	if bigCounter >= 32:
#		speedThreshold = 2
#
#	if bigCounter >= 32+16:
#		bigCounter = 0
#		speedThreshold = 4
	
func colorChanger(color, wallToChange):
	
	if color == 1:
		listToUse = randomList
		print("Liste 1: ", listToUse)
	elif color == 2:
		listToUse = lastRandomList
		print("Liste 2: ", listToUse)

	if wallToChange == listToUse[0]:
		get_node("wall_up").changingColor(color)
		print(color, " Oben")
	elif wallToChange == listToUse[1]:
		get_node("wall_right").changingColor(color)
		print(color, " Rechts")
	elif wallToChange == listToUse[2]:
		get_node("wall_down").changingColor(color)
		print(color, " Unten")
	elif wallToChange == listToUse[3]:
		get_node("wall_left").changingColor(color)
		print(color, " Links")
		
func backColorChanger(wallToChangeBack):

	if wallToChangeBack == latestRandomList[0]:
		get_node("wall_up").changeColorBack()
		print("Delete_Oben")
	elif wallToChangeBack == latestRandomList[1]:
		get_node("wall_right").changeColorBack()
		print("Delete_Rechts")
	elif wallToChangeBack == latestRandomList[2]:
		get_node("wall_down").changeColorBack()
		print("Delete_Unten")
	elif wallToChangeBack == latestRandomList[3]:
		get_node("wall_left").changeColorBack()
		print("Delete_Links")

func renewList(listFrom, listTo):
	var i = 0
	for number in listFrom:
		listTo[i] = number
		i += 1
	return listTo


func _on_lose_handler_lose_a_life() -> void:
	emit_signal("loseALife")
