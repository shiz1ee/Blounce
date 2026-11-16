extends Control

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS


func _on_retry_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/level1.tscn")


func _on_main_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/mainmenu.tscn")
