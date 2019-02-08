extends Area2D

export(int) var key_index = 0

func queue():
	if key_index < 10:
		s_globals.keys.append('00' + str(key_index))
	elif key_index < 100:
		s_globals.keys.append('0' + str(key_index))
	self.queue_free()
	
	
	
	
	
	
	
	