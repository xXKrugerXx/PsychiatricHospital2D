extends Light2D

func init(pos):
	self.position = pos

func _ready():
	$AnimationPlayer.play("start")

func queue():
	self.queue_free()