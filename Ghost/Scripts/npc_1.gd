extends CharacterBody2D
@export var playerPosition:CharacterBody2D
var IsDialog = false



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if IsDialog:
		if Input.is_action_just_pressed("dialogic_default_action"):
			Globals.can_move = false
			if Dialogic.current_timeline != null:
				return
			Dialogic.timeline_ended.connect(_on_timeline_ended)
			var layput = Dialogic.start("NPC_chiaki_timeline")
			get_viewport().set_input_as_handled()
			pass
	else : 
		$IcoSp.visible = false

func _on_timeline_ended():
	IsDialog = false
	Globals.can_move = true

func _on_show_dialogue_body_entered(body): 
	if body.name == "Player": 
		$IcoSp.visible = true
		$IcoAn.play("Default")
		IsDialog = true
	

func _on_show_dialogue_body_exited(body):
	if body.name == "Player":
		$IcoSp.visible = false
		$IcoAn.stop()
		IsDialog = false
