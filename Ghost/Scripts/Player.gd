extends CharacterBody2D

var speed = 200
var IsDialog = true

func get_input():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * speed

func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)
	
	
	if velocity.x != 0 or velocity.y != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_h = velocity.x < 0
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	move_and_slide() 

func _process(delta):
	#if IsDialog:
		##if Input.is_action_just_pressed("dialogic_default_action"):
			#if Dialogic.current_timeline != null:
				#return
			#Dialogic.timeline_ended.connect(_on_timeline_ended)
			#var layput = Dialogic.start("first_timeline")
			#get_viewport().set_input_as_handled()
			pass

#func _on_timeline_ended():
	#IsDialog = false

