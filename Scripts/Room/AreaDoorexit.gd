extends Area2D

export(PackedScene) var nextmap

func next_map():
	if nextmap != null:
		get_tree().change_scene_to(nextmap)
