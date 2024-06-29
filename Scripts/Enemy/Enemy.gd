extends CharacterBody2D

const SPEED = 300.0

@onready var values := get_parent().get_node("../Enemy")
@onready var teleport_cooldown = $TeleportCooldown
@onready var teleport_points = values.teleporters.get_children()

var player_in: bool = false
var is_teleporting: bool = false
var is_invincible: bool = false

func CheckCollision():
	# Detect if player has entered enemy's area 2d
	# print debug variable if collision was detected
	# Get access to player node information and healthbar information somehow
	# do stuff
	if player_in:
		print("ouch....")

func Teleport():
	# Create an array or list of positions in the arena to teleport
	# Make enemy imune to damage while teleporting
	# Hide enemy while teleporting
	# Move or "teleport" enemy to new position (determined by RNG probably)
	# Make enemy visible again
	# Make enemy vulnerable again
	if teleport_cooldown.time_left == 0:
		var teleport_index = randi_range(0, 3)
		
		is_invincible = true
		visible = false
		is_teleporting = true
		global_position = teleport_points[teleport_index].global_position
		
		is_teleporting = false
		visible = true
		is_invincible = false
		
		teleport_cooldown.start()

func _ready():
	pass

func _physics_process(_delta):
	Teleport()
	CheckCollision()

	move_and_slide()

func _on_area_2d_area_entered(_area):
	player_in = true


func _on_area_2d_area_exited(_area):
	player_in = false
