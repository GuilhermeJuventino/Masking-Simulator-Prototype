extends CharacterBody2D


const SPEED = 300.0

func NormalizeSpeed():
	velocity.x = velocity.x * (sqrt(2) / 2)
	velocity.y = velocity.y * (sqrt(2) / 2)

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var DirectionX = Input.get_axis("MoveLeft", "MoveRight")
	var DirectionY = Input.get_axis("MoveUp", "MoveDown")
	
	if DirectionX:
		velocity.x = DirectionX * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if DirectionY:
		velocity.y = DirectionY * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	if velocity.x != 0 and velocity.y != 0:
		NormalizeSpeed()
	
	velocity.x += velocity.x * delta
	velocity.y += velocity.y * delta

	move_and_slide()
