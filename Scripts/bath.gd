extends Node2D

func _ready():
	randomize()
	var rindex = randi() % 2
	
	if rindex == 1:
		$AnimationPlayer.play('loop')
	else:
		$AnimationPlayer.play('noloop')
