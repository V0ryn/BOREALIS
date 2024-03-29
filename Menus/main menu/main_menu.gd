extends ColorRect



func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://map.tscn")


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://Menus/MainMenu Settings Menu/settings_menu.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
