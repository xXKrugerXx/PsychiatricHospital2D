extends Node

var keys : Array
var posPlayer : Array
var isreadystart : bool
var currentstamina : float

func _ready() -> void:
	currentstamina = 100
	isreadystart = true
	keys = ['023']
	
	for i in range(30):
		posPlayer.append(0)
	posPlayer[0] = 1