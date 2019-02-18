extends KinematicBody2D

export(int) var walk := 100

var speed : float = 0
var motion : Vector2

var playerx

func _ready():
	$Sprite.modulate = Color8(255,255,255,0)

func _physics_process(delta):
	motion.y += 10
	if $RayCast2DL.is_colliding() or $RayCast2DR.is_colliding():
		motion.x = speed
		$AnimationTree['parameters/OneShotattack/active'] = true
	else:
		if playerx != null:
			var pl = playerx.global_position.x - self.global_position.x
			if pl > 30:
				$Sprite.flip_h = true
				motion.x = walk
			elif pl < - 30:
				$Sprite.flip_h = false
				motion.x = -walk
		
	$AnimationTree['parameters/idle_walk/blend_position'] = motion.x
	motion = move_and_slide(motion,Vector2(0,-1))
	

func init(pos):
	self.position = pos

func attacked():
	pass

func tweenst() -> void:
	$Tween.interpolate_property($Sprite,'modulate',Color8(255,255,255,0),Color8(255,255,255,130),3.5,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$Tween.start()

func tweenend() -> void:
	$Tween.interpolate_property($Sprite,'modulate',Color8(255,255,255,130),Color8(255,255,255,0),1.4,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$Tween.start()
	yield($Tween,"tween_completed")

func tragetplayer(player):
	playerx = player

func _on_Area2Dplayer_body_entered(body):
	if body.is_in_group('player'):
		tweenst()

func _on_Area2Dplayer_body_exited(body):
	if body.is_in_group('player'):
		tweenend()
		yield(tweenend(),'completed')
#		self.queue_free()
		print('queue')


