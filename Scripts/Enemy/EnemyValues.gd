extends Node2D

@export_group("Required values")
@export var max_health: int = 1000 
@export var health: int = max_health

@export_group("Required nodes")
@export var player: Node2D
@export var health_bar: ProgressBar
@export var teleporters: Node2D

@onready var player_body = player.get_node("CharacterBody2D")


# Called when the node enters the scene tree for the first time.
func _ready():
	if player:
		print(str(player_body))
	
	if health_bar:
		print(str(health_bar.value))
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
