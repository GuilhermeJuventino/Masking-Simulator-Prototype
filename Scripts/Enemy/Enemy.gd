extends CharacterBody2D

const SPEED = 300.0

@onready var values := get_parent().get_node("../Enemy")
@onready var teleport_cooldown = $TeleportCooldown
@onready var teleport_duration = $TeleportDuration
@onready var invincibility_duration = $InvincibilityDuration
@onready var shooting_cooldown = $ShootingCooldown
@onready var teleport_points = values.teleporters.get_children()
@onready var bullet = values.bullet
@onready var health = values.health
@onready var max_health = values.max_health
@onready var health_bar = values.health_bar
@onready var collision_area := $Area2D
@onready var player = values.player
#@onready var player_body = values.player_body

var player_in: bool = true
var is_teleporting: bool = false
var is_invincible: bool = false

var teleport_index = randi_range(0, 3)

signal player_is_colliding
signal player_is_not_colliding

func Shoot():
	if shooting_cooldown.time_left == 0:
		var b = bullet.instantiate()
		var direction = player.global_position - global_position
		
		b.global_transform = global_transform
		b.direction = direction
		
		get_tree().get_root().add_child(b)
		shooting_cooldown.start()
	

func Death():
	if health_bar.value <= 0:
		get_tree().change_scene_to_file("res://Scenes/Victory.tscn")

func CheckCollision():
	# Detect if player has entered enemy's area 2d
	# print debug variable if collision was detected
	# Get access to player node information and healthbar information somehow
	# do stuff
	var collisions = collision_area.get_overlapping_bodies()
	if collisions and health_bar.value > 0:
		if not is_invincible:
			health_bar.value -= 1

func CheckInvincibility():
	if invincibility_duration.time_left != 0:
		is_invincible = true
		#player_in = false
	else:
		is_invincible = false

func Teleport():
	# Create an array or list of positions in the arena to teleport
	# Make enemy imune to damage while teleporting
	# Hide enemy while teleporting
	# Move or "teleport" enemy to new position (determined by RNG probably)
	# Make enemy visible again
	# Make enemy vulnerable again
	if teleport_cooldown.time_left == 0:
		#collision_area.disabled = true
		var current_teleport_index = teleport_index
		
		while teleport_index == current_teleport_index:
			teleport_index = randi_range(0, 3)
		
		#is_invincible = true
		visible = false
		#is_teleporting = true
		invincibility_duration.start()
		global_position = teleport_points[teleport_index].global_position
		#collision_area.global_position = global_position
		
		#is_teleporting = false
		visible = true
		#is_invincible = false
		
		teleport_cooldown.start()

func _ready():
	teleport_index = randi_range(0, 3)
	shooting_cooldown.start()

func _physics_process(_delta):
	Teleport()
	CheckInvincibility()
	CheckCollision()
	Shoot()

	move_and_slide()
	
	Death()
