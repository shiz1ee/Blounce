extends Area2D

@export var bounce_force = -400.0
@onready var sprite = $Sprite2D

func _ready():
	body_entered.connect(_on_body_entered)


func _on_body_entered(body):
	print("touched by: ", body.name)
	if body.is_in_group("player") and body.velocity.y > 0:
		body.bounce(bounce_force)
		sprite.frame = 0
		await get_tree().create_timer(0.3).timeout
		sprite.frame = 0
