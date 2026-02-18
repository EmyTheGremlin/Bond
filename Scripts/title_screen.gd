extends Node2D

@onready var AnimPlayer = $AnimationPlayer
@onready var StartButton = $Button

const MainScene = preload("res://Scenes/main.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	AnimPlayer.play("RESET")
	AnimPlayer.play("Start")
	StartButton.connect("pressed", on_game_start)

func on_game_start():
	
	get_tree().change_scene_to_packed(MainScene)
