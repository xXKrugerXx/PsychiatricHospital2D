extends StaticBody2D

export(int) var max_enemis = 3
export(float, 0, 5, 0.2) var timer_ready = 1.4
export(float, 0, 5, 0.2) var timer_wait_spawns = 1.4

const arrenemies : Array = [
		preload("res://Screens/enemies/enemy1.tscn"),
		preload("res://Screens/enemies/enemy2.tscn"),
		preload("res://Screens/enemies/enemy3.tscn"),
		preload("res://Screens/enemies/enemy4.tscn")]

var parent_spawn := null

func _ready():
	randomize()
	$Timer_ready.wait_time = timer_ready
	$Timer_wait_spawns.wait_time = timer_wait_spawns
	parent_spawn = get_parent().get_node('spawns')


func spawns():
	var r = randi() % arrenemies.size()
	var e = arrenemies[r].instance()
	var size = $CollisionShape2D.shape.extents
	var pos : Vector2
	pos.x = (randi() % int(size.x*2)) - (size.x*2/2)
	pos.y = (randi() % int(size.y*2)) - (size.y*2/2)
	e.init(pos)
	parent_spawn.add_child(e)

func _on_Timer_wait_spawns_timeout():
	spawns()

func _on_Timer_ready_timeout():
	if parent_spawn.get_child_count() < max_enemis:
		$Timer_wait_spawns.start()
	else:
		$Timer_wait_spawns.stop()
