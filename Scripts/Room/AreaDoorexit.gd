extends Area2D

export(PackedScene) var next_map

export(String) var s_nextmap = ''

const path : String = 'res://Screens/Maps/'

func next_map():
	if next_map != null:
		get_tree().change_scene_to(next_map)
#	get_tree().change_scene(path + s_nextmap + '.tscn')
