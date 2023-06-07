extends Node

# Globales Skript, welches von überall erreichbar ist
# Um den Score zu manipulieren
# Eingestellt durch Projekteinstellungen -> Automatisches Laden
# Brauch manchmal eine extra Einladung...

var score = 0

func addScore():
	Global.score += 1

func subtractScore():
	Global.score -= 1

# Hier könnten weitere Scores sowie Combo Funktionen geben
