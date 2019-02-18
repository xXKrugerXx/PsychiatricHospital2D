extends Area2D

func _ready():
	$AnimationPlayer.play("loop")


func _on_Npc_body_entered(body):
	if body.is_in_group('player'):
		$Dialog2D.textready()

func _on_Npc_body_exited(body):
	if body.is_in_group('player'):
		$Dialog2D.textend()

func init(pos):
	self.position = pos




