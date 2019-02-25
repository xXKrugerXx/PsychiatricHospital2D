extends Camera2D

func init(pos):
	self.global_position = pos

func _ready():
	$AnimationPlayer.play("start")






