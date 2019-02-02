extends Node

var dialogtext : Array = [tr('Player_message_place_023_0'),
			tr('Player_message_place_023_1'),
			tr('Player_message_place_023_2'),
			tr('Player_message_place_023_3')]


func _ready():
	print(dialogtext)



func _input(event):
	var asd = event in InputEventScreenTouch
	if asd:
		$Label.text = 'click touch'
