extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	var start_button = $StartButton
	start_button.connect("pressed", Callable(self, "_on_start_button_pressed"))
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	#var main_scene = load("res://Scripts/main.tscn")
	#get_tree().change_scene_to_file("res://Scripts/main.tscn")
	ScenceChange.switch_scene("res://Scripts/main.tscn")


func _on_quite_button_pressed():
	get_tree().quit()
