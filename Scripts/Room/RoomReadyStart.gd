extends Node

const next_map := preload('res://Screens/Maps/Room023.tscn')

func _ready():
	s_globals.keys.clear()
	s_globals.keyfinal = ''
	$CanvasLayer/ColorRect.color = Color8(0,0,0,255)
	$AnimationPlayer.play("statrt_ready")
	yield($AnimationPlayer,"animation_finished")
	get_tree().change_scene_to(next_map)


func start_dialog():
	$Dialog2D.textready()






