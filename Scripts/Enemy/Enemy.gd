extends CharacterBody2D

const SPEED = 300.0
var player_in: bool = false

func CheckCollision():
	# Detect if player has entered enemy's area 2d
	# print debug variable if collision was detected
	# Get access to player node information and healthbar information somehow
	# do stuff
	if player_in == true:
		print("ouch....")

func _physics_process(_delta):
	CheckCollision()

	move_and_slide()

func _on_area_2d_area_entered(_area):
	player_in = true
	#print("player_in: " + str(player_in))


func _on_area_2d_area_exited(_area):
	player_in = false
	#print("player_in: " + str(player_in))
