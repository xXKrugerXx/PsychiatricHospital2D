extends Area2D

export(String) var s_nextmap = ''

const path : String = "res://Screens/Maps/WorldMap00.tscn"

func next_map():
	get_tree().change_scene(path)
