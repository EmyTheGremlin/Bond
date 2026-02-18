extends Node2D

@export_category("Camera")
@export var CameraLimitLeft := 0.0
@export var CameraLimitRight := 0.0

@export var CameraSpeed = 1.0

@export_category("Misc")

@onready var Cam = $Camera
@onready var Dialogue = $Camera/Control/Dialogue
@onready var CutsceneHandler = $CutsceneHandler

var CamMoveLeft = false
var CamMoveRight = false

func _ready():
	Global.Main = self
	Global.Dialogue = self.Dialogue
	Global.CutsceneHandler = self.CutsceneHandler
	Cam.zoom = Vector2(1.65, 1.65)
	%CameraControllerLeft.connect("mouse_entered", camera_start_move_left)
	%CameraControllerLeft.connect("mouse_exited", camera_stop_move_left)
	%CameraControllerRight.connect("mouse_entered", camera_start_move_right)
	%CameraControllerRight.connect("mouse_exited", camera_stop_move_right)

func camera_start_move_left():
	CamMoveLeft = true

func camera_stop_move_left():
	CamMoveLeft = false

func camera_start_move_right():
	CamMoveRight = true

func camera_stop_move_right():
	CamMoveRight = false

func camera_movement():
	if Cam.position.x <= CameraLimitLeft:
		Cam.position.x = CameraLimitLeft
	else:
		if CamMoveLeft:
			Cam.position.x -= CameraSpeed
	if Cam.position.x >= CameraLimitRight:
		Cam.position.x = CameraLimitRight
	else:
		if CamMoveRight:
			Cam.position.x += CameraSpeed

func _physics_process(_delta: float):
	if not Dialogue.Speaking:
		camera_movement()

func _process(_delta: float):
	pass
