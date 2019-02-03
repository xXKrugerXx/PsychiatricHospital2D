extends KinematicBody2D

export(int) var walk_speed = 200

var speed : float = 0

var motion : Vector2
var iswalk : bool = false

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
		speed = -walk_speed
		$Sprite.flip_h = true
	elif event.is_action_released("ui_left"):
		speed = 0
	elif event.is_action_pressed('ui_right'):
		speed = walk_speed
		$Sprite.flip_h = false
	elif event.is_action_released("ui_right"):
		speed = 0













