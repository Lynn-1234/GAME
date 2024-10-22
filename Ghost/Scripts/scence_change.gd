extends CanvasLayer

@onready var animation_player = $AnimationPlayer

var current_scene = null

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.modulate.a = 0
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)

#Scene switching function
func switch_scene(res_path):
	call_deferred("_deferred_switch_scene", res_path)
	#Calls the object's _deferred_switch_scene method when idle.

#The actual scene switching function
func _deferred_switch_scene(res_path):
	animation_player.play("fadin")
	await animation_player.animation_finished
	if current_scene != null:
		current_scene.free()#Release the current scene
		
	var scene = load(res_path)#Load a new scene
	current_scene = scene.instantiate()
	get_tree().root.add_child(current_scene)#Add the scene to the root directory
	get_tree().current_scene = current_scene#Set the current scene to the new scene
	
	animation_player.play_backwards("fadin")

