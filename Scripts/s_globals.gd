extends Node

var keys : Array
var isreadystart : bool
var currentstamina : float

func _ready() -> void:
	currentstamina = 100
	isreadystart = true
	keys = ['023']