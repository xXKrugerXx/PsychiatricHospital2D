extends Node

export(float, 0, 5, 0.2) var timer_ready = 1.4
export(float, 0, 5, 0.2) var timer_wait_spawns = 1.4
export(int) var max_spawns = 1

const cameraGO : = preload("res://Screens/Camera2DGame_over.tscn")

const arrenemies : Array = [
		preload("res://Screens/enemies/enemy1.tscn"),
		preload("res://Screens/enemies/enemy2.tscn"),
		preload("res://Screens/enemies/enemy3.tscn"),
		preload("res://Screens/enemies/enemy4.tscn")]

const arrenemisfinal : Array = [
		preload("res://Screens/enemies/enemy1final.tscn"),
		preload("res://Screens/enemies/enemy2final.tscn"),
		preload("res://Screens/enemies/enemy3final.tscn")]

var arrsignalstairs : Array = []
var arrstairs : Array = []
var arrplayerpos : Array = []
var arrstairslayrs : Array = []

var self_randomspawns_pos
var self_randomspawns_pos_colli

const player := preload("res://Screens/Player.tscn")

func _ready() -> void:
	randomize()
	var p = player.instance()
	for s in $signalstairs.get_children():
		s.connect('signalstairs',self,'fsignalstairs')
	
	for st in $stairs.get_children():
		arrsignalstairs.append(st)
	
	for arstairs in range(11):
		arrstairs.append(0)
	
	for pos in $posdoor.get_children():
		arrplayerpos.append(pos)
	
	for doors in $doors.get_children():
		if not doors is Area2D:
			continue
		if s_globals.posPlayer[doors.get_index()] == true:
			p.init(arrplayerpos[doors.index_pos].position)
			add_child(p)
	
	for slayr in $stairslayrs.get_children():
		arrstairslayrs.append(slayr)
	
	$Timer_ready.wait_time = timer_ready
	$Timer_wait_spawns.wait_time = timer_wait_spawns
	self_randomspawns_pos = $randomspawns.global_position
	self_randomspawns_pos_colli = $randomspawns/CollisionShape2D.shape.extents
	
	if s_globals.keyfinal == 'final':
		max_spawns = 0
		for e in range(3):
			var s1 = arrenemisfinal[e].instance()
			s1.init($Pos2Dfinal.global_position)
			$spawns.add_child(s1)

func fsignalstairs(index : int) -> void:
	match index:
		0:
			if arrstairs[0] == 0:
				arrstairs[0] += 1
				arrsignalstairs[0].set_collision_layer_bit(1,false)
				arrsignalstairs[1].set_collision_layer_bit(1,true)
				arrsignalstairs[2].set_collision_layer_bit(1,true)
				arrstairslayrs[8].z_index = 3
			else:
				arrstairs[0] -= 1
				arrsignalstairs[0].set_collision_layer_bit(1,true)
				arrsignalstairs[1].set_collision_layer_bit(1,false)
				arrsignalstairs[2].set_collision_layer_bit(1,false)
				arrstairslayrs[8].z_index = 5
				arrstairslayrs[7].z_index = 3
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
				arrstairslayrs[7].z_index = 5
				arrstairslayrs[6].z_index = 3
			else:
				arrstairs[1] -= 2
				arrsignalstairs[0].set_collision_layer_bit(1,true)
				arrsignalstairs[1].set_collision_layer_bit(1,false)
				arrsignalstairs[2].set_collision_layer_bit(1,false)
				arrstairslayrs[7].z_index = 3
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
				arrstairslayrs[6].z_index = 5
				arrstairslayrs[5].z_index = 3
			else:
				arrstairs[2] -= 2
				arrsignalstairs[2].set_collision_layer_bit(1,true)
				arrsignalstairs[3].set_collision_layer_bit(1,false)
				arrsignalstairs[4].set_collision_layer_bit(1,false)
				arrstairslayrs[6].z_index = 3
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
				arrstairslayrs[5].z_index = 5
				arrstairslayrs[4].z_index = 3
			else:
				arrstairs[3] -= 2
				arrsignalstairs[4].set_collision_layer_bit(1,true)
				arrsignalstairs[5].set_collision_layer_bit(1,false)
				arrsignalstairs[6].set_collision_layer_bit(1,false)
				arrstairslayrs[5].z_index = 3
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
				arrstairslayrs[4].z_index = 5
			else:
				arrstairs[4] -= 2
				arrsignalstairs[6].set_collision_layer_bit(1,true)
				arrsignalstairs[7].set_collision_layer_bit(1,false)
				arrsignalstairs[8].set_collision_layer_bit(1,false)
				arrstairslayrs[4].z_index = 3
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
				arrstairslayrs[3].z_index = 5
				arrstairslayrs[2].z_index = 3
			else:
				arrstairs[6] -= 1
				arrsignalstairs[10].set_collision_layer_bit(1,false)
				arrsignalstairs[11].set_collision_layer_bit(1,true)
				arrsignalstairs[12].set_collision_layer_bit(1,true)
				arrstairslayrs[3].z_index = 3
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
				arrstairslayrs[2].z_index = 5
				arrstairslayrs[1].z_index = 3
			else:
				arrstairs[7] -= 2
				arrsignalstairs[10].set_collision_layer_bit(1,true)
				arrsignalstairs[11].set_collision_layer_bit(1,false)
				arrsignalstairs[12].set_collision_layer_bit(1,false)
				arrstairslayrs[2].z_index = 3
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
				arrstairslayrs[1].z_index = 5
				arrstairslayrs[0].z_index = 3
			else:
				arrstairs[8] -= 2
				arrsignalstairs[12].set_collision_layer_bit(1,true)
				arrsignalstairs[13].set_collision_layer_bit(1,false)
				arrsignalstairs[14].set_collision_layer_bit(1,false)
				arrstairslayrs[1].z_index = 3
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
				arrstairslayrs[0].z_index = 5
			else:
				arrstairs[9] -= 2
				arrsignalstairs[14].set_collision_layer_bit(1,true)
				arrsignalstairs[15].set_collision_layer_bit(1,false)
				arrsignalstairs[16].set_collision_layer_bit(1,false)
				arrstairslayrs[0].z_index = 3
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
			arrstairslayrs[7].z_index = 3
		21:
			arrstairs[2] = 2
			arrstairs[1] = 2
			arrstairslayrs[7].z_index = 5
		22:
			arrstairs[3] = 2
			arrstairs[2] = 2
			arrstairs[1] = 2
			arrstairslayrs[5].z_index = 3
			arrstairslayrs[6].z_index = 5
			arrsignalstairs[5].set_collision_layer_bit(1,true)
		23:
			arrstairs[4] = 2
			arrstairs[3] = 2
			arrstairs[2] = 2
			arrstairs[1] = 2
			arrstairslayrs[5].z_index = 5
		24:
			arrstairs[5] = 1
			arrstairs[4] = 2
			arrstairs[3] = 2
			arrstairs[2] = 2
			arrstairs[1] = 2
			arrsignalstairs[9].set_collision_layer_bit(1,true)
			arrstairslayrs[4].z_index = 5
		25:
			arrstairs[6] = 0
			arrsignalstairs[10].set_collision_layer_bit(1,false)
			arrstairslayrs[3].z_index = 3
		26:
			arrstairs[6] = 1
			arrstairs[7] = 2
			arrstairslayrs[3].z_index = 5
		27:
			arrstairs[6] = 1
			arrstairs[7] = 2
			arrstairs[8] = 2
			arrstairslayrs[1].z_index = 3
			arrstairslayrs[2].z_index = 5
			arrsignalstairs[13].set_collision_layer_bit(1,true)
		28:
			arrstairs[6] = 1
			arrstairs[7] = 2
			arrstairs[8] = 2
			arrstairs[9] = 2
			arrstairslayrs[1].z_index = 5
		29:
			arrstairs[6] = 1
			arrstairs[7] = 2
			arrstairs[8] = 2
			arrstairs[9] = 2
			arrstairs[10] = 1
			arrsignalstairs[17].set_collision_layer_bit(1,true)
			arrstairslayrs[0].z_index = 5

func spawns():
	var r = randi() % arrenemies.size()
	var s = arrenemies[r].instance()
	var xsizest = self_randomspawns_pos.x - self_randomspawns_pos_colli.x
	var xsizeend = self_randomspawns_pos.x + self_randomspawns_pos_colli.x
	var ysizest = self_randomspawns_pos.y - self_randomspawns_pos_colli.y
	var ysizeend = self_randomspawns_pos.y + self_randomspawns_pos_colli.y
	var posxrandom = rand_range(xsizest,xsizeend)
	var posyrandom = rand_range(ysizest,ysizeend)
	s.init(Vector2(posxrandom,posyrandom))
	$spawns.add_child(s)

func _on_Timer_ready_timeout():
	if $spawns.get_child_count() < max_spawns:
		$Timer_wait_spawns.start()
	else:
		$Timer_wait_spawns.stop()


func _on_Timer_wait_spawns_timeout():
	spawns()

func readygame():
	var p = get_tree().get_nodes_in_group('player')[0].global_position
	var c = cameraGO.instance()
	c.init(Vector2(p.x,p.y-90))
	add_child(c)
