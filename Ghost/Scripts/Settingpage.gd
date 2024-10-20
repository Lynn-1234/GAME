extends Control


# Called when the node enters the scene tree for the first time.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_quit_pressed():
	get_tree().quit()

func _on_back_to_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scripts/main_menu.tscn")

func _on_back_to_game_pressed():
	Input.action_press("ui_settings")
	visible = false
	Globals.can_move = true
	print("button pressed")

func _on_guide_button_pressed():
	$GUIDE.visible = true


func _on_close_button_pressed():
	$GUIDE.visible = false
