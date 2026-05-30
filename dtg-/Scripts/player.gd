extends CharacterBody2D

@onready var animation: AnimatedSprite2D = $AnimatedSprite2D

var SPEED = 400.0
const JUMP_VELOCITY = -600.0
var dash_cooldown = 1.6
var _dash_cd_timer: float = 0.0

func _physics_process(delta: float) -> void:
	if _dash_cd_timer > 0.0:
		_dash_cd_timer = max(_dash_cd_timer - delta, 0.0)
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		#flip_h if moving left
		if direction < 0.1:
			animation.flip_h = true
		else:
			animation.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	
	move_and_slide()

	#handle dash
	if Input.is_action_just_pressed("dash") and _dash_cd_timer <= 0.0:
		$dashtimer.start()
		SPEED *= 3.5
		velocity.x = direction * SPEED
		_dash_cd_timer = dash_cooldown
		


	if is_on_floor():
		if abs(velocity.x) > 0.1:
			animation.play("run")
		else:
			animation.play("idle")
			
	else:
		animation.play("jump")


func _on_dashtimer_timeout() -> void:
	#reset dash to normal
	SPEED = 400
