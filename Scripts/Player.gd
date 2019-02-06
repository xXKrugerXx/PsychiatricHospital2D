extends KinematicBody2D

export(int) var walk_speed = 200
export(int) var run_speed = 380

const tex_arr_flaslight : Array = [preload("res://Textures/touch/Flashlight_0.png"),
						preload("res://Textures/touch/Flashlight_1.png")]


const tex_arr_flasli_L_R : Array = [preload("res://Textures/particles/light lanternright.png"),
						preload("res://Textures/particles/light lanternleft.png")]


var lightning : int
var speed : float = 0
var amountrun : int
var motion : Vector2

var indexspeed : int

var isrun : bool
var isflashlight : bool

var isactiverun : bool

func _ready():
	indexspeed = 2
	lightning = 0
	amountrun = 0
	isactiverun = false
	
	isflashlight = true




func _physics_process(delta):
	motion.y += 10
	motion.x = speed
	
	
	
	walk_run(isactiverun)
	
	
	
	
	$AnimationTree['parameters/run/blend_amount'] = amountrun
	$AnimationTree['parameters/idle_walk/blend_position'] = Vector2(motion.x,lightning)
#	motion = move_and_slide_with_snap(motion,Vector2(0,-1), Vector2(0,32))
	motion = move_and_slide(motion,Vector2(0,-1))


func _input(event) -> void:
	if event.is_action_pressed("ui_left"):
		indexspeed = 0
	elif event.is_action_released("ui_left"):
		indexspeed = 2
	elif event.is_action_pressed('ui_right'):
		indexspeed = 1
	elif event.is_action_released("ui_right"):
		indexspeed = 2
	
	if event.is_action_pressed("ui_run"):
		isactiverun = true
	elif event.is_action_released("ui_run"):
		isactiverun = false
		
	if event.is_action_pressed("ui_pickup"):
		pass
	if event.is_action_pressed("ui_flashlight"):
		flashlight()

func walk_run(boo : bool) -> void:
	if !boo:
		if indexspeed == 0:
			speed = -walk_speed
			$Sprite.flip_h = true
			$Light2D.texture = tex_arr_flasli_L_R[1]
		elif indexspeed == 1:
			speed = walk_speed
			$Sprite.flip_h = false
			$Light2D.texture = tex_arr_flasli_L_R[0]
		else:
			speed = 0
		amountrun = 0
	else:
		if indexspeed == 0:
			amountrun = 1
			speed = -run_speed
			$Sprite.flip_h = true
			$Light2D.enabled = false
		elif indexspeed == 1:
			amountrun = 1
			speed = run_speed
			$Sprite.flip_h = false
			$Light2D.enabled = false


func flashlight() -> void:
	if isflashlight:
		isflashlight = false
		$HUDcharacter/VBoxContainer/HBoxContainer/Flashlight/TSButtonF.normal = tex_arr_flaslight[1]
		lightning = 1
	else:
		isflashlight = true
		$HUDcharacter/VBoxContainer/HBoxContainer/Flashlight/TSButtonF.normal = tex_arr_flaslight[0]
		lightning = 0







