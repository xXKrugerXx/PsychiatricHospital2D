extends Node

var keys : Array
var posPlayer : Array
var isreadystart : bool
var currentstamina : float
var is_enter_pos : bool
var is_spawn_npc : bool

func _ready() -> void:
	currentstamina = 100
	isreadystart = true
	is_spawn_npc = true
	keys = []
	
	for i in range(30):
		posPlayer.append(false)
	posPlayer[15] = true