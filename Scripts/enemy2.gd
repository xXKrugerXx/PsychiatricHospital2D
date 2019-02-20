extends KinematicBody2D

export(int) var walk := 100

var speed : float = 0
var motion : Vector2

var is_player : bool

var playerx

func _ready():
	is_player = false


func _physics_process(delta):
	motion.y += 10
	
	
	
	
	
	
	
	
	$AnimationTree['parameters/idle_walk/blend_position'] = motion.x
	motion = move_and_slide(motion,Vector2(0,-1))






