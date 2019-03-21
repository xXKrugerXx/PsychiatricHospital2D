extends KinematicBody2D

export(int) var walk := 75

var speed : float = 0
var motion : Vector2

var is_player : bool
var is_player_ready : bool

var playerx

func _ready():
	is_player = false
	$RayCast2DR.enabled = false
	$RayCast2DL.enabled = false
	is_player_ready = false
	$Sprite.modulate = Color8(255,255,255,0)
	$AudioStreamPlayer2D.playing = false
	$Tween.interpolate_property($Sprite,
		'modulate',
		Color8(255,255,255,0),
		Color8(255,255,255,130),3.0,
		Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$Tween.start()
	yield($Tween,"tween_completed")
	is_player_ready = true
	

func _physics_process(delta):
	motion.y += 10
	if $RayCast2DL.is_colliding() or $RayCast2DR.is_colliding():
		motion.x = speed
		$AnimationTree['parameters/OneShotattack/active'] = true
	else:
		if playerx != null:
			if is_player and is_player_ready:
				var pl = playerx.global_position.x - self.global_position.x
				if pl > 30:
					$Sprite.flip_h = true
					motion.x = walk
				elif pl < - 30:
					$Sprite.flip_h = false
					motion.x = -walk
			
				if $Sprite.is_flipped_h():
					$RayCast2DR.enabled = true
					$RayCast2DL.enabled = false
				else:
					$RayCast2DR.enabled = false
					$RayCast2DL.enabled = true
			else:
				motion.x = speed
		
	$AnimationTree['parameters/idle_walk/blend_position'] = motion.x
	motion = move_and_slide(motion,Vector2(0,-1))
	

func init(pos):
	self.position = pos

func attacked():
	if $RayCast2DL.is_colliding() or $RayCast2DR.is_colliding():
		var L = $RayCast2DL.get_collider()
		var R = $RayCast2DR.get_collider()
		if L != null:
			$AudioStreamPlayer2D.playing = false
			L.death()
		if R != null:
			$AudioStreamPlayer2D.playing = false
			R.death()

func tweenend() -> void:
	$Tween.interpolate_property($Sprite,'modulate',Color8(255,255,255,130),Color8(255,255,255,0),1.4,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$Tween.start()
	yield($Tween,"tween_completed")

func tragetplayer(player):
	playerx = player

func _on_Area2Dplayer_body_entered(body):
	if body.is_in_group('player'):
		is_player = true
		$AudioStreamPlayer2D.playing = true

func _on_Area2Dplayer_body_exited(body):
	if body.is_in_group('player'):
		is_player = false
		$AudioStreamPlayer2D.playing = false
		yield(tweenend(),'completed')
		self.queue_free()


