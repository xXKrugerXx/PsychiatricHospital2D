extends Node

var keys : Array
var keyfinal : String = ''
var posPlayer : Array
var isreadystart : bool
var currentstamina : float
var is_enter_pos : bool
var is_spawn_npc : bool
var is_ready_pos_player : bool

func _ready() -> void:
	currentstamina = 100
	isreadystart = true
	is_spawn_npc = true
	is_ready_pos_player = false
	keys = []
#	keys = ['DrDandy','023']
#	keys = ['Hell','Book','DrDandy']
	
	for i in range(30):
		posPlayer.append(false)
	posPlayer[15] = true