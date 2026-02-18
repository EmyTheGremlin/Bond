extends Node

var Main = null
var Dialogue = null
var CutsceneHandler = null

func play_dialogue(Dia : Array, Ports : Array): # Plays dialogue based on an array given.
	if Dialogue != null:
		
		var Dict = {
		"Lines" : Dia,
		"Portraits" : Ports,
		}
		
		Dialogue.CurrentLines = Dict
		Dialogue.start_speaking()

func start_cutscene(Title : String): # Calls a cutscene based on a name
	if CutsceneHandler != null:
		CutsceneHandler.start(Title)
