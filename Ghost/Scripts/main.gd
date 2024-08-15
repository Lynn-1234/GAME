extends Node2D

var IsDialog = true


@onready var player = $Player

# Called when the node enters the scene tree for the first time.
func _ready():
	if Globals.last_Player:
		player.global_position = Globals.last_Player


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Globals.is_first_time:
		if IsDialog:
			if Dialogic.current_timeline != null:
				return
			Dialogic.timeline_ended.connect(_on_timeline_ended)
			var layput = Dialogic.start("first_timeline")
			get_viewport().set_input_as_handled()
		Globals.is_first_time = false



func _on_timeline_ended():
	IsDialog = false

