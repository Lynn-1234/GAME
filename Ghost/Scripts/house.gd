extends StaticBody2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_door_body_entered(body):
	if body.name == "Player":
		#get_tree().change_scene_to_file("res://Scripts/house_inside.tscn")
		ScenceChange.switch_scene("res://Scripts/house_inside.tscn")



func _on_player_position_body_entered(body):
	if body.name == "Player":
		Globals.last_Player = body.global_position
