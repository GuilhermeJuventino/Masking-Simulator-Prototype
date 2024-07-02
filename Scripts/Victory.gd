extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/RetryButton.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_retry_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/Game.tscn")


func _on_return_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
