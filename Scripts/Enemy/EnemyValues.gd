extends Node2D

@export_group("Required values")
@export var max_health = 1000 
@export var health = max_health

@export_group("Required nodes")
@export var player: Node2D
@export var health_bar: ProgressBar

#@onready var player_body = $player.CharacterBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#print(player_body)
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
