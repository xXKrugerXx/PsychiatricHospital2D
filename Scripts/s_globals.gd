extends Node

var keys : Array
var posPlayer : Array
var isreadystart : bool
var currentstamina : float
var is_enter_pos : bool

func _ready() -> void:
	currentstamina = 100
	isreadystart = true
	keys = ['023']
	
	for i in range(30):
		posPlayer.append(false)
	posPlayer[0] = true