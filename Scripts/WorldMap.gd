extends Node

var arrstairs : Array = [0,0,0]

func _ready():
	for s in $signalstairs.get_children():
		s.connect('signalstairs',self,'fsignalstairs')
	arrstairs[1] = -1
	
	print(arrstairs)






func fsignalstairs(index):
	match index:
		0:
			print('asd')