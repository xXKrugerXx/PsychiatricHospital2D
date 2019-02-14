extends KinematicBody2D

export(int) var walk_speed = 200
export(int) var run_speed = 380
export(float, 0, 5,0.1) var regspeedstamina = 1.1
export(float, 0, 5,0.1) var minuscurrentstamina = 0.2

onready var Bar_run = $HUDcharacter/BarRun/TextureProgress  as TextureProgress

onready var hudlabelkeys = $HUDcharacter/Control/LabelKeys as Label


const tex_arr_flaslight : Array = [preload("res://Textures/touch/Flashlight_0.png"),
						preload("res://Textures/touch/Flashlight_1.png")]


const tex_arr_flasli_L_R : Array = [preload("res://Textures/particles/light lanternright.png"),
						preload("res://Textures/particles/light lanternleft.png")]


var lightning : int
var speed : float = 0
var amountrun : int
var motion : Vector2

var indexspeed : int
var isflashlight : bool
var isactiverun : bool
var ispickup : bool

func _ready():
	indexspeed = 2
	lightning = 0
	amountrun = 0
	isactiverun = false
	isflashlight = true
	ispickup = false
	
	###########HUD####################
	Bar_run.value = s_globals.currentstamina
	hudlabelkeys.text = tr('Door_keys')

func _process(delta : float) -> void:
	for i in $HUDcharacter/Control/HUDTableKeys/GridContainer.get_children():
		if i.get_name() in s_globals.keys:
			i.modulate = Color8(255,255,255,255)
		else:
			i.modulate = Color8(60,60,60,255)

func _physics_process(delta : float) -> void:
	motion.y += 10
	motion.x = speed
	s_globals.currentstamina = clamp(s_globals.currentstamina,Bar_run.get_min(),Bar_run.get_max())
	walk_run(isactiverun)
	$AnimationTree['parameters/run/blend_amount'] = amountrun
	$AnimationTree['parameters/idle_walk/blend_position'] = Vector2(motion.x,lightning)
	motion = move_and_slide_with_snap(motion,Vector2(0,-1), Vector2(0,6666))
	stamina_run(delta)
	
	for a in $Area2DKeys.get_overlapping_areas():
		if a.is_in_group('grkeys') and ispickup:
			a.queue()
		elif a.is_in_group('grdoorsexit') and ispickup:
			a.next_map()
		elif a.is_in_group('grdoorenter') and ispickup:
			if s_globals.keys.has(a.door_name):
				a.door_open(a.door_name)
			else:
				print('not key')


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
		ispickup = true
	elif event.is_action_released("ui_pickup"):
		ispickup = false
	if event.is_action_pressed("ui_flashlight"):
		flashlight()


func stamina_run(delta : float) -> void:
	if s_globals.currentstamina < Bar_run.get_max() and !isactiverun and indexspeed < 2:
		s_globals.currentstamina += regspeedstamina * delta
	elif s_globals.currentstamina < Bar_run.get_max() and !isactiverun and indexspeed == 2:
		s_globals.currentstamina += (regspeedstamina * 2) * delta
	elif isactiverun:
		s_globals.currentstamina -= minuscurrentstamina
		if s_globals.currentstamina < 0:
			isactiverun = false
	Bar_run.value = s_globals.currentstamina




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


func init(pos):
	self.position = pos


