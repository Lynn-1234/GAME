extends CanvasLayer

@onready var animation_player = $AnimationPlayer

var current_scene = null

# Called when the node enters the scene tree for the first time.
func _ready():
	$ColorRect.modulate.a = 0
	var root = get_tree().root
	current_scene = root.get_child(root.get_child_count() - 1)

#场景切换函数,第一个参数表示切换到对应场景的路径，参数二表示人公出现的位置
func switch_scene(res_path):
	call_deferred("_deferred_switch_scene", res_path)
	#在空闲时调用该对象的_deferred_switch_scene方法。始终返回 null，不返回该方法的结果。

#真正切换场景函数,第一个参数表示切换到对应场景的路径，参数二表示人公出现的位置
func _deferred_switch_scene(res_path):
	animation_player.play("fadin")
	await animation_player.animation_finished
	if current_scene != null:
		current_scene.free()#释放当前场景
		
	var scene = load(res_path)#载入新场景
	current_scene = scene.instantiate()
	get_tree().root.add_child(current_scene)#将场景添加到根目录	
	get_tree().current_scene = current_scene#当前场景设置为新的场景
	
	animation_player.play_backwards("fadin")

