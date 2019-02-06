extends Node

const next_map : = preload("res://Screens/Maps/Room023.tscn")

func _ready():
	$AnimationPlayer.play("statrt_ready")
	yield($AnimationPlayer,"animation_finished")
	get_tree().change_scene_to(next_map)
