extends KinematicBody2D

export(int) var walk := 127

var speed : float = 0
var motion : Vector2
var attackactive : float
var is_player : bool
var is_player_ready : bool
var playerx

func init(pos):
	self.position = pos

func _ready():
	randomize()
	attackactive = 0
	self.modulate = Color8(255,255,255,0)
	is_player = false
	is_player_ready = false
	$AudioStreamPlayer2D.playing = false
	$Tween.interpolate_property(self,'modulate',
					Color8(255,255,255,0),
					Color8(255,255,255,255),3.0,
					Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$Tween.start()
	yield($Tween,"tween_completed")
	is_player_ready = true

func _physics_process(delta):
	motion.y += 10
	if playerx != null:
		if is_player and is_player_ready:
			var pl = playerx.global_position.x - self.global_position.x
			if pl > 30:
				$Sprite.flip_h = true
				motion.x = walk
			elif pl < - 30:
				$Sprite.flip_h = false
				motion.x = -walk
		else:
			motion.x = speed

	$AnimationTree['parameters/idle_walk/blend_position'] = Vector2(motion.x,attackactive)
	motion = move_and_slide(motion,Vector2(0,-1))

func queue():
	var r = randi() % 2
	if r == 1:
		$Tween.interpolate_property(self,'modulate',
						Color8(255,255,255,255),
						Color8(255,255,255,0),2.0,
						Tween.TRANS_SINE,Tween.EASE_IN_OUT)
		$Tween.start()
		yield($Tween,"tween_completed")
		self.queue_free()

func tragetplayer(player):
	playerx = player

func _on_Area2Dwalk_player_body_entered(body):
	if body.is_in_group('player'):
		is_player = true
		$AudioStreamPlayer2D.playing = true

func _on_Area2Dwalk_player_body_exited(body):
	if body.is_in_group('player'):
		is_player = false
		$AudioStreamPlayer2D.playing = false
		queue()

func _on_Area2Dattakck_player_body_entered(body):
	if body.is_in_group('player'):
		attackactive = 1

func _on_Area2Dattakck_player_body_exited(body):
	if body.is_in_group('player'):
		attackactive = 0

func _on_Area2Dplayer_death_body_entered(body):
	if body.is_in_group('player'):
		$AudioStreamPlayer2D.playing = false
		body.death()
		if playerx != null:
			$Tween.interpolate_property(self,'modulate',
							Color8(255,255,255,255),
							Color8(255,255,255,0),2.0,
							Tween.TRANS_SINE,Tween.EASE_IN_OUT)
			$Tween.start()
			yield($Tween,"tween_completed")
			self.queue_free()
