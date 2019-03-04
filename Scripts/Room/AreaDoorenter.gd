extends Area2D

const file : String = 'res://Screens/Maps/Room'

export(String) var door_name := ''
export(int) var index_pos := 0

func door_open(stri : String) -> void:
	get_tree().change_scene(file + stri + '.tscn')

func _on_AreaDoorenter_body_entered(body):
	if body.is_in_group('player'):
		if !s_globals.is_enter_pos:
			s_globals.posPlayer[index_pos] = true


func _on_AreaDoorenter_body_exited(body):
	if body.is_in_group('player'):
		if !s_globals.is_enter_pos:
			s_globals.posPlayer[index_pos] = false
