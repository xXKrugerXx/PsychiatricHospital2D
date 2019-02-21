extends KinematicBody2D

export(int) var walk := 155

var speed : float = 0
var motion : Vector2
var attackactive : float
var is_player : bool
var is_player_ready : bool
var playerx

var rindex : int
var is_piayer_act_out : bool
var is_act_attack : bool

func init(pos):
	self.position = pos

func _ready():
	randomize()
	attackactive = 0
	self.modulate = Color8(255,255,255,0)
	is_player = false
	is_player_ready = false
	is_piayer_act_out = false
	is_act_attack = true
	$Area2Dplayer_death.set_collision_mask_bit(2,false)
	$Tween.interpolate_property(self,'modulate',
					Color8(255,255,255,0),
					Color8(255,255,255,255),1.0,
					Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$Tween.start()
	yield($Tween,"tween_completed")
	is_player_ready = true

func _physics_process(delta):
	motion.y += 10
	if playerx != null:
		
		if rindex == 0:
			motion.x = speed
		
		elif rindex == 1:
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
		else:
			if is_piayer_act_out and is_player_ready:
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
		if rindex == 0:
			$Area2Dplayer_death.set_collision_mask_bit(2,false)
		elif rindex == 1:
			$Area2Dplayer_death.set_collision_mask_bit(2,true)
			is_player = true
		else:
			if is_act_attack:
				$Area2Dplayer_death.set_collision_mask_bit(2,false)
			else:
				$Area2Dplayer_death.set_collision_mask_bit(2,true)

func _on_Area2Dwalk_player_body_exited(body):
	if body.is_in_group('player'):
		if rindex == 1:
			is_player = false
			queue()
		elif rindex == 2:
			is_piayer_act_out = true
			attackactive = -1
			is_act_attack = false

func _on_Area2Dattakck_player_body_entered(body):
	if body.is_in_group('player'):
		if rindex == 1:
			attackactive = 1

func _on_Area2Dattakck_player_body_exited(body):
	if body.is_in_group('player'):
		if rindex == 1:
			attackactive = 0

func _on_Area2Dplayer_death_body_entered(body):
	if body.is_in_group('player'):
		body.death()
		if playerx != null:
			$Tween.interpolate_property(self,'modulate',
							Color8(255,255,255,255),
							Color8(255,255,255,0),2.0,
							Tween.TRANS_SINE,Tween.EASE_IN_OUT)
			$Tween.start()
			yield($Tween,"tween_completed")
			self.queue_free()


func _on_Area2D_act_out_body_entered(body):
	if body.is_in_group('player'):
		rindex = randi() % 3


func _on_Area2D_act_out_body_exited(body):
	if body.is_in_group('player'):
		is_piayer_act_out = false
		attackactive = 0
		is_act_attack = true




