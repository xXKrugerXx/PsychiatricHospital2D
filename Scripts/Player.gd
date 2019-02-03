extends KinematicBody2D

export(int) var walk_speed = 200
#export(int) var run_speed = 300


var speed : float = 0
var motion : Vector2

func _ready():
	$AnimationTree['parameters/run/blend_amount'] = 0
	



func _physics_process(delta):
	motion.y += 10
	motion.x = speed
	
	
	$AnimationTree['parameters/idle_walk/blend_position'] = Vector2(motion.x,0)
#	motion = move_and_slide_with_snap(motion,Vector2(0,-1), Vector2(0,32))
	motion = move_and_slide(motion,Vector2(0,-1))


func _input(event):
	if event.is_action_pressed("ui_left"):
		charspeed(0)
	elif event.is_action_released("ui_left"):
		charspeed(2)
	elif event.is_action_pressed('ui_right'):
		charspeed(1)
	elif event.is_action_released("ui_right"):
		charspeed(2)
	
	if event.is_action_pressed("ui_pickup"):
		pass
	if event.is_action_pressed("ui_run"):
		pass
	elif event.is_action_released("ui_run"):
		pass
	if event.is_action_pressed("ui_flashlight"):
		pass


func charspeed(indexspeed):
	if indexspeed == 0:
		speed = -walk_speed
		$Sprite.flip_h = true
	elif indexspeed == 1:
		speed = walk_speed
		$Sprite.flip_h = false
	else:
		speed = 0













