extends CharacterBody2D
var IsDialog = false


const SPEED = 300.0
const JUMP_VELOCITY = -400.0



# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _process(delta):
	if IsDialog:
		if Input.is_action_just_pressed("dialogic_default_action"):
			Globals.can_move = false
			if Dialogic.current_timeline != null:
				return
			Dialogic.timeline_ended.connect(_on_timeline_ended)
			var layput = Dialogic.start("NPC_2_timeline")
			get_viewport().set_input_as_handled()

	$IcoAn.play("new_animation")
	
	

func _on_timeline_ended():
	IsDialog = false
	Globals.can_move = true

func _on_show_dialogue_body_entered(body):
	if body.name == "Player": 
		#$IcoSp.visible= true
		#$IcoAn.play("new_animation")
		IsDialog = true
	$ShowDialogue.visible = true

func _on_show_dialogue_body_exited(body):
	if body.name == "Player":
		#$IcoSp.visible = false
		#$IcoAn.stop()
		IsDialog = false
	$ShowDialogue.visible = false



