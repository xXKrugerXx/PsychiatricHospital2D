extends Area2D

export var key_index : int = 0
export var key_index_name : String = ''
export var is_boo_index : bool = true

func queue() -> void:
	if is_boo_index:
		if key_index < 10:
			s_globals.keys.append('00' + str(key_index))
		elif key_index < 100:
			s_globals.keys.append('0' + str(key_index))
	else:
		s_globals.keys.append(key_index_name)
	print('key queue')
	self.queue_free()
	
func init(pos : Vector2, key : int, name : String, boo_index : bool) -> void:
	self.position = pos
	self.key_index = key
	self.key_index_name = name
	self.is_boo_index = boo_index