extends CanvasLayer

@onready var hearts_box: HBoxContainer = $HBoxContainer
@onready var timer_label: Label = $TimerLabel
@onready var death_label: Label = $DeathLabel

@onready var hearts = hearts_box.get_children()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	timer_label.text = "Timer: " + _format_time(GameState.run_time)
	death_label.text = "Total Deaths: " + str(GameState.total_deaths)

	for i in range(hearts.size()):
		hearts[i].visible = i < GameState.lives

func _format_time(t: float) -> String:
	var minutes := int(t / 60.0)
	var seconds := int(t) % 60
	return "%02d:%02d" % [minutes, seconds]
