extends Area2D

var is_final = false

const file : String = 'res://Screens/Maps/Room'
const file_final_game : String = 'res://Screens/Maps/Final_Game'

export(String) var door_name := ''
export(int) var index_pos := 0

func door_open(stri : String) -> void:
	if is_final:
		get_tree().change_scene(file_final_game + '.tscn')
	else:
		get_tree().change_scene(file + stri + '.tscn')
	
	
func _on_AreaDoorenter_body_entered(body):
	if body.is_in_group('player'):
		if !s_globals.is_enter_pos:
			s_globals.posPlayer[index_pos] = true


func _on_AreaDoorenter_body_exited(body):
	if body.is_in_group('player'):
		if !s_globals.is_enter_pos:
			s_globals.posPlayer[index_pos] = false
