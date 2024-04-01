extends ColorRect

var settings_button : Button
@onready var config = ConfigFile.new()

@onready var animator: AnimationPlayer = $AnimationPlayer
@onready var fullscreen_button: Button = find_child("FullscreenButton")
@onready var vsync_button: Button = find_child("VsyncButton")
@onready var audio_button: Button = find_child("AudioButton")
@onready var sfx_button: Button = find_child("SFXButton")
@onready var sdfgi_button: Button = find_child("SDFGI")
@onready var ssao_button: Button = find_child("SSAO")
@onready var glow_button: Button = find_child("Glowbutton")
@onready var shadows_button: Button = find_child("Shadowsbutton")
@onready var shadows_option_button: OptionButton = find_child("ShadowsOptionButton")



func _ready():
	shadows_option_button.add_item("Fast", 0)
	shadows_option_button.add_item("Good", 1)
	shadows_option_button.add_item("Best", 2)
	

func _input(event):
	if event.is_action_pressed("quit") && visible:
		accept_event()
		get_tree().change_scene_to_file("res://Menus/main menu/main_menu.tscn")

func _on_button_pressed() -> void:
	accept_event()
	get_tree().change_scene_to_file("res://Menus/main menu/main_menu.tscn")



func _on_fullscreen_button_toggled(toggled_on: bool) -> void:
	if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_FULLSCREEN:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	elif DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_WINDOWED:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)

func _on_vsync_button_pressed() -> void:
	if DisplayServer.window_get_vsync_mode() == DisplayServer.VSYNC_ADAPTIVE:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_ADAPTIVE)
	else:
		DisplayServer.window_set_vsync_mode(DisplayServer.VSYNC_DISABLED)


func _on_sdfgi_toggled(button_pressed):
	
	Graphics.world_environment.environment.sdfgi_enabled = button_pressed
	


func _on_ssao_toggled(button_pressed):
	Graphics.world_environment.environment.ssao_enabled = button_pressed


func _on_glowbutton_toggled(button_pressed):
	Graphics.world_environment.environment.glow_enabled = button_pressed


func _on_shadowsbutton_toggled(button_pressed):
	Graphics.light.shadow_enabled = button_pressed


func _on_shadows_option_button_item_selected(index):
	Graphics.light.directional_shadow_mode = index

