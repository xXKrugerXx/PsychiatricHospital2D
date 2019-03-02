extends Node

const npc = preload("res://Screens/Npc.tscn")
const player = preload("res://Screens/Player.tscn")
const key_st = preload("res://Screens/shine_key_st.tscn")
const keys = preload("res://Screens/Keys.tscn")
const keys_y : int = 462

func _ready():
	randomize()
	var n = npc.instance()
	var p = player.instance()
	var key = keys.instance()
	
	if get_name() == 'Room023':
		if s_globals.is_spawn_npc and !s_globals.is_ready_pos_player:
			n.init(Vector2(969.525,364.753))
			p.init(Vector2(1169.53,366.306))
			var k1 = key_st.instance()
			var k2 = key_st.instance()
			k1.init(Vector2(171.792,470), 23,'Hell',true)
			k2.init(Vector2(1600,470), 12,'Book',true)
			add_child(k1)
			add_child(k2)
			add_child(n)
			add_child(p)
			s_globals.is_spawn_npc = false
		elif s_globals.is_ready_pos_player:
			p.init(Vector2(1169.53,366.306))
			add_child(p)
		else:
			if !s_globals.keys.has('012'):
				var k2 = key_st.instance()
				k2.init(Vector2(1600,470), 12,'',true)
				add_child(k2)
			p.init(Vector2(1450.53,366.306))
			add_child(p)
	elif get_name() == 'Room012':
		if !s_globals.keys.has('041'):
			key.init(Vector2(rand_range(40,1870),keys_y), 41,'',true)
			add_child(key)
		p.init(Vector2(640,366.306))
		add_child(p)
	elif get_name() == 'Room041':
		if !s_globals.keys.has('032'):
			key.init(Vector2(rand_range(40,1870),keys_y), 32,'',true)
			add_child(key)
		p.init(Vector2(806,366.306))
		add_child(p)
	elif get_name() == 'Room032':
		if !s_globals.keys.has('031'):
			key.init(Vector2(rand_range(40,1870),keys_y), 31,'',true)
			add_child(key)
		p.init(Vector2(1310,366.306))
		add_child(p)
	elif get_name() == 'Room031':
		if !s_globals.keys.has('001'):
			key.init(Vector2(rand_range(40,1870),keys_y), 1,'',true)
			add_child(key)
		p.init(Vector2(1480,366.306))
		add_child(p)
	elif get_name() == 'Room001':
		if !s_globals.keys.has('001'):
			key.init(Vector2(rand_range(40,1870),keys_y), 1,'',true)
			add_child(key)
		p.init(Vector2(450,366.306))
		add_child(p)
	
	
	
	
	
	
	
	
	
		


