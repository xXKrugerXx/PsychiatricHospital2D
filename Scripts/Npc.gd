extends Area2D

var is_ready : bool

func _ready():
	is_ready = true
	$AnimationPlayer.play("loop")

func _on_Npc_body_entered(body):
	if body.is_in_group('player'):
		if is_ready:
			is_ready = false
			$Dialog2D.textready()
			yield(get_tree().create_timer(23.0),"timeout")
			queue()

func init(pos):
	self.position = pos


func queue():
	$Tween.interpolate_property($Sprite,'modulate',
		Color8(255,255,255,130),
		Color8(255,255,255,0),1.5,
		Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$Tween.start()
	yield($Tween,"tween_completed")
	self.queue_free()

