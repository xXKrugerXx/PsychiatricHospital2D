extends Node

var arrstairs : Array = [0,0,0]
var arrsignalstairs : Array = []

func _ready():
	for s in $signalstairs.get_children():
		s.connect('signalstairs',self,'fsignalstairs')
	for st in $stairs.get_children():
		for c in st.get_children():
			arrsignalstairs.append(c)





func fsignalstairs(index):
	match index:
		0:
			if arrstairs[0] == 0:
				arrstairs[0] +=1
				$stairs/stairs00R.set_collision_layer_bit(1,true)
			else:
				arrstairs[0] -= 1
				$stairs/stairs00R.set_collision_layer_bit(1,false)
				