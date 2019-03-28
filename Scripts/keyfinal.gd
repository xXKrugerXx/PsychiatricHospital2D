extends Area2D

func init(pos : Vector2) -> void:
	self.global_position = pos

func queue() -> void:
	s_globals.keyfinal = 'final'
	s_globals.is_keys_final_doors = false
	if s_globals.keys.has('DrDandy'):
		get_tree().call_group('rooms','active_anim')
	queue_free()
