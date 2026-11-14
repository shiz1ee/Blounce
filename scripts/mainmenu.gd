extends Node2D


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level1.tscn")


func _on_settings_pressed():
	print("settings pressed")
	var layer = CanvasLayer.new()
	layer.layer = 10
	add_child(layer)
	var settings = preload("res://scenes/settings.tscn").instantiate()
	layer.add_child(settings)


func _on_quit_pressed() -> void:
	get_tree().quit()
