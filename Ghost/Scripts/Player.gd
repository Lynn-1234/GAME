extends CharacterBody2D

var speed = 200

func _ready():
	$Settingpage.visible = false
	$Settingpage/GUIDE.visible = false


func get_input():
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_dir * speed
	if Input.is_action_just_pressed("ui_settings"):
		toggle_settings()
		
	
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().quit()

func toggle_settings():
	if $Settingpage.visible :
		$Settingpage.visible = false
	else :
		$Settingpage.visible = true

func _physics_process(delta):
	if Globals.can_move:
		get_input()
		move_and_collide(velocity * delta)
		
		if velocity.x != 0 or velocity.y != 0:
			$AnimatedSprite2D.animation = "walk"
			$AnimatedSprite2D.flip_h = velocity.x < 0
			$AnimatedSprite2D.play()
		else:
			$AnimatedSprite2D.stop()
			
		move_and_slide() 
		
		
	$HUD.show_message()
	


func _process(delta):
	pass

#func _on_timeline_ended():
	#IsDialog = false

