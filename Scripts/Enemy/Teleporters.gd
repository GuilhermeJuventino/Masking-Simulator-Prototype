extends Node2D

@export_group("Required nodes")
@export var teleport_points: Array[Node2D]


# Called when the node enters the scene tree for the first time.
func _ready():
	#for point in teleport_points:
		#print(str(point.transform))
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
