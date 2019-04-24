extends Node

var keys : Array
var keyfinal : String = ''
var posPlayer : Array
var isreadystart : bool
var currentstamina : float
var is_enter_pos : bool
var is_spawn_npc : bool
var is_ready_pos_player : bool
var is_ready_setting_sound : bool
var is_keys_final_doors : bool
var is_glow_start_room_023_exit : bool
var is_os_android :bool = false
var is_help_accept : bool = false

func _ready() -> void:
	OS_name()
	is_glow_start_room_023_exit = true
	is_keys_final_doors = true
	currentstamina = 100
	isreadystart = true
	is_spawn_npc = true
	is_ready_pos_player = false
	is_ready_setting_sound = true
	keys = []
#	keyfinal = 'final'
#	keys = ['DrDandy','023']
#	keys = ['Hell','Book','DrDandy']
	
	for i in range(30):
		posPlayer.append(false)
	posPlayer[15] = true
	

func OS_name():
	if OS.get_name() == 'Android':
		is_os_android = true
	else:
		is_os_android = false

