extends Node

const npc = preload("res://Screens/Npc.tscn")
const player = preload("res://Screens/Player.tscn")
const key_st = preload("res://Screens/shine_key_st.tscn")

func _ready():
	var n = npc.instance()
	var p = player.instance()
	var k = key_st.instance()
	if get_name() == 'Room023':
		if s_globals.is_spawn_npc:
			n.init(Vector2(969.525,364.753))
			p.init(Vector2(1169.53,366.306))
			k.init(Vector2(171.792,472.84))
			add_child(n)
			add_child(p)
			add_child(k)
			s_globals.is_spawn_npc = false
		else:
			p.init(Vector2(1450.53,366.306))
			add_child(p)


