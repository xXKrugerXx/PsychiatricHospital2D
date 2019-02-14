extends Area2D

const file : String = 'res://Screens/Maps/Room'

export(String) var door_name := ''

func door_open(stri) -> void:
	get_tree().change_scene(file + stri + '.tscn')