extends Node2D

@onready var Port = $Control/DialoguePortrait
@onready var Dialogue = $Control/DialogueLabel
@onready var Anim = $DialogueAnimator

@export var Duration_Between_Each_Letter = 1.0

const DefaultPortrait = preload("res://icon.svg")

var CurrentLines = {
	"Lines" : [],
	"Portraits" : [],
}
var CurrentLine = 0
var ShouldAppear = false
var Speaking = false
var PauseDuration = 0.0

func _ready():
	pass

func finish_speaking():
	Anim.play("Disappear")
	CurrentLine = 0
	CurrentLines = {
	"Lines" : ["YOU SHOULD NEVER SEE THIS"],
	"Portraits" : [DefaultPortrait],
	}
	ShouldAppear = false
	Speaking = false

func start_speaking():
	Anim.play("Appear")
	Dialogue.visible_characters = 0
	Dialogue.text = CurrentLines["Lines"][0]
	Port.texture = CurrentLines["Portraits"][0]
	Speaking = true
	ShouldAppear = true

func next_line():
	CurrentLine += 1
	if CurrentLine <= CurrentLines["Lines"].size() - 1:
		Dialogue.visible_characters = 0
		Dialogue.text = CurrentLines["Lines"][CurrentLine]
		if Port.texture != CurrentLines["Portraits"][CurrentLine]:
			Port.texture = CurrentLines["Portraits"][CurrentLine]
			Anim.play("Portrait Change")
	else:
		finish_speaking()

func handle_speaking():
	if Speaking:
		if Dialogue.visible_characters < Dialogue.text.length():
			if PauseDuration <= 0:
				Dialogue.visible_characters += 1
				PauseDuration += Duration_Between_Each_Letter
			else:
				PauseDuration -= 1.0
		else:
			if Input.is_action_just_pressed("Accept"):
				next_line()
	if Input.is_key_pressed(KEY_J): # FOR TESTING PURPOSES
		
		Global.play_dialogue(["Oh my god", "It actually works", "Holy shit", "Well that's cool", "And fine", "Dandy, even", "Ok I'm done", "I swear"], [DefaultPortrait, preload("res://VFX/Assets/Glow.png"), DefaultPortrait, DefaultPortrait, preload("res://VFX/Assets/Glow.png"), preload("res://VFX/Assets/Glow.png"), DefaultPortrait, DefaultPortrait])

func _physics_process(_delta: float):
	handle_speaking()
