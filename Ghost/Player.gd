extends CharacterBody2D

var speed = 300

func get_input():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * speed

func _physics_process(delta):
	get_input()
	move_and_collide(velocity * delta)
	
	#
	#if velocity.x < 0:
		#$AnimatedSprite2D.flip_h = true
	#if velocity.x > 0:
		#$AnimatedSprite2D.flip_h = false
	#
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_h = velocity.x < 0
		
	
		
	

	move_and_slide() 
