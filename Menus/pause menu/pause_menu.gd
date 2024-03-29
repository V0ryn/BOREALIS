extends ColorRect

@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var play_button: Button = find_child("ResumeButton")
@onready var settings_button: Button = find_child("SettingsButton")
@onready var quit_button: Button = find_child("QuitButton")

func _ready() -> void:
	play_button.pressed.connect(unpause)
	settings_button.pressed.connect(settings)
	quit_button.pressed.connect(get_tree().quit)

func unpause():
	animator.play("Unpause")
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func pause():
	animator.play("Pause")
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func settings():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	$"../SettingsMenu".show()
	$"../SettingsMenu".animator.play("Appear")
	$"../SettingsMenu".settings_button = settings_button

