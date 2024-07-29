extends CharacterBody2D
var IsDialog = true

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _process(delta):
	if IsDialog:
		#if Input.is_action_just_pressed("dialogic_default_action"):
			if Dialogic.current_timeline != null:
				return
			Dialogic.timeline_ended.connect(_on_timeline_ended)
			var layput = Dialogic.start("NPC_2_timeline")
			get_viewport().set_input_as_handled()

func _on_timeline_ended():
	IsDialog = false
