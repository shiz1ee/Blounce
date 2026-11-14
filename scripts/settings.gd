extends Control

@onready var music_bus_index: int  = AudioServer.get_bus_index("music")



func _on_back_pressed() -> void:
	get_parent().queue_free()


func _ready() -> void:
	$VBoxContainer/HSlider.value = db_to_linear(AudioServer.get_bus_volume_db(music_bus_index))

func _on_h_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(music_bus_index, linear_to_db(value))


func _on_check_button_toggled(toggled_on: bool) -> void:
	AudioServer.set_bus_mute(music_bus_index, toggled_on)


func _on_settings_pressed():
	var settings = preload("res://scenes/settings.tscn").instantiate()
	add_child(settings)
