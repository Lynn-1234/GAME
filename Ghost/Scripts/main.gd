extends Node2D

@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.last_Player:
		player.global_position = Globals.last_Player

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass
	

