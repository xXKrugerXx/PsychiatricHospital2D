extends KinematicBody2D

const walk_speed : int = 200
const run_speed : int = 380 #380
const gravity : int = 400
export(float, 0, 5,0.1) var regspeedstamina = 1.5 # 1.5
export(float, 0, 5,0.1) var minuscurrentstamina = 0.2

onready var Bar_run = $HUDcharacter/BarRun/TextureProgress  as TextureProgress

onready var hudlabelkeys = $HUDcharacter/tablekeys/LabelKeys as Label


const tex_arr_flaslight : Array = [preload("res://Textures/touch/Flashlight_0.png"),
						preload("res://Textures/touch/Flashlight_1.png")]


const tex_arr_flasli_L_R : Array = [preload("res://Textures/particles/light lanternright_new.png"),
						preload("res://Textures/particles/light lanternleft_new.png")]


var lightning : int
var speed : float = 0
var amountrun : int
var motion : Vector2

var indexspeed : int
var isflashlight : bool
var isactiverun : bool
var ispickup_wait : bool
var ishudkeys : bool
var ishudkeyswait : bool

func _ready():
	indexspeed = 2
	lightning = 0
	amountrun = 0
	isactiverun = false
	isflashlight = true
	ispickup_wait = true
	ishudkeys = true
	ishudkeyswait = true
	
	###########HUD####################
	Bar_run.value = s_globals.currentstamina
	hudlabelkeys.text = tr('Door_keys')
	$HUDcharacter/messageDoorKeys.hide()
	$HUDcharacter/tablekeys.modulate = Color(1,1,1,0)
	
	###########GROUP####################
#	yield(get_tree(),"idle_frame")
#	get_tree().call_group('enemy', 'tragetplayer', self)

func _process(delta : float) -> void:
	get_tree().call_group('enemy', 'tragetplayer', self)
	
	for i in $HUDcharacter/tablekeys/HUDTableKeys/GridContainer.get_children():
		if i.get_name() in s_globals.keys:
			i.modulate = Color8(255,255,255,255)
		else:
			i.modulate = Color8(60,60,60,255)

func _physics_process(delta : float) -> void:
	motion.y += gravity * delta
	motion.x = speed
	s_globals.currentstamina = clamp(s_globals.currentstamina,Bar_run.get_min(),Bar_run.get_max())
	walk_run(isactiverun)
	$AnimationTree['parameters/run/blend_amount'] = amountrun
	$AnimationTree['parameters/idle_walk/blend_position'] = Vector2(motion.x,lightning)
	motion = move_and_slide_with_snap(motion,
		Vector2(0,256),
		Vector2(0,-1), true,
		4,0.785398)
	stamina_run(delta)
	


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
		update_pickup()
	if event.is_action_pressed("ui_flashlight"):
		flashlight()
	
	if event.is_action_pressed('ui_keys'):
		hudkeyshow()


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

func init(pos) -> void:
	self.position = pos

func messagenokey() -> void:
	$HUDcharacter/messageDoorKeys.show()
	$HUDcharacter/messageDoorKeys/labelmessage.text = tr('No_keys')
	$HUDcharacter/messageDoorKeys/Tweenmessage.interpolate_property($HUDcharacter/messageDoorKeys,
						'modulate',Color8(255,255,255,0),
						Color8(255,255,255,255),0.5,
						Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$HUDcharacter/messageDoorKeys/Tweenmessage.start()
	yield($HUDcharacter/messageDoorKeys/Tweenmessage,"tween_completed")
	$HUDcharacter/messageDoorKeys/Tweenmessage.interpolate_property($HUDcharacter/messageDoorKeys,
						'modulate',Color8(255,255,255,255),
						Color8(255,255,255,0),0.4,
						Tween.TRANS_SINE,Tween.EASE_IN_OUT)
	$HUDcharacter/messageDoorKeys/Tweenmessage.start()


func hudkeyshow() -> void:
	if ishudkeys == true and ishudkeyswait:
		ishudkeys = false
		ishudkeyswait = false
		$HUDcharacter/Tweentablekeys.interpolate_property($HUDcharacter/tablekeys,
						'modulate',
						Color8(255,255,255,0),
						Color8(255,255,255,255),
						1.0,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
		$HUDcharacter/Tweentablekeys.start()
		yield($HUDcharacter/Tweentablekeys,"tween_completed")
		ishudkeyswait = true
	elif ishudkeys == false and ishudkeyswait:
		ishudkeys = true
		ishudkeyswait = false
		$HUDcharacter/Tweentablekeys.interpolate_property($HUDcharacter/tablekeys,
						'modulate',
						Color8(255,255,255,255),
						Color8(255,255,255,0),
						1.0,Tween.TRANS_SINE,Tween.EASE_IN_OUT)
		$HUDcharacter/Tweentablekeys.start()
		yield($HUDcharacter/Tweentablekeys,"tween_completed")
		ishudkeyswait = true


func death():
	get_tree().call_group('world','readygame')
	self.queue_free()

func update_pickup():
	for a in $Area2DKeys.get_overlapping_areas():
		if a.is_in_group('grkeys') and ispickup_wait:
			ispickup_wait = false
			$Timerwait_pickup.start()
			a.queue()
			yield($Timerwait_pickup,"timeout")
			ispickup_wait = true
		elif a.is_in_group('grdoorsexit') and ispickup_wait:
			$Timerwait_pickup.start()
			ispickup_wait = false
			s_globals.is_enter_pos = false
			if s_globals.keys.has(a.get_name()):
				a.next_map()
			else:
				messagenokey()
			yield($Timerwait_pickup,"timeout")
			ispickup_wait = true
		elif a.is_in_group('grdoorenter') and ispickup_wait:
			$Timerwait_pickup.start()
			ispickup_wait = false
			if s_globals.keys.has(a.door_name):
				s_globals.is_enter_pos = true
				s_globals.is_ready_pos_player = false
				a.door_open(a.door_name)

			elif s_globals.keyfinal == 'final':
				a.door_open(a.door_name)
			else:
				messagenokey()
			yield($Timerwait_pickup,"timeout")
			ispickup_wait = true

