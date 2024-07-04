extends CharacterBody2D


@export var Speed = 300.0

@onready var lifetime = $Lifetime
@onready var collision_area := $Area2D

var direction: Vector2 = Vector2()

func Move(delta):
	translate(velocity.normalized() * Speed * delta)

func DestroyBullet():
	var collisions = collision_area.get_overlapping_bodies()
	if lifetime.is_stopped():
		queue_free()
	
	if collisions:
		queue_free()

func _ready():
	velocity = direction

func _physics_process(delta):
	Move(delta)
	DestroyBullet()
	
	move_and_slide()
