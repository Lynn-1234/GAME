extends Node
var last_Player
var is_first_time = true
var can_move = true

#var previous_scene_path = ""  # 用于存储上一个场景路径
#
## 保存当前场景路径
#func save_previous_scene():
	#if get_tree().current_scene != null:
		#previous_scene_path = get_tree().current_scene.resource_path
	#else:
		#print("No current scene found!")
#
## 切换到给定路径的场景
#func change_scene_to(scene_path):
	#get_tree().change_scene(scene_path)
#
## 返回到上一个场景
#func return_to_previous_scene():
	#if previous_scene_path != "":
		#change_scene_to(previous_scene_path)
	#else:
		#print("No previous scene saved.")
