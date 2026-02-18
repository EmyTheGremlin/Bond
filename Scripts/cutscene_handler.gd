extends Node2D

var CurrentCutscene = "None"
var Event = 0

func CutsceneHandler(): # This is going to be a BIG ass function
	match CurrentCutscene:
		"Intro":
			match Event:
				0:
					pass

func _physics_process(_delta):
	CutsceneHandler()

func end():
	Event = 0
	CurrentCutscene = "None"

func start(Title): # Called from Global
	Event = 0
	match Title:
		"Intro":
			pass
