extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -500.0


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("A", "D")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Global.health <= 0:
		$".".hide()
		$UI/CanvasLayer/dead_menu.visible = true
		$UI/AnimationPlayer.play("show_die_menu")


	move_and_slide()
