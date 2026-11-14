extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

var is_dead := false

func die():
	if is_dead:
		return
	is_dead = true
	velocity = Vector2.ZERO
	$AnimatedSprite2D.play("death")
	await $AnimatedSprite2D.animation_finished
	var layer = CanvasLayer.new()
	layer.layer = 10
	get_tree().current_scene.add_child(layer)
	layer.add_child(preload("res://scenes/deathscreen.tscn").instantiate()) #change it to the new dead scene.

	
func bounce(force):
	velocity.y = force
	$AnimatedSprite2D.play("bigjump")
	await $AnimatedSprite2D.animation_finished
	$AnimatedSprite2D.play("idle")
