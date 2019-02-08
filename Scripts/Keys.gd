extends Area2D

export(int) var key_index = 0

func queue():
	s_globals.keys.append(str(key_index))
	self.queue_free()