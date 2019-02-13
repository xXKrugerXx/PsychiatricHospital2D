extends Node

var arrsignalstairs : Array = []
var arrstairs : Array = []

func _ready() -> void:
	for s in $signalstairs.get_children():
		s.connect('signalstairs',self,'fsignalstairs')
	
	for st in $stairs.get_children():
		arrsignalstairs.append(st)
	
	for arstairs in range(11):
		arrstairs.append(0)


func fsignalstairs(index : int) -> void:
	match index:
		0:
			if arrstairs[0] == 0:
				arrstairs[0] += 1
				arrsignalstairs[0].set_collision_layer_bit(1,false)
				arrsignalstairs[1].set_collision_layer_bit(1,true)
				arrsignalstairs[2].set_collision_layer_bit(1,true)
			else:
				arrstairs[0] -= 1
				arrsignalstairs[0].set_collision_layer_bit(1,true)
				arrsignalstairs[1].set_collision_layer_bit(1,false)
				arrsignalstairs[2].set_collision_layer_bit(1,false)
		1:
			if arrstairs[1] == 0:
				arrstairs[1] += 1
				arrsignalstairs[0].set_collision_layer_bit(1,false)
				arrsignalstairs[1].set_collision_layer_bit(1,true)
				arrsignalstairs[2].set_collision_layer_bit(1,false)
			elif arrstairs[1] == 1:
				arrstairs[1] += 1
				arrsignalstairs[0].set_collision_layer_bit(1,false)
				arrsignalstairs[1].set_collision_layer_bit(1,false)
				arrsignalstairs[2].set_collision_layer_bit(1,true)
				arrsignalstairs[3].set_collision_layer_bit(1,false)
				arrsignalstairs[4].set_collision_layer_bit(1,false)
			else:
				arrstairs[1] -= 2
				arrsignalstairs[0].set_collision_layer_bit(1,true)
				arrsignalstairs[1].set_collision_layer_bit(1,false)
				arrsignalstairs[2].set_collision_layer_bit(1,false)
		2:
			if arrstairs[2] == 0:
				arrstairs[2] += 1
				arrsignalstairs[2].set_collision_layer_bit(1,false)
				arrsignalstairs[3].set_collision_layer_bit(1,true)
				arrsignalstairs[4].set_collision_layer_bit(1,false)
			elif arrstairs[2] == 1:
				arrstairs[2] += 1
				arrsignalstairs[2].set_collision_layer_bit(1,false)
				arrsignalstairs[3].set_collision_layer_bit(1,false)
				arrsignalstairs[4].set_collision_layer_bit(1,true)
				arrsignalstairs[5].set_collision_layer_bit(1,false)
				arrsignalstairs[6].set_collision_layer_bit(1,false)
			else:
				arrstairs[2] -= 2
				arrsignalstairs[2].set_collision_layer_bit(1,true)
				arrsignalstairs[3].set_collision_layer_bit(1,false)
				arrsignalstairs[4].set_collision_layer_bit(1,false)
		3:
			if arrstairs[3] == 0:
				arrstairs[3] += 1
				arrsignalstairs[4].set_collision_layer_bit(1,false)
				arrsignalstairs[5].set_collision_layer_bit(1,true)
				arrsignalstairs[6].set_collision_layer_bit(1,false)
			elif arrstairs[3] == 1:
				arrstairs[3] += 1
				arrsignalstairs[4].set_collision_layer_bit(1,false)
				arrsignalstairs[5].set_collision_layer_bit(1,false)
				arrsignalstairs[6].set_collision_layer_bit(1,true)
				arrsignalstairs[7].set_collision_layer_bit(1,false)
				arrsignalstairs[8].set_collision_layer_bit(1,false)
			else:
				arrstairs[3] -= 2
				arrsignalstairs[4].set_collision_layer_bit(1,true)
				arrsignalstairs[5].set_collision_layer_bit(1,false)
				arrsignalstairs[6].set_collision_layer_bit(1,false)
		4:
			if arrstairs[4] == 0:
				arrstairs[4] += 1
				arrsignalstairs[6].set_collision_layer_bit(1,false)
				arrsignalstairs[7].set_collision_layer_bit(1,true)
				arrsignalstairs[8].set_collision_layer_bit(1,false)
			elif arrstairs[4] == 1:
				arrstairs[4] += 1
				arrsignalstairs[6].set_collision_layer_bit(1,false)
				arrsignalstairs[7].set_collision_layer_bit(1,false)
				arrsignalstairs[8].set_collision_layer_bit(1,true)
				arrsignalstairs[9].set_collision_layer_bit(1,false)
			else:
				arrstairs[4] -= 2
				arrsignalstairs[6].set_collision_layer_bit(1,true)
				arrsignalstairs[7].set_collision_layer_bit(1,false)
				arrsignalstairs[8].set_collision_layer_bit(1,false)
		5:
			if arrstairs[5] == 0:
				arrstairs[5] += 1
				arrsignalstairs[8].set_collision_layer_bit(1,false)
				arrsignalstairs[9].set_collision_layer_bit(1,true)
			else:
				arrstairs[5] -= 1
				arrsignalstairs[8].set_collision_layer_bit(1,true)
				arrsignalstairs[9].set_collision_layer_bit(1,false)
		6:
			if arrstairs[6] == 0:
				arrstairs[6] += 1
				arrsignalstairs[10].set_collision_layer_bit(1,true)
				arrsignalstairs[11].set_collision_layer_bit(1,false)
				arrsignalstairs[12].set_collision_layer_bit(1,false)
			else:
				arrstairs[6] -= 1
				arrsignalstairs[10].set_collision_layer_bit(1,false)
				arrsignalstairs[11].set_collision_layer_bit(1,true)
				arrsignalstairs[12].set_collision_layer_bit(1,true)
		7:
			if arrstairs[7] == 0:
				arrstairs[7] += 1
				arrsignalstairs[10].set_collision_layer_bit(1,false)
				arrsignalstairs[11].set_collision_layer_bit(1,true)
				arrsignalstairs[12].set_collision_layer_bit(1,false)
			elif arrstairs[7] == 1:
				arrstairs[7] += 1
				arrsignalstairs[10].set_collision_layer_bit(1,false)
				arrsignalstairs[11].set_collision_layer_bit(1,false)
				arrsignalstairs[12].set_collision_layer_bit(1,true)
				arrsignalstairs[13].set_collision_layer_bit(1,false)
				arrsignalstairs[14].set_collision_layer_bit(1,false)
			else:
				arrstairs[7] -= 2
				arrsignalstairs[10].set_collision_layer_bit(1,true)
				arrsignalstairs[11].set_collision_layer_bit(1,false)
				arrsignalstairs[12].set_collision_layer_bit(1,false)
		8:
			if arrstairs[8] == 0:
				arrstairs[8] += 1
				arrsignalstairs[12].set_collision_layer_bit(1,false)
				arrsignalstairs[13].set_collision_layer_bit(1,true)
				arrsignalstairs[14].set_collision_layer_bit(1,false)
			elif arrstairs[8] == 1:
				arrstairs[8] += 1
				arrsignalstairs[12].set_collision_layer_bit(1,false)
				arrsignalstairs[13].set_collision_layer_bit(1,false)
				arrsignalstairs[14].set_collision_layer_bit(1,true)
				arrsignalstairs[15].set_collision_layer_bit(1,false)
				arrsignalstairs[16].set_collision_layer_bit(1,false)
			else:
				arrstairs[8] -= 2
				arrsignalstairs[12].set_collision_layer_bit(1,true)
				arrsignalstairs[13].set_collision_layer_bit(1,false)
				arrsignalstairs[14].set_collision_layer_bit(1,false)
		9:
			if arrstairs[9] == 0:
				arrstairs[9] += 1
				arrsignalstairs[14].set_collision_layer_bit(1,false)
				arrsignalstairs[15].set_collision_layer_bit(1,true)
				arrsignalstairs[16].set_collision_layer_bit(1,false)
			elif arrstairs[9] == 1:
				arrstairs[9] += 1
				arrsignalstairs[14].set_collision_layer_bit(1,false)
				arrsignalstairs[15].set_collision_layer_bit(1,false)
				arrsignalstairs[16].set_collision_layer_bit(1,true)
				arrsignalstairs[17].set_collision_layer_bit(1,false)
			else:
				arrstairs[9] -= 2
				arrsignalstairs[14].set_collision_layer_bit(1,true)
				arrsignalstairs[15].set_collision_layer_bit(1,false)
				arrsignalstairs[16].set_collision_layer_bit(1,false)
		10:
			if arrstairs[10] == 0:
				arrstairs[10] += 1
				arrsignalstairs[16].set_collision_layer_bit(1,false)
				arrsignalstairs[17].set_collision_layer_bit(1,true)
			else:
				arrstairs[10] -= 1
				arrsignalstairs[16].set_collision_layer_bit(1,true)
				arrsignalstairs[17].set_collision_layer_bit(1,false)
		20:
			arrstairs[1] = 2
		21:
			arrstairs[2] = 2
			arrstairs[1] = 2
		22:
			arrstairs[3] = 2
			arrstairs[2] = 2
			arrstairs[1] = 2
		23:
			arrstairs[4] = 2
			arrstairs[3] = 2
			arrstairs[2] = 2
			arrstairs[1] = 2
		24:
			arrstairs[5] = 1
			arrstairs[4] = 2
			arrstairs[3] = 2
			arrstairs[2] = 2
			arrstairs[1] = 2
		25:
			arrstairs[6] = 1
			arrstairs[7] = 2
		26:
			arrstairs[6] = 1
			arrstairs[7] = 2
			arrstairs[8] = 2
		27:
			arrstairs[6] = 1
			arrstairs[7] = 2
			arrstairs[8] = 2
			arrstairs[9] = 2
		28:
			arrstairs[6] = 1
			arrstairs[7] = 2
			arrstairs[8] = 2
			arrstairs[9] = 2
			arrstairs[10] = 1






