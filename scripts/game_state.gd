extends Node

const MAX_LIVES := 3

var lives: int = MAX_LIVES

#current run stats
var deaths: int = 0
var run_time: float = 0.0

#lifetime statistics 
var total_deaths: int = 0

var timer_running: bool = false

func _process(delta: float) -> void:
	if timer_running:
		run_time += delta

func reset_run() -> void:
	lives = MAX_LIVES
	deaths = 0
	run_time = 0.9
	timer_running = true

func lose_life() -> bool:
	deaths += 1
	total_deaths += 1

	save_data()

	lives -= 1

	if lives <= 0:
		timer_running = false
		return true

	return false

#game stats save
const SAVE_PATH = "user://save_data.save"

func save_data() -> void:
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_var(total_deaths)

func load_data() -> void:
	if FileAccess.file_exists(SAVE_PATH):
		var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
		total_deaths = file.get_var()

func _ready() -> void:
	load_data()
