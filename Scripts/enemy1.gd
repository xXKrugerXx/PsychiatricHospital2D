extends KinematicBody2D

export(int) var walk := 200


var speed : float = 0
var motion : Vector2


func _ready():
	$Sprite.modulate = Color8(255,255,255,0)

func _physics_process(delta):
	motion.y += 10
	var motnormalized = motion.normalized()
	
	if $RayCast2DL.is_colliding() or $RayCast2DR.is_colliding():
		motion.x = speed
		$AnimationTree['parameters/OneShotattack/active'] = true
	else:
		$AnimationTree['parameters/idle_walk/blend_position'] = Vector2(motnormalized.x,0)
	
	motion = move_and_slide(motion,Vector2(0,-1))
	

func init(pos):
	self.position = pos


func attacked():
	pass


func _on_Area2Denterplayer_body_entered(body):
	if body.is_in_group('player'):
		tweenst()


func _on_Area2Dexitplayer_body_exited(body):
	if body.is_in_group('player'):
		print('exit')
		tweenend()
		yield(tweenend(),'completed')
#		self.queue_free()
		pass


func tweenst() -> void:
	$Tween.interpolate_property($Sprite,'modulate',Color8(255,255,255,0),Color8(255,255,255,130),3.0,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$Tween.start()

func tweenend() -> void:
	$Tween.interpolate_property($Sprite,'modulate',Color8(255,255,255,130),Color8(255,255,255,0),2.0,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$Tween.start()
	yield($Tween,"tween_completed")



