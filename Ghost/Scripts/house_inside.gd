extends Node2D

@onready var PlayerSpawn = preload("res://Scripts/player.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	call_deferred("spawn_player")

func spawn_player():
	var player = PlayerSpawn.instantiate()
	player.global_position = $Marker2D.global_position
	
	add_child(player)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_outside_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Scripts/main.tscn")
	
