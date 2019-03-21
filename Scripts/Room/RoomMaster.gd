extends Node

export var flashlighning_x3_or_x4 : bool = false

const anim_name : Array = [
	'st_flashlighning_x4_r1',
	'st_flashlighning_x4_r2',
	'st_flashlighning_x4_r3']

const anim_name1 : Array = [
	'st_flashlighning_x2_r1',
	'st_flashlighning_x2_r2',
	'st_flashlighning_x2_r3']

const npc = preload("res://Screens/Npc.tscn")
const player = preload("res://Screens/Player.tscn")
const key_st = preload("res://Screens/shine_key_st.tscn")
const keys = preload("res://Screens/Keys.tscn")
const keyfinal = preload("res://Screens/keyfinal.tscn")
const keys_y : int = 462


func _ready():
	randomize()
	var n = npc.instance()
	var p = player.instance()
	var key = keys.instance()
	var keyf = keyfinal.instance()
	
	print(AudioServer.get_bus_effect(1,0))
	
	
	
	if flashlighning_x3_or_x4:
		$AnimationPlayerflashlighning.play(anim_name1[randi() % 3])
	else:
		$AnimationPlayerflashlighning.play(anim_name[randi() % 3])
	
	if get_name() == 'Room023':
		if s_globals.is_spawn_npc and !s_globals.is_ready_pos_player:
			n.init(Vector2(969.525,364.753))
			p.init(Vector2(1169.53,366.306))
			var k1 = key_st.instance()
			var k2 = key_st.instance()
			k1.init(Vector2(171.792,470), 23,'',true)
			k2.init(Vector2(1600,470), 12,'',true)
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
			key.init(Vector2(rand_range(40,1180),keys_y), 1,'',true)
			add_child(key)
		p.init(Vector2(1480,366.306))
		add_child(p)
	elif get_name() == 'Room001':
		if !s_globals.keys.has('Book'):
			key.init(Vector2(rand_range(40,1870),keys_y), 1,'Book',false)
			add_child(key)
		p.init(Vector2(450,366.306))
		add_child(p)
	elif get_name() == 'RoomBookCard':
		if !s_globals.keys.has('005'):
			key.init(Vector2(rand_range(40,1010),keys_y), 5,'',true)
			add_child(key)
		p.init(Vector2(760,366.306))
		add_child(p)
	elif get_name() == 'Room005':
		if !s_globals.keys.has('034'):
			key.init(Vector2(rand_range(40,1870),keys_y), 34,'',true)
			add_child(key)
		p.init(Vector2(880,366.306))
		add_child(p)
	elif get_name() == 'Room034':
		if !s_globals.keys.has('013'):
			key.init(Vector2(rand_range(260,1870),keys_y), 13,'',true)
			add_child(key)
		p.init(Vector2(130,366.306))
		add_child(p)
	elif get_name() == 'Room013':
		if !s_globals.keys.has('044'):
			key.init(Vector2(rand_range(40,1870),keys_y), 44,'',true)
			add_child(key)
		p.init(Vector2(240,366.306))
		add_child(p)
	elif get_name() == 'Room044':
		if !s_globals.keys.has('002'):
			key.init(Vector2(rand_range(40,1870),keys_y), 2,'',true)
			add_child(key)
		p.init(Vector2(1190,366.306))
		add_child(p)
	elif get_name() == 'Room002':
		if !s_globals.keys.has('033'):
			key.init(Vector2(rand_range(40,1870),keys_y), 33,'',true)
			add_child(key)
		p.init(Vector2(620,366.306))
		add_child(p)
	elif get_name() == 'Room033':
		if !s_globals.keys.has('Hell'):
			key.init(Vector2(rand_range(40,1870),keys_y), 33,'Hell',false)
			add_child(key)
		p.init(Vector2(800,366.306))
		add_child(p)
	elif get_name() == 'Roomhell':
		$AudioStreamPlayer2DKnockHeart.playing = true
		if !s_globals.keys.has('024'):
			key.init(Vector2(rand_range(40,1010),keys_y), 24,'',true)
			add_child(key)
		p.init(Vector2(350,366.306))
		add_child(p)
	elif get_name() == 'Room024':
		if !s_globals.keys.has('043'):
			key.init(Vector2(rand_range(40,1870),keys_y), 43,'',true)
			add_child(key)
		p.init(Vector2(470,366.306))
		add_child(p)
	elif get_name() == 'Room043':
		if !s_globals.keys.has('015'):
			key.init(Vector2(rand_range(40,1870),keys_y), 15,'',true)
			add_child(key)
		p.init(Vector2(970,366.306))
		add_child(p)
	elif get_name() == 'Room015':
		if !s_globals.keys.has('004'):
			key.init(Vector2(rand_range(40,1870),keys_y), 4,'',true)
			add_child(key)
		p.init(Vector2(440,366.306))
		add_child(p)
	elif get_name() == 'Room004':
		if !s_globals.keys.has('021'):
			key.init(Vector2(rand_range(40,1870),keys_y), 21,'',true)
			add_child(key)
		p.init(Vector2(220,366.306))
		add_child(p)
	elif get_name() == 'Room021':
		if !s_globals.keys.has('042'):
			key.init(Vector2(rand_range(40,1870),keys_y), 42,'',true)
			add_child(key)
		p.init(Vector2(850,366.306))
		add_child(p)
	elif get_name() == 'Room042':
		if !s_globals.keys.has('045'):
			key.init(Vector2(rand_range(40,1870),keys_y), 45,'',true)
			add_child(key)
		p.init(Vector2(1260,366.306))
		add_child(p)
	elif get_name() == 'Room045':
		if !s_globals.keys.has('003'):
			key.init(Vector2(rand_range(40,1870),keys_y), 3,'',true)
			add_child(key)
		p.init(Vector2(1090,366.306))
		add_child(p)
	elif get_name() == 'Room003':
		if !s_globals.keys.has('014'):
			key.init(Vector2(rand_range(40,1870),keys_y), 14,'',true)
			add_child(key)
		p.init(Vector2(390,366.306))
		add_child(p)
	elif get_name() == 'Room014':
		if !s_globals.keys.has('022'):
			key.init(Vector2(rand_range(40,1870),keys_y), 22,'',true)
			add_child(key)
		p.init(Vector2(1580,366.306))
		add_child(p)
	elif get_name() == 'Room022':
		if !s_globals.keys.has('035'):
			key.init(Vector2(rand_range(40,1870),keys_y), 35,'',true)
			add_child(key)
		p.init(Vector2(900,366.306))
		add_child(p)
	elif get_name() == 'Room035':
		if !s_globals.keys.has('025'):
			key.init(Vector2(rand_range(40,1870),keys_y), 25,'',true)
			add_child(key)
		p.init(Vector2(640,366.306))
		add_child(p)
	elif get_name() == 'Room025':
		if !s_globals.keys.has('011'):
			key.init(Vector2(rand_range(40,1870),keys_y), 11,'',true)
			add_child(key)
		p.init(Vector2(1130,366.306))
		add_child(p)
	elif get_name() == 'Room011':
		if !s_globals.keys.has('DrDandy'):
			key.init(Vector2(rand_range(40,1870),keys_y), 11,'DrDandy',false)
			add_child(key)
		p.init(Vector2(860,366.306))
		add_child(p)
	elif get_name() == 'RoomDrDandy':
		
		if !s_globals.keyfinal == 'final':
			keyf.init(Vector2(rand_range(910,1010),keys_y))
			add_child(keyf)
			$AnimationPlayer.play("noloop")
		else:
			$AnimationPlayer.play("loop")
		p.init(Vector2(190,366.306))
		add_child(p)

func active_anim():
	if get_name() == 'RoomDrDandy':
		$AnimationPlayer.play("loop")

